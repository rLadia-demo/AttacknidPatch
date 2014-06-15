.class public Lorg/anddev/andengine/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 3
    .parameter "pIn"
    .parameter "pOut"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 121
    .local v0, fis:Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 123
    .local v1, fos:Ljava/io/FileOutputStream;
    :try_start_0
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    invoke-static {v0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 126
    invoke-static {v1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 128
    return-void

    .line 124
    :catchall_0
    move-exception v2

    .line 125
    invoke-static {v0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 126
    invoke-static {v1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 127
    throw v2
.end method

.method public static copyToExternalStorage(Landroid/content/Context;ILjava/lang/String;)V
    .locals 1
    .parameter "pContext"
    .parameter "pSourceResourceID"
    .parameter "pFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lorg/anddev/andengine/util/FileUtils;->copyToExternalStorage(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public static copyToExternalStorage(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 3
    .parameter "pContext"
    .parameter "pInputStream"
    .parameter "pFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-static {}, Lorg/anddev/andengine/util/FileUtils;->isExternalStorageWriteable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    invoke-static {p0, p2}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v1}, Lorg/anddev/andengine/util/StreamUtils;->copyAndClose(Ljava/io/InputStream;Ljava/io/OutputStream;)Z

    .line 58
    return-void

    .line 56
    .end local v0           #absoluteFilePath:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "External Storage is not writeable."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static copyToExternalStorage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "pContext"
    .parameter "pSourceAssetPath"
    .parameter "pFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lorg/anddev/andengine/util/FileUtils;->copyToExternalStorage(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public static deleteDirectory(Ljava/io/File;)Z
    .locals 6
    .parameter "pFileOrDirectory"

    .prologue
    .line 139
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 140
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, children:[Ljava/lang/String;
    array-length v1, v0

    .line 142
    .local v1, childrenCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_1

    .line 151
    .end local v0           #children:[Ljava/lang/String;
    .end local v1           #childrenCount:I
    .end local v2           #i:I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v4

    :goto_1
    return v4

    .line 143
    .restart local v0       #children:[Ljava/lang/String;
    .restart local v1       #childrenCount:I
    .restart local v2       #i:I
    :cond_1
    new-instance v4, Ljava/io/File;

    aget-object v5, v0, v2

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v4}, Lorg/anddev/andengine/util/FileUtils;->deleteDirectory(Ljava/io/File;)Z

    move-result v3

    .line 144
    .local v3, success:Z
    if-nez v3, :cond_2

    .line 145
    const/4 v4, 0x0

    goto :goto_1

    .line 142
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static ensureDirectoriesExistOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .parameter "pContext"
    .parameter "pDirectory"

    .prologue
    .line 79
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->isDirectoryExistingOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    const/4 v1, 0x1

    .line 85
    :goto_0
    return v1

    .line 83
    :cond_0
    invoke-static {}, Lorg/anddev/andengine/util/FileUtils;->isExternalStorageWriteable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 84
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, absoluteDirectoryPath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    goto :goto_0

    .line 87
    .end local v0           #absoluteDirectoryPath:Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "External Storage is not writeable."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "pContext"
    .parameter "pFilename"

    .prologue
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/Android/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/files/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDirectoryListOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "pContext"
    .parameter "pFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getDirectoryListOnExternalStorage(Landroid/content/Context;Ljava/lang/String;Ljava/io/FilenameFilter;)[Ljava/lang/String;
    .locals 2
    .parameter "pContext"
    .parameter "pFilename"
    .parameter "pFilenameFilter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static isDirectoryExistingOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .parameter "pContext"
    .parameter "pDirectory"

    .prologue
    .line 70
    invoke-static {}, Lorg/anddev/andengine/util/FileUtils;->isExternalStorageReadable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    return v1

    .line 74
    .end local v0           #absoluteFilePath:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "External Storage is not readable."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static isExternalStorageReadable()Z
    .locals 2

    .prologue
    .line 115
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, state:Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "mounted_ro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isExternalStorageWriteable()Z
    .locals 2

    .prologue
    .line 111
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isFileExistingOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .parameter "pContext"
    .parameter "pFilename"

    .prologue
    .line 61
    invoke-static {}, Lorg/anddev/andengine/util/FileUtils;->isExternalStorageReadable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 62
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    return v1

    .line 65
    .end local v0           #absoluteFilePath:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "External Storage is not readable."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static openOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .parameter "pContext"
    .parameter "pFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/FileUtils;->getAbsolutePathOnExternalStorage(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, absoluteFilePath:Ljava/lang/String;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    return-object v1
.end method
