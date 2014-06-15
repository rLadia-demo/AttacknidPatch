.class public abstract Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;
.super Ljava/lang/Object;
.source "BaseTextureSourceDecorator.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# instance fields
.field protected final mAntiAliasing:Z

.field protected final mPaint:Landroid/graphics/Paint;

.field protected final mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)V
    .locals 1
    .parameter "pTextureSource"

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Z)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Z)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pAntiAliasing"

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    .line 35
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    .line 36
    iput-boolean p2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mAntiAliasing:Z

    .line 37
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 38
    return-void
.end method

.method private ensureLoadedBitmapIsMutable(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "pBitmap"

    .prologue
    .line 77
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    .end local p1
    :goto_0
    return-object p1

    .line 80
    .restart local p1
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 81
    .local v0, mutableBitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    move-object p1, v0

    .line 82
    goto :goto_0
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public abstract clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v0

    return v0
.end method

.method protected abstract onDecorateBitmap(Landroid/graphics/Canvas;)V
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 65
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v2}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->onLoadBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->ensureLoadedBitmapIsMutable(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 67
    .local v0, bitmap:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 68
    .local v1, canvas:Landroid/graphics/Canvas;
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;->onDecorateBitmap(Landroid/graphics/Canvas;)V

    .line 69
    return-object v0
.end method
