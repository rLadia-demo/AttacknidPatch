.class public Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;
.super Ljava/lang/Object;
.source "AssetTextureSource.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# instance fields
.field private final mAssetPath:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .parameter "pContext"
    .parameter "pAssetPath"

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mContext:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    .line 41
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 42
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 44
    const/4 v2, 0x0

    .line 46
    .local v2, in:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 47
    const/4 v3, 0x0

    invoke-static {v2, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 54
    :goto_0
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v3, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mWidth:I

    .line 55
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v3, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mHeight:I

    .line 56
    return-void

    .line 48
    :catch_0
    move-exception v1

    .line 49
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Failed loading Bitmap in AssetTextureSource. AssetPath: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 50
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 51
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 52
    throw v3
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;II)V
    .locals 0
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mContext:Landroid/content/Context;

    .line 60
    iput-object p2, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    .line 61
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mWidth:I

    .line 62
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mHeight:I

    .line 63
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;
    .locals 5

    .prologue
    .line 67
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mWidth:I

    iget v4, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mHeight:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mWidth:I

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 90
    const/4 v2, 0x0

    .line 92
    .local v2, in:Ljava/io/InputStream;
    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 93
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v4, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 95
    iget-object v4, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 96
    const/4 v4, 0x0

    invoke-static {v2, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 101
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 99
    .end local v0           #decodeOptions:Landroid/graphics/BitmapFactory$Options;
    :goto_0
    return-object v3

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Failed loading Bitmap in AssetTextureSource. AssetPath: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 100
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 101
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 102
    throw v3
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 107
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

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->mAssetPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
