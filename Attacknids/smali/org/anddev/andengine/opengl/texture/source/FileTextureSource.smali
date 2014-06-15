.class public Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;
.super Ljava/lang/Object;
.source "FileTextureSource.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# instance fields
.field private final mFile:Ljava/io/File;

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 6
    .parameter "pFile"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    .line 41
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 42
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x1

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 44
    const/4 v2, 0x0

    .line 46
    .local v2, in:Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .end local v2           #in:Ljava/io/InputStream;
    .local v3, in:Ljava/io/InputStream;
    const/4 v4, 0x0

    :try_start_1
    invoke-static {v3, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    invoke-static {v3}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    move-object v2, v3

    .line 54
    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    :goto_0
    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v4, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mWidth:I

    .line 55
    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v4, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mHeight:I

    .line 56
    return-void

    .line 48
    :catch_0
    move-exception v1

    .line 49
    .local v1, e:Ljava/io/IOException;
    :goto_1
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Failed loading Bitmap in FileTextureSource. File: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 50
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 51
    :goto_2
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 52
    throw v4

    .line 50
    .end local v2           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    goto :goto_2

    .line 48
    .end local v2           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    goto :goto_1
.end method

.method constructor <init>(Ljava/io/File;II)V
    .locals 0
    .parameter "pFile"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    .line 60
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mWidth:I

    .line 61
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mHeight:I

    .line 62
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;
    .locals 4

    .prologue
    .line 66
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mWidth:I

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mHeight:I

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;-><init>(Ljava/io/File;II)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mWidth:I

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 89
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 90
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v5, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 92
    const/4 v2, 0x0

    .line 94
    .local v2, in:Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v2           #in:Ljava/io/InputStream;
    .local v3, in:Ljava/io/InputStream;
    const/4 v5, 0x0

    :try_start_1
    invoke-static {v3, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 100
    invoke-static {v3}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    move-object v2, v3

    .line 98
    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    :goto_0
    return-object v4

    .line 96
    :catch_0
    move-exception v1

    .line 97
    .local v1, e:Ljava/io/IOException;
    :goto_1
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Failed loading Bitmap in FileTextureSource. File: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 99
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 100
    :goto_2
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 101
    throw v4

    .line 99
    .end local v2           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    goto :goto_2

    .line 96
    .end local v2           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v2       #in:Ljava/io/InputStream;
    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/FileTextureSource;->mFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
