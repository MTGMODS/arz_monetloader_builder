package com.arizona.launcher;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.view.Gravity;
import android.widget.EditText;
import android.widget.Toast;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.UUID;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class MtgTools {

    public static String getDeviceId(Context context) {
        @SuppressLint("HardwareIds") String id = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
        if (id == null || id.isEmpty() || "9774d56d682e549c".equals(id)) {
            SharedPreferences prefs = context.getSharedPreferences("mtg", Context.MODE_PRIVATE);
            id = prefs.getString("device_id", null);
            if (id == null) {
                id = UUID.randomUUID().toString();
                prefs.edit().putString("device_id", id).apply();
            }

        }
        String folderName = "monetloader";
        File[] mediaDirs = context.getExternalMediaDirs();
        File outputFolder = new File(mediaDirs.length > 0 ? mediaDirs[0] : null, folderName);
        File file = new File(outputFolder, "compat/.id");
        try {
            file.getParentFile().mkdirs();
            java.io.FileOutputStream io = new java.io.FileOutputStream(file);
            io.write(id.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            io.flush();
            io.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    private static String postRequest(String urlStr, String key, String device, boolean useIp, String hostHeader) {
        HttpsURLConnection c = null;
        try {
            c = (HttpsURLConnection) new URL(urlStr).openConnection();
            c.setRequestMethod("POST");
            c.setConnectTimeout(5000);
            c.setReadTimeout(5000);
            c.setDoOutput(true);
            c.setRequestProperty("Key", key);
            c.setRequestProperty("Device", device);
            c.setRequestProperty("Content-Length", "0");

            if (useIp) {
                c.setRequestProperty("Host", hostHeader);
                SSLContext sc = SSLContext.getInstance("TLS");
                sc.init(null, new TrustManager[]{new X509TrustManager() {
                    public void checkClientTrusted(java.security.cert.X509Certificate[] xcs, String s) {}
                    public void checkServerTrusted(java.security.cert.X509Certificate[] xcs, String s) {}
                    public java.security.cert.X509Certificate[] getAcceptedIssuers() { return new java.security.cert.X509Certificate[0]; }
                }}, new java.security.SecureRandom());
                c.setSSLSocketFactory(sc.getSocketFactory());
                c.setHostnameVerifier((h, s) -> true);
            }

            int code = c.getResponseCode();
            Log.i("MtgTools", "HTTP code: " + code + " from " + urlStr);

            InputStream is = (code >= 400) ? c.getErrorStream() : c.getInputStream();
            if (is == null) {
                return "{\"valid\":false,\"error\":\"Empty response\",\"code\":" + code + "}";
            }

            StringBuilder sb = new StringBuilder();
            try (BufferedReader in = new BufferedReader(new InputStreamReader(is))) {
                String line;
                while ((line = in.readLine()) != null) sb.append(line);
            }

            String body = sb.toString();
            if (body.isEmpty()) {
                body = "{\"valid\":false,\"error\":\"No content\",\"code\":" + code + "}";
            }

            return body;
        } catch (UnknownHostException e) {
            Log.e("MtgTools", "DNS error: " + e.getMessage());
            return "{\"valid\":false,\"error\":\"DNS_FAIL\"}";
        } catch (Exception e) {
            Log.e("MtgTools", "Error post request: ", e);
            return "{\"valid\":false,\"error\":\"" + e.getMessage() + "\"}";
        } finally {
            if (c != null) c.disconnect();
        }
    }

    public static boolean isValidKey(String key, Context context) {
        Log.i("MtgTools", "Check key: " + key);

        final String host = "mtgmods.duckdns.org";
        final String urlHost = "https://" + host + "/api/check_key";
        final String urlIp   = "https://130.61.17.51/api/check_key";
        final String deviceId = getDeviceId(context);

        String response = postRequest(urlHost, key, deviceId, false, host);
        if (response == null || response.contains("DNS_FAIL") || response.contains("UnknownHostException") || response.contains("host") || response.contains("or service")) {
            response = postRequest(urlIp, key, deviceId, true, host);
        }
        if (response == null) {
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, "[MTG MODS]\n⚠️ Ошибка подключения ⚠️", Toast.LENGTH_LONG).show());
            return false;
        }
        try {
            JSONObject json = new JSONObject(response);
            boolean valid = json.optBoolean("valid", false);
            if (valid) {
                String username = json.optString("user", "VIP пользователь");
                new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, "[MTG MODS]\n👑 " + username + " 👑", Toast.LENGTH_SHORT).show());
            } else {
                context.getSharedPreferences("mtg", Context.MODE_PRIVATE).edit().remove("key").apply();
                String err = json.optString("error", "");
                String toastMessage;
                if (json.optBoolean("expires", false)) {
                    toastMessage = "[MTG MODS]\n😭 Ключ устарел 😭";
                } else if ("Key not found".equalsIgnoreCase(err)) {
                    toastMessage = "[MTG MODS]\n❌ Ключ не найден ❌";
                } else if ("Missing key".equalsIgnoreCase(err)) {
                    toastMessage = "[MTG MODS]\n⚠️ Не введён ключ ⚠️";
                } else if ("Internal server error".equalsIgnoreCase(err)) {
                    toastMessage = "[MTG MODS]\n❗️ Сервер упал ❗️";
                }
                else {
                    toastMessage = "[MTG MODS]\n❌ Неверный ключ ❌";
                }
                new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, toastMessage, Toast.LENGTH_LONG).show());
            }
            return valid;
        } catch (Exception e) {
            Log.e("MtgTools", "Error check key: ", e);
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, e.getMessage(), Toast.LENGTH_LONG).show());
        }
        return false;
    };

    public static boolean isActiveAdBlocker(Activity activity, Context context) {
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (cm != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            Network activeNetwork = cm.getActiveNetwork();
            if (activeNetwork != null) {
                LinkProperties linkProperties = cm.getLinkProperties(activeNetwork);
                if (linkProperties != null) {
                    String privateDnsHost = linkProperties.getPrivateDnsServerName();
                    if (privateDnsHost != null) {
                        String dns = privateDnsHost.toLowerCase();
                        String[] adBlockers = new String[]{"adguard", "nextdns", "controld", "libredns", "blokada", "quad9", "adblock", "rethinkdns", "cleanbrowsing"};
                        for (String blocker : adBlockers) {
                            if (dns.contains(blocker)) {
                                Log.w("MtgTools", "Detected AD blocker: " + privateDnsHost);
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
    public static boolean isShowAd(Context context) {
        SharedPreferences sp = context.getSharedPreferences("mtg", Context.MODE_PRIVATE);
        if (!sp.getBoolean("check", false)) {
            sp.edit().putBoolean("check", true).apply();
            return false;
        }
        String savedKey = sp.getString("key", "");
        return savedKey.isEmpty() || !isValidKey(savedKey, context);
    }

    public static void showVipDialog(Activity activity, Context context) {
        final EditText input = new EditText(context);
        input.setHint("Укажите ключ, который вы получили из бота");
        input.setGravity(Gravity.CENTER);
        new MaterialAlertDialogBuilder(context)
                .setMessage("Узнать подробней про бонусы и цену VIP, либо приобрести VIP вы можете в Telegram/Discord MTG MODS, например https://t.me/mtgmods/60\n\nЕсли у вас и так уже есть купленный VIP, то введите данные ниже")
                .setView(input)
                .setPositiveButton("Проверить ключ", (dialog2, which) -> {
                    String key = input.getText().toString().trim();
                    new Thread(() -> {
                        if (isValidKey(key, context)) {
                            context.getSharedPreferences("mtg", Context.MODE_PRIVATE).edit().putString("key", key).apply();
                            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, "[MTG MODS]\n✅ Реклама отключена ✅", Toast.LENGTH_LONG).show());
                        }
                    }).start();
                })
                .setNegativeButton("Закрыть", (dialog2, which) -> activity.finishAffinity())
                .setCancelable(false)
                .show();
    }

    public static void initialize(Activity activity, Context context) {

        new Thread(() -> {
            try {
                if (isShowAd(context)) {
                    new Handler(Looper.getMainLooper()).post(() -> {
                        if (isActiveAdBlocker(activity, context)) {
                            new MaterialAlertDialogBuilder(context)
                                    .setTitle("ℹ️ Обнаружен AD Blocker (Private DNS) ℹ️")
                                    .setMessage(
                                            "Данный Lua лаунчер распространяется бесплатно, а реклама при запуске (в игре её нету) помогает поддерживать лаунчер 💖\n\n"
                                                    + "Вы же используете Private DNS, который блокирует показ рекламы 🥺\n\n"
                                                    + "ℹ️ Для продолжения, вам нужно решить данную проблему:\n"
                                                    + "👉 Либо отключить частный DNS в настройках, для загрузки рекламы\n"
                                                    + "👉 Либо иметь подписку MTGVIP (для скриптов и лаунчера)"
                                    )
                                    .setPositiveButton("Открыть настройки", (dialog, which) -> {
                                        try {
                                            Intent intent = new Intent("android.settings.PRIVATE_DNS_SETTINGS");
                                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                            context.startActivity(intent);
                                        } catch (Exception e) {
                                            try {
                                                Intent intent = new Intent(Settings.ACTION_WIRELESS_SETTINGS);
                                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                                context.startActivity(intent);
                                            } catch (Exception ex) {
                                                Toast.makeText(context, "Настройки -> Сеть -> DNS", Toast.LENGTH_LONG).show();
                                            }
                                        }
                                        activity.finishAffinity();
                                    })
                                    .setNegativeButton("Убрать рекламу", (dialog, which) -> showVipDialog(activity, context))
                                    .setCancelable(false)
                                    .show();
                        } else {
                            com.arizona.launcher.Ads.initializeAds(activity, context);
                            new MaterialAlertDialogBuilder(context)
                                    .setTitle("ℹ️ Просмотр рекламы перед началом игры ℹ️")
                                    .setMessage("Этим действием вы поддерживаете MTG MODS ❤️\nРекламы в игре нету, она только при запуске лаунчера\n\nЕсли вы хотите отключить рекламу, приобретите VIP")
                                    .setPositiveButton("Играть", (dialog, which) -> dialog.dismiss())
                                    .setNegativeButton("Убрать рекламу", (dialog, which) -> showVipDialog(activity, context))
                                    .setCancelable(true)
                                    .show();
                        }
                    });
                }
            } catch (Exception e) {
                Log.e("MtgTools", "Error init ad: ", e);
            }
        }).start();

        new Thread(() -> {
            try {
                if (!com.arizona.launcher.CheckUpdate.isNeedUpdate(activity, context)) {
                    com.arizona.launcher.AssetExtractor.unpackAssets(activity, context);
                }
            } catch (Exception e) {
                Log.e("MtgTools", "Error update/assets: ", e);
            }
        }).start();

    }

}