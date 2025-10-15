package com.arizona.launcher;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class MtgTools {

    public static boolean isValidKey(String key, Context context) {
        try {
            Log.e("MtgTools", "Check valid key: " + key);
            URL url = new URL("https://mtgmods.duckdns.org/api/check_key?key=" + key);
            HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpsURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                in.close();
                JSONObject json = new JSONObject(response.toString());
                boolean valid = json.optBoolean("valid", false);
                if (valid) {
                    String username = json.optString("user", "VIP пользователь");
                    new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, "[MTG MODS]\n👑 " + username + " 👑", Toast.LENGTH_SHORT).show());
                } else {
                    context.getSharedPreferences("mtg", Context.MODE_PRIVATE).edit().remove("key").apply();
                    String toastMessage;
                    if (json.optBoolean("expires", false)) {
                        toastMessage = "[MTG MODS]\n😭 Ключ устарел 😭";
                    } else {
                        toastMessage = "[MTG MODS]\n❌ Неверный ключ ❌";
                    }
                    new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, toastMessage, Toast.LENGTH_LONG).show());
                }
                return valid;
            }
        } catch (Exception e) {
            Log.e("MtgTools", "Error check key: ", e);
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, "[MTG MODS]\n❗ Сервер не отвечает ❗", Toast.LENGTH_LONG).show());
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, e.getMessage(), Toast.LENGTH_LONG).show());
        }
        return false;
    };

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
            .setNegativeButton("Отмена", (dialog2, which) -> dialog2.dismiss())
            .setCancelable(false)
            .show();
    }

    public static void initialize(Activity activity, Context context) {

        new Thread(() -> {
            try {
                if (isShowAd(context)) {
                    new Handler(Looper.getMainLooper()).post(() -> {
                        com.arizona.launcher.Ads.initializeAds(activity, context);
                        new MaterialAlertDialogBuilder(context)
                            .setTitle("ℹ️ Просмотр рекламы перед началом игры ℹ️")
                            .setMessage("Этим действием вы поддерживаете MTG MODS ❤\nРекламы в игре нету, она только при запуске лаунчера\n\nЕсли вы хотите отключить рекламу, приобретите VIP")
                            .setPositiveButton("Играть", (dialog, which) -> dialog.dismiss())
                            .setNegativeButton("Убрать рекламу", (dialog, which) -> showVipDialog(activity, context))
                            .setCancelable(true)
                            .show();
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
