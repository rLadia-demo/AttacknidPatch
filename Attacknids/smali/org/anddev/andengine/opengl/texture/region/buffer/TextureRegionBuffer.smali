.class public Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;
.super Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
.source "TextureRegionBuffer.java"


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;I)V
    .locals 0
    .parameter "pTextureRegion"
    .parameter "pDrawType"

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;-><init>(Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;I)V

    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 1

    .prologue
    .line 28
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    return-object v0
.end method

.method protected getX1()F
    .locals 3

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 38
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v2

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    return v1
.end method

.method protected getX2()F
    .locals 3

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 44
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionX()I

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getWidth()I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v2

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    return v1
.end method

.method protected getY1()F
    .locals 3

    .prologue
    .line 49
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 50
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionY()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v2

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    return v1
.end method

.method protected getY2()F
    .locals 3

    .prologue
    .line 55
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 56
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionY()I

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getHeight()I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v2

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    return v1
.end method
