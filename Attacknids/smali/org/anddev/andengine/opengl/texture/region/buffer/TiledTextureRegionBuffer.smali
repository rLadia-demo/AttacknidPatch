.class public Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;
.super Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
.source "TiledTextureRegionBuffer.java"


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;I)V
    .locals 0
    .parameter "pTextureRegion"
    .parameter "pDrawType"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;-><init>(Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;I)V

    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 1

    .prologue
    .line 32
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    return-object v0
.end method

.method protected getX1()F
    .locals 3

    .prologue
    .line 41
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    .line 42
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionOfCurrentTileX()F

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

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
    .line 47
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    .line 48
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionOfCurrentTileX()F

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileWidth()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

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
    .line 53
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    .line 54
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionOfCurrentTileY()F

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

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
    .line 59
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    .line 60
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionOfCurrentTileY()F

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileHeight()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v2

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    return v1
.end method
