.class public Lorg/anddev/andengine/opengl/texture/TextureFactory;
.super Ljava/lang/Object;
.source "TextureFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createForTextureRegionSize(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 5
    .parameter "pTextureRegion"
    .parameter "pTextureOptions"

    .prologue
    .line 29
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getWidth()I

    move-result v1

    .line 30
    .local v1, loadingScreenWidth:I
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getHeight()I

    move-result v0

    .line 31
    .local v0, loadingScreenHeight:I
    new-instance v2, Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-static {v1}, Lorg/anddev/andengine/util/MathUtils;->nextPowerOfTwo(I)I

    move-result v3

    invoke-static {v0}, Lorg/anddev/andengine/util/MathUtils;->nextPowerOfTwo(I)I

    move-result v4

    invoke-direct {v2, v3, v4, p1}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    return-object v2
.end method

.method public static createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;)Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1
    .parameter "pTextureRegion"

    .prologue
    .line 25
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-static {p0, v0}, Lorg/anddev/andengine/opengl/texture/TextureFactory;->createForTextureRegionSize(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    return-object v0
.end method

.method public static createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1
    .parameter "pTextureSource"

    .prologue
    .line 35
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-static {p0, v0}, Lorg/anddev/andengine/opengl/texture/TextureFactory;->createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    return-object v0
.end method

.method public static createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 5
    .parameter "pTextureSource"
    .parameter "pTextureOptions"

    .prologue
    .line 39
    invoke-interface {p0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v1

    .line 40
    .local v1, loadingScreenWidth:I
    invoke-interface {p0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    .line 41
    .local v0, loadingScreenHeight:I
    new-instance v2, Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-static {v1}, Lorg/anddev/andengine/util/MathUtils;->nextPowerOfTwo(I)I

    move-result v3

    invoke-static {v0}, Lorg/anddev/andengine/util/MathUtils;->nextPowerOfTwo(I)I

    move-result v4

    invoke-direct {v2, v3, v4, p1}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    return-object v2
.end method
