.class public Lcom/arizona/launcher/CheckUpdate;
.super Ljava/lang/Object;
.source "CheckUpdate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isNeedUpdate(Landroid/app/Activity;Landroid/content/Context;)Z
    .locals 12
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 25
    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v2, "https://mtgmods.github.io/launcher.json"

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    move-object v2, v0

    .line 27
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v3, v0

    .line 28
    .local v3, "conn":Ljava/net/HttpURLConnection;
    const-string v0, "GET"

    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 29
    const/16 v0, 0xbb8

    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 30
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object v4, v0

    .line 33
    .local v4, "response":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    .line 34
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object v5, v0

    .line 36
    .local v5, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v6, v0

    .local v6, "line":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 37
    :try_start_2
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 33
    .end local v6    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v0

    move-object v11, p0

    move-object v7, p1

    move-object p0, v0

    goto :goto_1

    .line 39
    :cond_0
    :try_start_3
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 40
    .end local v5    # "reader":Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 42
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 43
    .local v0, "jsonObject":Lorg/json/JSONObject;
    const-string v5, "version"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v9, v5

    .line 44
    .local v9, "currentVersion":Ljava/lang/String;
    const-string v5, "url"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 46
    .local v10, "updateUrl":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v8, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 48
    .local v8, "appVersion":Ljava/lang/String;
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 49
    new-instance v6, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda0;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-object v11, p0

    move-object v7, p1

    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "context":Landroid/content/Context;
    .local v7, "context":Landroid/content/Context;
    .local v11, "activity":Landroid/app/Activity;
    :try_start_4
    invoke-direct/range {v6 .. v11}, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {v11, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 63
    const/4 p0, 0x1

    return p0

    .line 48
    .end local v7    # "context":Landroid/content/Context;
    .end local v11    # "activity":Landroid/app/Activity;
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "context":Landroid/content/Context;
    :cond_1
    move-object v11, p0

    move-object v7, p1

    .line 71
    .end local v0    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "response":Ljava/lang/StringBuilder;
    .end local v8    # "appVersion":Ljava/lang/String;
    .end local v9    # "currentVersion":Ljava/lang/String;
    .end local v10    # "updateUrl":Ljava/lang/String;
    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "context":Landroid/content/Context;
    .restart local v7    # "context":Landroid/content/Context;
    .restart local v11    # "activity":Landroid/app/Activity;
    goto :goto_4

    .line 33
    .end local v7    # "context":Landroid/content/Context;
    .end local v11    # "activity":Landroid/app/Activity;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "conn":Ljava/net/HttpURLConnection;
    .restart local v4    # "response":Ljava/lang/StringBuilder;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "context":Landroid/content/Context;
    :catchall_1
    move-exception v0

    move-object v11, p0

    move-object v7, p1

    move-object p0, v0

    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "context":Landroid/content/Context;
    .restart local v7    # "context":Landroid/content/Context;
    .restart local v11    # "activity":Landroid/app/Activity;
    :goto_1
    :try_start_5
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object p1, v0

    :try_start_6
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "context":Landroid/content/Context;
    .end local v11    # "activity":Landroid/app/Activity;
    :goto_2
    throw p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 69
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "response":Ljava/lang/StringBuilder;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "context":Landroid/content/Context;
    .restart local v11    # "activity":Landroid/app/Activity;
    :catch_0
    move-exception v0

    move-object p0, v0

    goto :goto_3

    .end local v7    # "context":Landroid/content/Context;
    .end local v11    # "activity":Landroid/app/Activity;
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "context":Landroid/content/Context;
    :catch_1
    move-exception v0

    move-object v11, p0

    move-object v7, p1

    move-object p0, v0

    .line 70
    .end local p1    # "context":Landroid/content/Context;
    .restart local v7    # "context":Landroid/content/Context;
    .restart local v11    # "activity":Landroid/app/Activity;
    .local p0, "e":Ljava/lang/Exception;
    :goto_3
    const-string p1, "MtgTools"

    const-string v0, "Error update: "

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    .end local p0    # "e":Ljava/lang/Exception;
    :goto_4
    return v1
.end method

.method static synthetic lambda$isNeedUpdate$0(Ljava/lang/String;Landroid/content/Context;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 3
    .param p0, "updateUrl"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p4, "i"    # I

    .line 53
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 54
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 55
    invoke-virtual {p2}, Landroid/app/Activity;->finishAffinity()V

    .line 56
    return-void
.end method

.method static synthetic lambda$isNeedUpdate$1(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 58
    invoke-static {p0, p1}, Lcom/arizona/launcher/AssetExtractor;->unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$isNeedUpdate$2(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p3, "i"    # I

    .line 58
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 59
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 60
    return-void
.end method

.method static synthetic lambda$isNeedUpdate$3(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appVersion"    # Ljava/lang/String;
    .param p2, "currentVersion"    # Ljava/lang/String;
    .param p3, "updateUrl"    # Ljava/lang/String;
    .param p4, "activity"    # Landroid/app/Activity;

    .line 49
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 50
    const-string v1, "\u2139\ufe0f MonetLoader Update \u2139\ufe0f"

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044b\u0439 \u0443 \u0432\u0430\u0441 \u043b\u0430\u0443\u043d\u0447\u0435\u0440 \u0432\u0435\u0440\u0441\u0438\u0438 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u043d\u0435 \u0430\u043a\u0442\u0443\u0430\u043b\u0435\u043d!\n\n\u0418\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0439\u0442\u0435 \u0432\u0435\u0440\u0441\u0438\u044e "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u0434\u043b\u044f \u0441\u0442\u0430\u0431\u0438\u043b\u044c\u043d\u043e\u0439 \u0438\u0433\u0440\u044b \u0441 Lua"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0421\u043a\u0430\u0447\u0430\u0442\u044c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda1;

    invoke-direct {v2, p3, p0, p4}, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Landroid/content/Context;Landroid/app/Activity;)V

    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;

    invoke-direct {v1, p4, p0}, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    .line 57
    const-string v2, "\u0418\u0433\u043d\u043e\u0440"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 61
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 49
    return-void
.end method
