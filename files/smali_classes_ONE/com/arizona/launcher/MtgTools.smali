.class public Lcom/arizona/launcher/MtgTools;
.super Ljava/lang/Object;
.source "MtgTools.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initialize(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 100
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 117
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 119
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 127
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 129
    return-void
.end method

.method public static isShowAd(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .line 68
    const-string v0, "mtg"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 69
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string v2, "check"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    .line 70
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 71
    return v1

    .line 73
    :cond_0
    const-string v2, "key"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "savedKey":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v2, p0}, Lcom/arizona/launcher/MtgTools;->isValidKey(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_2

    :cond_1
    move v1, v4

    :cond_2
    return v1
.end method

.method public static isValidKey(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 13
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    const-string v0, "MtgTools"

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Check valid key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://mtgmods.duckdns.org/api/check_key?key="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 29
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljavax/net/ssl/HttpsURLConnection;

    .line 30
    .local v3, "conn":Ljavax/net/ssl/HttpsURLConnection;
    const-string v4, "GET"

    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 31
    const/16 v4, 0x1388

    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    .line 32
    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    .line 33
    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v4

    .line 34
    .local v4, "responseCode":I
    const/16 v5, 0xc8

    if-ne v4, v5, :cond_3

    .line 35
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 36
    .local v5, "in":Ljava/io/BufferedReader;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .local v6, "response":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    .local v8, "line":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 39
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 42
    new-instance v7, Lorg/json/JSONObject;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 43
    .local v7, "json":Lorg/json/JSONObject;
    const-string v9, "valid"

    invoke-virtual {v7, v9, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v9

    .line 44
    .local v9, "valid":Z
    if-eqz v9, :cond_1

    .line 45
    const-string v10, "user"

    const-string v11, "VIP \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 46
    .local v10, "username":Ljava/lang/String;
    new-instance v11, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v12

    invoke-direct {v11, v12}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v12, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda9;

    invoke-direct {v12, p1, v10}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda9;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    nop

    .end local v10    # "username":Ljava/lang/String;
    goto :goto_2

    .line 48
    :cond_1
    const-string v10, "mtg"

    invoke-virtual {p1, v10, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string v11, "key"

    invoke-interface {v10, v11}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 50
    const-string v10, "expires"

    invoke-virtual {v7, v10, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 51
    const-string v10, "[MTG MODS]\n\ud83d\ude2d \u041a\u043b\u044e\u0447 \u0443\u0441\u0442\u0430\u0440\u0435\u043b \ud83d\ude2d"

    .local v10, "toastMessage":Ljava/lang/String;
    goto :goto_1

    .line 53
    .end local v10    # "toastMessage":Ljava/lang/String;
    :cond_2
    const-string v10, "[MTG MODS]\n\u274c \u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u043a\u043b\u044e\u0447 \u274c"

    .line 55
    .restart local v10    # "toastMessage":Ljava/lang/String;
    :goto_1
    new-instance v11, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v12

    invoke-direct {v11, v12}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v12, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda10;

    invoke-direct {v12, p1, v10}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda10;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v10    # "toastMessage":Ljava/lang/String;
    :goto_2
    return v9

    .line 63
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .end local v4    # "responseCode":I
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "response":Ljava/lang/StringBuilder;
    .end local v7    # "json":Lorg/json/JSONObject;
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "valid":Z
    :cond_3
    goto :goto_3

    .line 59
    :catch_0
    move-exception v2

    .line 60
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "Error check key: "

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda11;

    invoke-direct {v3, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda11;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda12;

    invoke-direct {v3, p1, v2}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda12;-><init>(Landroid/content/Context;Ljava/lang/Exception;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 64
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_3
    return v1
.end method

.method static synthetic lambda$initialize$10(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 104
    invoke-static {p0, p1}, Lcom/arizona/launcher/Ads;->initializeAds(Landroid/app/Activity;Landroid/content/Context;)V

    .line 105
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 106
    const-string v1, "\u2139\ufe0f \u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0440\u0435\u043a\u043b\u0430\u043c\u044b \u043f\u0435\u0440\u0435\u0434 \u043d\u0430\u0447\u0430\u043b\u043e\u043c \u0438\u0433\u0440\u044b \u2139\ufe0f"

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 107
    const-string v1, "\u042d\u0442\u0438\u043c \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0435\u043c \u0432\u044b \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0435 MTG MODS \u2764\n\u0420\u0435\u043a\u043b\u0430\u043c\u044b \u0432 \u0438\u0433\u0440\u0435 \u043d\u0435\u0442\u0443, \u043e\u043d\u0430 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0435 \u043b\u0430\u0443\u043d\u0447\u0435\u0440\u0430\n\n\u0415\u0441\u043b\u0438 \u0432\u044b \u0445\u043e\u0442\u0438\u0442\u0435 \u043e\u0442\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0440\u0435\u043a\u043b\u0430\u043c\u0443, \u043f\u0440\u0438\u043e\u0431\u0440\u0435\u0442\u0438\u0442\u0435 VIP"

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda2;-><init>()V

    .line 108
    const-string v2, "\u0418\u0433\u0440\u0430\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    .line 109
    const-string v2, "\u0423\u0431\u0440\u0430\u0442\u044c \u0440\u0435\u043a\u043b\u0430\u043c\u0443"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 110
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 112
    return-void
.end method

.method static synthetic lambda$initialize$11(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 102
    :try_start_0
    invoke-static {p0}, Lcom/arizona/launcher/MtgTools;->isShowAd(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda8;

    invoke-direct {v1, p1, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :cond_0
    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "MtgTools"

    const-string v2, "Error init ad: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$initialize$12(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 121
    :try_start_0
    invoke-static {p0, p1}, Lcom/arizona/launcher/CheckUpdate;->isNeedUpdate(Landroid/app/Activity;Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    invoke-static {p0, p1}, Lcom/arizona/launcher/AssetExtractor;->unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :cond_0
    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "MtgTools"

    const-string v2, "Error update/assets: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$initialize$8(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 108
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$initialize$9(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 109
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->showVipDialog(Landroid/app/Activity;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$isValidKey$0(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "username"    # Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[MTG MODS]\n\ud83d\udc51 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \ud83d\udc51"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$isValidKey$1(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "toastMessage"    # Ljava/lang/String;

    .line 55
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$isValidKey$2(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 61
    const-string v0, "[MTG MODS]\n\u2757 \u0421\u0435\u0440\u0432\u0435\u0440 \u043d\u0435 \u043e\u0442\u0432\u0435\u0447\u0430\u0435\u0442 \u2757"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$isValidKey$3(Landroid/content/Context;Ljava/lang/Exception;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "e"    # Ljava/lang/Exception;

    .line 62
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$showVipDialog$4(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 89
    const-string v0, "[MTG MODS]\n\u2705 \u0420\u0435\u043a\u043b\u0430\u043c\u0430 \u043e\u0442\u043a\u043b\u044e\u0447\u0435\u043d\u0430 \u2705"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$showVipDialog$5(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .line 87
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->isValidKey(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    const-string v0, "mtg"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "key"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 89
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 91
    :cond_0
    return-void
.end method

.method static synthetic lambda$showVipDialog$6(Landroid/widget/EditText;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 3
    .param p0, "input"    # Landroid/widget/EditText;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialog2"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 85
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "key":Ljava/lang/String;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 91
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 92
    return-void
.end method

.method static synthetic lambda$showVipDialog$7(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog2"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 93
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static showVipDialog(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 78
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 79
    .local v0, "input":Landroid/widget/EditText;
    const-string v1, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u043a\u043b\u044e\u0447, \u043a\u043e\u0442\u043e\u0440\u044b\u0439 \u0432\u044b \u043f\u043e\u043b\u0443\u0447\u0438\u043b\u0438 \u0438\u0437 \u0431\u043e\u0442\u0430"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 80
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    .line 81
    new-instance v1, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v1, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 82
    const-string v2, "\u0423\u0437\u043d\u0430\u0442\u044c \u043f\u043e\u0434\u0440\u043e\u0431\u043d\u0435\u0439 \u043f\u0440\u043e \u0431\u043e\u043d\u0443\u0441\u044b \u0438 \u0446\u0435\u043d\u0443 VIP, \u043b\u0438\u0431\u043e \u043f\u0440\u0438\u043e\u0431\u0440\u0435\u0441\u0442\u0438 VIP \u0432\u044b \u043c\u043e\u0436\u0435\u0442\u0435 \u0432 Telegram/Discord MTG MODS, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 https://t.me/mtgmods/60\n\n\u0415\u0441\u043b\u0438 \u0443 \u0432\u0430\u0441 \u0438 \u0442\u0430\u043a \u0443\u0436\u0435 \u0435\u0441\u0442\u044c \u043a\u0443\u043f\u043b\u0435\u043d\u043d\u044b\u0439 VIP, \u0442\u043e \u0432\u0432\u0435\u0434\u0438\u0442\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u043d\u0438\u0436\u0435"

    invoke-virtual {v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 83
    invoke-virtual {v1, v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setView(Landroid/view/View;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;

    invoke-direct {v2, v0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;-><init>(Landroid/widget/EditText;Landroid/content/Context;)V

    .line 84
    const-string v3, "\u041f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c \u043a\u043b\u044e\u0447"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda7;

    invoke-direct {v2}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda7;-><init>()V

    .line 93
    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 94
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 96
    return-void
.end method
