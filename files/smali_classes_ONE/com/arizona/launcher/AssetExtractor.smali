.class public Lcom/arizona/launcher/AssetExtractor;
.super Ljava/lang/Object;
.source "AssetExtractor.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    .locals 6
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "assetPath"    # Ljava/lang/String;
    .param p2, "outFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 130
    .local v0, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 132
    .local v1, "out":Ljava/io/FileOutputStream;
    const/16 v2, 0x400

    new-array v2, v2, [B

    .line 134
    .local v2, "buffer":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "read":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_0

    .line 135
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 138
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 139
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 140
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 141
    return-void
.end method

.method private static isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z
    .locals 3
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;

    .line 105
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "list":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v2, v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 107
    .end local v1    # "list":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 108
    .local v1, "e":Ljava/io/IOException;
    return v0
.end method

.method static synthetic lambda$showErrorDialog$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .line 147
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V

    return-void
.end method

.method private static showErrorDialog(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .line 144
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 145
    invoke-virtual {v0, p2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 146
    invoke-virtual {v0, p3}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    .line 147
    const-string v2, "\u041e\u043a"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 148
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 150
    .local v0, "alertDialog":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v2

    .line 151
    .local v2, "dialog":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v2, v1}, Landroidx/appcompat/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 152
    invoke-virtual {v2}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 153
    return-void
.end method

.method public static unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 11
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    const-string v0, "/"

    invoke-static {p1}, Lcom/arizona/launcher/AssetExtractor;->unpackDataFilesAssets(Landroid/content/Context;)V

    .line 29
    const-string v1, "monetloader"

    .line 30
    .local v1, "folderName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getExternalMediaDirs()[Ljava/io/File;

    move-result-object v2

    .line 31
    .local v2, "mediaDirs":[Ljava/io/File;
    new-instance v3, Ljava/io/File;

    array-length v4, v2

    const/4 v5, 0x0

    if-lez v4, :cond_0

    aget-object v4, v2, v5

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 33
    .local v3, "outputFolder":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    const-string v6, "\u2757 MonetLoader Error \u2757"

    if-nez v4, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_1

    .line 34
    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u043f\u0430\u043f\u043a\u0443 /Android/media/com.arizona.game/monetloader\n\n\u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u043b\u0430\u0443\u043d\u0447\u0435\u0440\n\n\u0415\u0441\u043b\u0438 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u043a \u043d\u0435 \u043f\u043e\u043c\u043e\u0433 \u2014 \u0441\u043e\u0437\u0434\u0430\u0439\u0442\u0435 \u043f\u0430\u043f\u043a\u0443 \u0432\u0440\u0443\u0447\u043d\u0443\u044e \u0432 \u0444\u0430\u0439\u043b\u043e\u0432\u043e\u043c \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440\u0435!"

    invoke-static {p0, p1, v6, v0}, Lcom/arizona/launcher/AssetExtractor;->showErrorDialog(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void

    .line 43
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 44
    .local v4, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v4, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 45
    .local v7, "files":[Ljava/lang/String;
    if-eqz v7, :cond_5

    array-length v8, v7

    if-nez v8, :cond_2

    goto :goto_3

    .line 50
    :cond_2
    array-length v6, v7

    :goto_1
    if-ge v5, v6, :cond_4

    aget-object v8, v7, v5

    .line 51
    .local v8, "fileName":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v3, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 52
    .local v9, "outFile":Ljava/io/File;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 53
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 54
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10, v9}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_2

    .line 56
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10, v9}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 50
    .end local v8    # "fileName":Ljava/lang/String;
    .end local v9    # "outFile":Ljava/io/File;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 71
    .end local v4    # "assetManager":Landroid/content/res/AssetManager;
    .end local v7    # "files":[Ljava/lang/String;
    :cond_4
    goto :goto_4

    .line 46
    .restart local v4    # "assetManager":Landroid/content/res/AssetManager;
    .restart local v7    # "files":[Ljava/lang/String;
    :cond_5
    :goto_3
    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u0444\u0430\u0439\u043b\u044b, assets \u043f\u0443\u0441\u0442\u043e\u0439!\n\n\u041f\u0435\u0440\u0435\u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0435 \u0434\u0430\u043d\u043d\u044b\u0439 \u043b\u0430\u0443\u043d\u0447\u0435\u0440 \u0438\u0437 t.me/mtgmods"

    invoke-static {p0, p1, v6, v0}, Lcom/arizona/launcher/AssetExtractor;->showErrorDialog(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    return-void

    .line 62
    .end local v4    # "assetManager":Landroid/content/res/AssetManager;
    .end local v7    # "files":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error extractor: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MtgTools"

    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    new-instance v4, Ljava/io/File;

    const-string v5, "lib/imgui_piemenu.lua"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 65
    .local v4, "fixFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_6

    .line 66
    const-string v5, "\u2757MonetLoader Error\u2757"

    const-string v6, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u043d\u0443\u0436\u043d\u044b\u0435 \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0438 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u043e\u0441\u043f\u043e\u0441\u043e\u0431\u043d\u043e\u0441\u0442\u0438!\n\n\u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u043b\u0430\u0443\u043d\u0447\u0435\u0440\n\n\u0415\u0441\u043b\u0438 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u043a \u043d\u0435 \u043f\u043e\u043c\u043e\u0433 \u2014 \u0432\u0440\u0443\u0447\u043d\u0443\u044e \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0435 \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0438 \u043f\u043e \u0438\u043d\u0441\u0442\u0440\u0443\u043a\u0446\u0438\u0438:\nhttps://t.me/mtgmods/1359 - \u041e\u0448\u0438\u0431\u043a\u0430 \u043f\u0440\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0435"

    invoke-static {p0, p1, v5, v6}, Lcom/arizona/launcher/AssetExtractor;->showErrorDialog(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "fixFile":Ljava/io/File;
    :cond_6
    :goto_4
    return-void
.end method

.method private static unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    .locals 7
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "destination"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "files":[Ljava/lang/String;
    if-eqz v0, :cond_3

    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_2

    .line 116
    :cond_0
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 117
    .local v3, "fileName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 118
    .local v4, "outFile":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 119
    .local v5, "newPath":Ljava/lang/String;
    invoke-static {p0, v5}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 120
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 121
    invoke-static {p0, v5, v4}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_1

    .line 123
    :cond_1
    invoke-static {p0, v5, v4}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 116
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "outFile":Ljava/io/File;
    .end local v5    # "newPath":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 126
    :cond_2
    return-void

    .line 114
    :cond_3
    :goto_2
    return-void
.end method

.method public static unpackDataFilesAssets(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .line 76
    const-string v0, "/"

    const-string v1, "data_files"

    .line 77
    .local v1, "folderName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 80
    .local v2, "assetManager":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "files":[Ljava/lang/String;
    if-eqz v3, :cond_5

    array-length v4, v3

    if-nez v4, :cond_0

    goto/16 :goto_3

    .line 83
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 84
    .local v4, "outputFolder":Ljava/io/File;
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_2

    .line 88
    :cond_1
    array-length v5, v3

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_3

    aget-object v7, v3, v6

    .line 89
    .local v7, "fileName":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v4, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    .local v8, "outFile":Ljava/io/File;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 91
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 92
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9, v8}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_1

    .line 94
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9, v8}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .end local v7    # "fileName":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 100
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "outputFolder":Ljava/io/File;
    :cond_3
    goto :goto_4

    .line 85
    .restart local v3    # "files":[Ljava/lang/String;
    .restart local v4    # "outputFolder":Ljava/io/File;
    :cond_4
    :goto_2
    return-void

    .line 81
    .end local v4    # "outputFolder":Ljava/io/File;
    :cond_5
    :goto_3
    return-void

    .line 98
    .end local v3    # "files":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error extractor: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "MtgTools"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .end local v0    # "e":Ljava/io/IOException;
    :goto_4
    return-void
.end method
