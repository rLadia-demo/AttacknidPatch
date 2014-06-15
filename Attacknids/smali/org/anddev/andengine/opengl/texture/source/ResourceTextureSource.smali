.class public Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;
.super Ljava/lang/Object;
.source "ResourceTextureSource.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDrawableResourceID:I

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .parameter "pContext"
    .parameter "pDrawableResourceID"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mContext:Landroid/content/Context;

    .line 33
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mDrawableResourceID:I

    .line 35
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 36
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 40
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mWidth:I

    .line 41
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mHeight:I

    .line 42
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;III)V
    .locals 0
    .parameter "pContext"
    .parameter "pDrawableResourceID"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mContext:Landroid/content/Context;

    .line 46
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mDrawableResourceID:I

    .line 47
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mWidth:I

    .line 48
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mHeight:I

    .line 49
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;
    .locals 5

    .prologue
    .line 53
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mContext:Landroid/content/Context;

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mDrawableResourceID:I

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mWidth:I

    iget v4, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mHeight:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;-><init>(Landroid/content/Context;III)V

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mWidth:I

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 76
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 77
    .local v0, decodeOptions:Landroid/graphics/BitmapFactory$Options;
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 78
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mDrawableResourceID:I

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 83
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

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;->mDrawableResourceID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
