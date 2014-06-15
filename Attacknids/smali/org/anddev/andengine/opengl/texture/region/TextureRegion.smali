.class public Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
.super Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
.source "TextureRegion.java"


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V
    .locals 0
    .parameter "pTexture"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 27
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    .line 28
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->clone()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 6

    .prologue
    .line 44
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mTexturePositionX:I

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mTexturePositionY:I

    iget v4, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mWidth:I

    iget v5, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mHeight:I

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    return-object v0
.end method

.method public bridge synthetic getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;

    return-object v0
.end method

.method protected onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;

    const v1, 0x88e4

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/opengl/texture/region/buffer/TextureRegionBuffer;-><init>(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;I)V

    return-object v0
.end method
