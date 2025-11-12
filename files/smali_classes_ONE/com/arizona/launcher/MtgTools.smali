.class public Lcom/arizona/launcher/MtgTools;
.super Ljava/lang/Object;
.source "MtgTools.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "id":Ljava/lang/String;
    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "9774d56d682e549c"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 38
    :cond_0
    const-string v3, "mtg"

    invoke-virtual {p0, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 39
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "device_id"

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 46
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    :cond_1
    const-string v3, "monetloader"

    .line 47
    .local v3, "folderName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getExternalMediaDirs()[Ljava/io/File;

    move-result-object v4

    .line 48
    .local v4, "mediaDirs":[Ljava/io/File;
    new-instance v5, Ljava/io/File;

    array-length v6, v4

    if-lez v6, :cond_2

    aget-object v1, v4, v2

    :cond_2
    invoke-direct {v5, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 49
    .local v5, "outputFolder":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "compat/.id"

    invoke-direct {v1, v5, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 51
    .local v1, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 52
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 53
    .local v2, "io":Ljava/io/FileOutputStream;
    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 54
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 55
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .end local v2    # "io":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 56
    :catch_0
    move-exception v2

    .line 57
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 59
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method

.method public static initialize(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 220
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 268
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 270
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 278
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 280
    return-void
.end method

.method public static isActiveAdBlocker(Landroid/app/Activity;Landroid/content/Context;)Z
    .locals 12
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 165
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 166
    .local v0, "cm":Landroid/net/ConnectivityManager;
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_1

    .line 167
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v2

    .line 168
    .local v2, "activeNetwork":Landroid/net/Network;
    if-eqz v2, :cond_1

    .line 169
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v3

    .line 170
    .local v3, "linkProperties":Landroid/net/LinkProperties;
    if-eqz v3, :cond_1

    .line 171
    invoke-virtual {v3}, Landroid/net/LinkProperties;->getPrivateDnsServerName()Ljava/lang/String;

    move-result-object v4

    .line 172
    .local v4, "privateDnsHost":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 173
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 174
    .local v5, "dns":Ljava/lang/String;
    const/16 v6, 0x9

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "adguard"

    aput-object v7, v6, v1

    const-string v7, "nextdns"

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const/4 v7, 0x2

    const-string v9, "controld"

    aput-object v9, v6, v7

    const/4 v7, 0x3

    const-string v9, "libredns"

    aput-object v9, v6, v7

    const/4 v7, 0x4

    const-string v9, "blokada"

    aput-object v9, v6, v7

    const/4 v7, 0x5

    const-string v9, "quad9"

    aput-object v9, v6, v7

    const/4 v7, 0x6

    const-string v9, "adblock"

    aput-object v9, v6, v7

    const/4 v7, 0x7

    const-string v9, "rethinkdns"

    aput-object v9, v6, v7

    const/16 v7, 0x8

    const-string v9, "cleanbrowsing"

    aput-object v9, v6, v7

    .line 175
    .local v6, "adBlockers":[Ljava/lang/String;
    array-length v7, v6

    move v9, v1

    :goto_0
    if-ge v9, v7, :cond_1

    aget-object v10, v6, v9

    .line 176
    .local v10, "blocker":Ljava/lang/String;
    invoke-virtual {v5, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Detected AD blocker: "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v7, "MtgTools"

    invoke-static {v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    return v8

    .line 175
    .end local v10    # "blocker":Ljava/lang/String;
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 185
    .end local v2    # "activeNetwork":Landroid/net/Network;
    .end local v3    # "linkProperties":Landroid/net/LinkProperties;
    .end local v4    # "privateDnsHost":Ljava/lang/String;
    .end local v5    # "dns":Ljava/lang/String;
    .end local v6    # "adBlockers":[Ljava/lang/String;
    :cond_1
    return v1
.end method

.method public static isShowAd(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .line 188
    const-string v0, "mtg"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 189
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string v2, "check"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    .line 190
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 191
    return v1

    .line 193
    :cond_0
    const-string v2, "key"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 194
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

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Check key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MtgTools"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const-string v0, "mtgmods.duckdns.org"

    .line 120
    .local v0, "host":Ljava/lang/String;
    const-string v2, "https://mtgmods.duckdns.org/api/check_key"

    .line 121
    .local v2, "urlHost":Ljava/lang/String;
    const-string v3, "https://130.61.17.51/api/check_key"

    .line 122
    .local v3, "urlIp":Ljava/lang/String;
    invoke-static {p1}, Lcom/arizona/launcher/MtgTools;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 124
    .local v4, "deviceId":Ljava/lang/String;
    const-string v5, "https://mtgmods.duckdns.org/api/check_key"

    const/4 v6, 0x0

    const-string v7, "mtgmods.duckdns.org"

    invoke-static {v5, p0, v4, v6, v7}, Lcom/arizona/launcher/MtgTools;->postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 125
    .local v5, "response":Ljava/lang/String;
    if-eqz v5, :cond_0

    const-string v8, "DNS_FAIL"

    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "UnknownHostException"

    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "host"

    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "or service"

    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 126
    :cond_0
    const-string v8, "https://130.61.17.51/api/check_key"

    const/4 v9, 0x1

    invoke-static {v8, p0, v4, v9, v7}, Lcom/arizona/launcher/MtgTools;->postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 128
    :cond_1
    if-nez v5, :cond_2

    .line 129
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-direct {v1, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v7, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda11;

    invoke-direct {v7, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda11;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 130
    return v6

    .line 133
    :cond_2
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 134
    .local v7, "json":Lorg/json/JSONObject;
    const-string v8, "valid"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 135
    .local v8, "valid":Z
    if-eqz v8, :cond_3

    .line 136
    const-string v9, "user"

    const-string v10, "VIP \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 137
    .local v9, "username":Ljava/lang/String;
    new-instance v10, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v11, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda12;

    invoke-direct {v11, p1, v9}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda12;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 138
    nop

    .end local v9    # "username":Ljava/lang/String;
    goto :goto_1

    .line 139
    :cond_3
    const-string v9, "mtg"

    invoke-virtual {p1, v9, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "key"

    invoke-interface {v9, v10}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 140
    const-string v9, "error"

    const-string v10, ""

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 142
    .local v9, "err":Ljava/lang/String;
    const-string v10, "expires"

    invoke-virtual {v7, v10, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 143
    const-string v10, "[MTG MODS]\n\ud83d\ude2d \u041a\u043b\u044e\u0447 \u0443\u0441\u0442\u0430\u0440\u0435\u043b \ud83d\ude2d"

    .local v10, "toastMessage":Ljava/lang/String;
    goto :goto_0

    .line 144
    .end local v10    # "toastMessage":Ljava/lang/String;
    :cond_4
    const-string v10, "Key not found"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 145
    const-string v10, "[MTG MODS]\n\u274c \u041a\u043b\u044e\u0447 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d \u274c"

    .restart local v10    # "toastMessage":Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v10    # "toastMessage":Ljava/lang/String;
    :cond_5
    const-string v10, "Missing key"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 147
    const-string v10, "[MTG MODS]\n\u26a0\ufe0f \u041d\u0435 \u0432\u0432\u0435\u0434\u0451\u043d \u043a\u043b\u044e\u0447 \u26a0\ufe0f"

    .restart local v10    # "toastMessage":Ljava/lang/String;
    goto :goto_0

    .line 148
    .end local v10    # "toastMessage":Ljava/lang/String;
    :cond_6
    const-string v10, "Internal server error"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 149
    const-string v10, "[MTG MODS]\n\u2757\ufe0f \u0421\u0435\u0440\u0432\u0435\u0440 \u0443\u043f\u0430\u043b \u2757\ufe0f"

    .restart local v10    # "toastMessage":Ljava/lang/String;
    goto :goto_0

    .line 152
    .end local v10    # "toastMessage":Ljava/lang/String;
    :cond_7
    const-string v10, "[MTG MODS]\n\u274c \u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u043a\u043b\u044e\u0447 \u274c"

    .line 154
    .restart local v10    # "toastMessage":Ljava/lang/String;
    :goto_0
    new-instance v11, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v12

    invoke-direct {v11, v12}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v12, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda13;

    invoke-direct {v12, p1, v10}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda13;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    .end local v9    # "err":Ljava/lang/String;
    .end local v10    # "toastMessage":Ljava/lang/String;
    :goto_1
    return v8

    .line 157
    .end local v7    # "json":Lorg/json/JSONObject;
    .end local v8    # "valid":Z
    :catch_0
    move-exception v7

    .line 158
    .local v7, "e":Ljava/lang/Exception;
    const-string v8, "Error check key: "

    invoke-static {v1, v8, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 159
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v8

    invoke-direct {v1, v8}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v8, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda14;

    invoke-direct {v8, p1, v7}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda14;-><init>(Landroid/content/Context;Ljava/lang/Exception;)V

    invoke-virtual {v1, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 161
    .end local v7    # "e":Ljava/lang/Exception;
    return v6
.end method

.method static synthetic lambda$initialize$10(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 250
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->showVipDialog(Landroid/app/Activity;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$initialize$11(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 258
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$initialize$12(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 259
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->showVipDialog(Landroid/app/Activity;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$initialize$13(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 224
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->isActiveAdBlocker(Landroid/app/Activity;Landroid/content/Context;)Z

    move-result v0

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c \u0440\u0435\u043a\u043b\u0430\u043c\u0443"

    if-eqz v0, :cond_0

    .line 225
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 226
    const-string v2, "\u2139\ufe0f \u041e\u0431\u043d\u0430\u0440\u0443\u0436\u0435\u043d AD Blocker (Private DNS) \u2139\ufe0f"

    invoke-virtual {v0, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 227
    const-string v2, "\u0414\u0430\u043d\u043d\u044b\u0439 Lua \u043b\u0430\u0443\u043d\u0447\u0435\u0440 \u0440\u0430\u0441\u043f\u0440\u043e\u0441\u0442\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f \u0431\u0435\u0441\u043f\u043b\u0430\u0442\u043d\u043e, \u0430 \u0440\u0435\u043a\u043b\u0430\u043c\u0430 \u043f\u0440\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0435 (\u0432 \u0438\u0433\u0440\u0435 \u0435\u0451 \u043d\u0435\u0442\u0443) \u043f\u043e\u043c\u043e\u0433\u0430\u0435\u0442 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0442\u044c \u043b\u0430\u0443\u043d\u0447\u0435\u0440 \ud83d\udc96\n\n\u0412\u044b \u0436\u0435 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442\u0435 Private DNS, \u043a\u043e\u0442\u043e\u0440\u044b\u0439 \u0431\u043b\u043e\u043a\u0438\u0440\u0443\u0435\u0442 \u043f\u043e\u043a\u0430\u0437 \u0440\u0435\u043a\u043b\u0430\u043c\u044b \ud83e\udd7a\n\n\u2139\ufe0f \u0414\u043b\u044f \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0435\u043d\u0438\u044f, \u0432\u0430\u043c \u043d\u0443\u0436\u043d\u043e \u0440\u0435\u0448\u0438\u0442\u044c \u0434\u0430\u043d\u043d\u0443\u044e \u043f\u0440\u043e\u0431\u043b\u0435\u043c\u0443:\n\ud83d\udc49 \u041b\u0438\u0431\u043e \u043e\u0442\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0447\u0430\u0441\u0442\u043d\u044b\u0439 DNS \u0432 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430\u0445, \u0434\u043b\u044f \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438 \u0440\u0435\u043a\u043b\u0430\u043c\u044b\n\ud83d\udc49 \u041b\u0438\u0431\u043e \u0438\u043c\u0435\u0442\u044c \u043f\u043e\u0434\u043f\u0438\u0441\u043a\u0443 MTGVIP (\u0434\u043b\u044f \u0441\u043a\u0440\u0438\u043f\u0442\u043e\u0432 \u0438 \u043b\u0430\u0443\u043d\u0447\u0435\u0440\u0430)"

    invoke-virtual {v0, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;Landroid/app/Activity;)V

    .line 234
    const-string v3, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"

    invoke-virtual {v0, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    .line 250
    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 251
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 252
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    goto :goto_0

    .line 254
    :cond_0
    invoke-static {p0, p1}, Lcom/arizona/launcher/Ads;->initializeAds(Landroid/app/Activity;Landroid/content/Context;)V

    .line 255
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 256
    const-string v2, "\u2139\ufe0f \u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0440\u0435\u043a\u043b\u0430\u043c\u044b \u043f\u0435\u0440\u0435\u0434 \u043d\u0430\u0447\u0430\u043b\u043e\u043c \u0438\u0433\u0440\u044b \u2139\ufe0f"

    invoke-virtual {v0, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 257
    const-string v2, "\u042d\u0442\u0438\u043c \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0435\u043c \u0432\u044b \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0435 MTG MODS \u2764\ufe0f\n\u0420\u0435\u043a\u043b\u0430\u043c\u044b \u0432 \u0438\u0433\u0440\u0435 \u043d\u0435\u0442\u0443, \u043e\u043d\u0430 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0435 \u043b\u0430\u0443\u043d\u0447\u0435\u0440\u0430\n\n\u0415\u0441\u043b\u0438 \u0432\u044b \u0445\u043e\u0442\u0438\u0442\u0435 \u043e\u0442\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0440\u0435\u043a\u043b\u0430\u043c\u0443, \u043f\u0440\u0438\u043e\u0431\u0440\u0435\u0442\u0438\u0442\u0435 VIP"

    invoke-virtual {v0, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda4;-><init>()V

    .line 258
    const-string v3, "\u0418\u0433\u0440\u0430\u0442\u044c"

    invoke-virtual {v0, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    .line 259
    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 260
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 261
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 263
    :goto_0
    return-void
.end method

.method static synthetic lambda$initialize$14(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 222
    :try_start_0
    invoke-static {p0}, Lcom/arizona/launcher/MtgTools;->isShowAd(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    :cond_0
    goto :goto_0

    .line 265
    :catch_0
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "MtgTools"

    const-string v2, "Error init ad: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 268
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$initialize$15(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 272
    :try_start_0
    invoke-static {p0, p1}, Lcom/arizona/launcher/CheckUpdate;->isNeedUpdate(Landroid/app/Activity;Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 273
    invoke-static {p0, p1}, Lcom/arizona/launcher/AssetExtractor;->unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    :cond_0
    goto :goto_0

    .line 275
    :catch_0
    move-exception v0

    .line 276
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "MtgTools"

    const-string v2, "Error update/assets: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 278
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$initialize$9(Landroid/content/Context;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 236
    const/high16 v0, 0x10000000

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.PRIVATE_DNS_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 237
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 238
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    .end local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 239
    :catch_0
    move-exception v1

    .line 241
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.WIRELESS_SETTINGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 242
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 243
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 246
    .end local v2    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 244
    :catch_1
    move-exception v0

    .line 245
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 -> \u0421\u0435\u0442\u044c -> DNS"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 248
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {p1}, Landroid/app/Activity;->finishAffinity()V

    .line 249
    return-void
.end method

.method static synthetic lambda$isValidKey$1(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 129
    const-string v0, "[MTG MODS]\n\u26a0\ufe0f \u041e\u0448\u0438\u0431\u043a\u0430 \u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f \u26a0\ufe0f"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$isValidKey$2(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "username"    # Ljava/lang/String;

    .line 137
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

.method static synthetic lambda$isValidKey$3(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "toastMessage"    # Ljava/lang/String;

    .line 154
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$isValidKey$4(Landroid/content/Context;Ljava/lang/Exception;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "e"    # Ljava/lang/Exception;

    .line 159
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$postRequest$0(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .param p0, "h"    # Ljava/lang/String;
    .param p1, "s"    # Ljavax/net/ssl/SSLSession;

    .line 82
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$showVipDialog$5(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 209
    const-string v0, "[MTG MODS]\n\u2705 \u0420\u0435\u043a\u043b\u0430\u043c\u0430 \u043e\u0442\u043a\u043b\u044e\u0447\u0435\u043d\u0430 \u2705"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$showVipDialog$6(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .line 207
    invoke-static {p0, p1}, Lcom/arizona/launcher/MtgTools;->isValidKey(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
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

    .line 209
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda8;

    invoke-direct {v1, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda8;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 211
    :cond_0
    return-void
.end method

.method static synthetic lambda$showVipDialog$7(Landroid/widget/EditText;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 3
    .param p0, "input"    # Landroid/widget/EditText;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dialog2"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 205
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "key":Ljava/lang/String;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda15;

    invoke-direct {v2, v0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda15;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 211
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 212
    return-void
.end method

.method static synthetic lambda$showVipDialog$8(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "dialog2"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 213
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V

    return-void
.end method

.method private static postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "urlStr"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "device"    # Ljava/lang/String;
    .param p3, "useIp"    # Z
    .param p4, "hostHeader"    # Ljava/lang/String;

    .line 62
    const-string v0, "MtgTools"

    const/4 v1, 0x0

    .line 64
    .local v1, "c":Ljavax/net/ssl/HttpsURLConnection;
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    move-object v1, v2

    .line 65
    const-string v2, "POST"

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 66
    const/16 v2, 0x1388

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    .line 67
    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    .line 68
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 69
    const-string v3, "Key"

    invoke-virtual {v1, v3, p1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v3, "Device"

    invoke-virtual {v1, v3, p2}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const-string v3, "Content-Length"

    const-string v4, "0"

    invoke-virtual {v1, v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-eqz p3, :cond_0

    .line 74
    const-string v3, "Host"

    invoke-virtual {v1, v3, p4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    .line 76
    .local v3, "sc":Ljavax/net/ssl/SSLContext;
    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    new-instance v4, Lcom/arizona/launcher/MtgTools$1;

    invoke-direct {v4}, Lcom/arizona/launcher/MtgTools$1;-><init>()V

    const/4 v5, 0x0

    aput-object v4, v2, v5

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 81
    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 82
    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 85
    .end local v3    # "sc":Ljavax/net/ssl/SSLContext;
    :cond_0
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v2

    .line 86
    .local v2, "code":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HTTP code: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const/16 v3, 0x190

    if-lt v2, v3, :cond_1

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 89
    .local v3, "is":Ljava/io/InputStream;
    :goto_0
    const-string v4, "}"

    if-nez v3, :cond_3

    .line 90
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "{\"valid\":false,\"error\":\"Empty response\",\"code\":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 112
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 90
    :cond_2
    return-object v0

    .line 93
    :cond_3
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v5, "sb":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 96
    .local v6, "in":Ljava/io/BufferedReader;
    :goto_1
    :try_start_3
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    .local v8, "line":Ljava/lang/String;
    if-eqz v7, :cond_4

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 97
    .end local v8    # "line":Ljava/lang/String;
    :cond_4
    :try_start_4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 99
    .end local v6    # "in":Ljava/io/BufferedReader;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 100
    .local v6, "body":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 101
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "{\"valid\":false,\"error\":\"No content\",\"code\":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object v6, v0

    .line 104
    :cond_5
    nop

    .line 112
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 104
    :cond_6
    return-object v6

    .line 94
    .local v6, "in":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v4

    :try_start_5
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v7

    :try_start_6
    invoke-virtual {v4, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "c":Ljavax/net/ssl/HttpsURLConnection;
    .end local p0    # "urlStr":Ljava/lang/String;
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "device":Ljava/lang/String;
    .end local p3    # "useIp":Z
    .end local p4    # "hostHeader":Ljava/lang/String;
    :goto_2
    throw v4
    :try_end_6
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 112
    .end local v2    # "code":I
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    .end local v6    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "c":Ljavax/net/ssl/HttpsURLConnection;
    .restart local p0    # "urlStr":Ljava/lang/String;
    .restart local p1    # "key":Ljava/lang/String;
    .restart local p2    # "device":Ljava/lang/String;
    .restart local p3    # "useIp":Z
    .restart local p4    # "hostHeader":Ljava/lang/String;
    :catchall_2
    move-exception v0

    goto :goto_3

    .line 108
    :catch_0
    move-exception v2

    .line 109
    .local v2, "e":Ljava/lang/Exception;
    :try_start_7
    const-string v3, "Error post request: "

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"valid\":false,\"error\":\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\"}"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 112
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 110
    :cond_7
    return-object v0

    .line 105
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 106
    .local v2, "e":Ljava/net/UnknownHostException;
    :try_start_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DNS error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    const-string v0, "{\"valid\":false,\"error\":\"DNS_FAIL\"}"
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 112
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 107
    :cond_8
    return-object v0

    .line 112
    .end local v2    # "e":Ljava/net/UnknownHostException;
    :goto_3
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 113
    :cond_9
    throw v0
.end method

.method public static showVipDialog(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 198
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 199
    .local v0, "input":Landroid/widget/EditText;
    const-string v1, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u043a\u043b\u044e\u0447, \u043a\u043e\u0442\u043e\u0440\u044b\u0439 \u0432\u044b \u043f\u043e\u043b\u0443\u0447\u0438\u043b\u0438 \u0438\u0437 \u0431\u043e\u0442\u0430"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 200
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    .line 201
    new-instance v1, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v1, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 202
    const-string v2, "\u0423\u0437\u043d\u0430\u0442\u044c \u043f\u043e\u0434\u0440\u043e\u0431\u043d\u0435\u0439 \u043f\u0440\u043e \u0431\u043e\u043d\u0443\u0441\u044b \u0438 \u0446\u0435\u043d\u0443 VIP, \u043b\u0438\u0431\u043e \u043f\u0440\u0438\u043e\u0431\u0440\u0435\u0441\u0442\u0438 VIP \u0432\u044b \u043c\u043e\u0436\u0435\u0442\u0435 \u0432 Telegram/Discord MTG MODS, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 https://t.me/mtgmods/60\n\n\u0415\u0441\u043b\u0438 \u0443 \u0432\u0430\u0441 \u0438 \u0442\u0430\u043a \u0443\u0436\u0435 \u0435\u0441\u0442\u044c \u043a\u0443\u043f\u043b\u0435\u043d\u043d\u044b\u0439 VIP, \u0442\u043e \u0432\u0432\u0435\u0434\u0438\u0442\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u043d\u0438\u0436\u0435"

    invoke-virtual {v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 203
    invoke-virtual {v1, v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setView(Landroid/view/View;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda9;

    invoke-direct {v2, v0, p1}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda9;-><init>(Landroid/widget/EditText;Landroid/content/Context;)V

    .line 204
    const-string v3, "\u041f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c \u043a\u043b\u044e\u0447"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    new-instance v2, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0}, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda10;-><init>(Landroid/app/Activity;)V

    .line 213
    const-string v3, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 214
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 215
    invoke-virtual {v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 216
    return-void
.end method
