.class public Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
.super Ljava/lang/Object;
.source "Texture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/Texture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextureSourceWithLocation"
.end annotation


# instance fields
.field private final mTexturePositionX:I

.field private final mTexturePositionY:I

.field private final mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V
    .locals 0
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"

    .prologue
    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    .line 335
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionX:I

    .line 336
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionY:I

    .line 337
    return-void
.end method

.method static synthetic access$0(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1
    .parameter

    .prologue
    .line 325
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    return-object v0
.end method

.method static synthetic access$1(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)I
    .locals 1
    .parameter

    .prologue
    .line 326
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionX:I

    return v0
.end method

.method static synthetic access$2(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)I
    .locals 1
    .parameter

    .prologue
    .line 327
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionY:I

    return v0
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    return v0
.end method

.method public getTexturePositionX()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionX:I

    return v0
.end method

.method public getTexturePositionY()I
    .locals 1

    .prologue
    .line 348
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionY:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v0

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 364
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->onLoadBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 369
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
