.class public Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
.super Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
.source "TiledTextureRegion.java"


# instance fields
.field private mCurrentTileColumn:I

.field private mCurrentTileRow:I

.field private final mTileColumns:I

.field private final mTileCount:I

.field private final mTileRows:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;IIIIII)V
    .locals 3
    .parameter "pTexture"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    const/4 v2, 0x0

    .line 32
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    .line 33
    iput p6, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    .line 34
    iput p7, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileRows:I

    .line 35
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileRows:I

    mul-int/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileCount:I

    .line 36
    iput v2, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    .line 37
    iput v2, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    .line 39
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->initTextureBuffer()V

    .line 40
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->clone()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 8

    .prologue
    .line 111
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionX()I

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionY()I

    move-result v3

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getHeight()I

    move-result v5

    iget v6, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    iget v7, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileRows:I

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIIIII)V

    .line 112
    .local v0, clone:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    invoke-virtual {v0, v1, v2}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->setCurrentTileIndex(II)V

    .line 113
    return-object v0
.end method

.method public getCurrentTileColumn()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    return v0
.end method

.method public getCurrentTileIndex()I
    .locals 2

    .prologue
    .line 79
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    mul-int/2addr v0, v1

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getCurrentTileRow()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    return v0
.end method

.method public bridge synthetic getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;

    return-object v0
.end method

.method public getTexturePositionOfCurrentTileX()F
    .locals 3

    .prologue
    .line 98
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getTexturePositionX()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileWidth()I

    move-result v2

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    int-to-float v0, v0

    return v0
.end method

.method public getTexturePositionOfCurrentTileY()F
    .locals 3

    .prologue
    .line 102
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getTexturePositionY()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileHeight()I

    move-result v2

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    int-to-float v0, v0

    return v0
.end method

.method public getTileCount()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileCount:I

    return v0
.end method

.method public getTileHeight()I
    .locals 2

    .prologue
    .line 67
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getHeight()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileRows:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getTileWidth()I
    .locals 2

    .prologue
    .line 63
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getWidth()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    div-int/2addr v0, v1

    return v0
.end method

.method protected initTextureBuffer()V
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileRows:I

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    if-eqz v0, :cond_0

    .line 45
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->initTextureBuffer()V

    .line 47
    :cond_0
    return-void
.end method

.method public nextTile()V
    .locals 3

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getCurrentTileIndex()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileCount()I

    move-result v2

    rem-int v0, v1, v2

    .line 127
    .local v0, tileIndex:I
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->setCurrentTileIndex(I)V

    .line 128
    return-void
.end method

.method protected bridge synthetic onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;
    .locals 2

    .prologue
    .line 118
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;

    const v1, 0x88e4

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/opengl/texture/region/buffer/TiledTextureRegionBuffer;-><init>(Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;I)V

    return-object v0
.end method

.method public setCurrentTileIndex(I)V
    .locals 3
    .parameter "pTileIndex"

    .prologue
    .line 91
    iget v1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileCount:I

    if-ge p1, v1, :cond_0

    .line 92
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mTileColumns:I

    .line 93
    .local v0, tileColumns:I
    rem-int v1, p1, v0

    div-int v2, p1, v0

    invoke-virtual {p0, v1, v2}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->setCurrentTileIndex(II)V

    .line 95
    .end local v0           #tileColumns:I
    :cond_0
    return-void
.end method

.method public setCurrentTileIndex(II)V
    .locals 1
    .parameter "pTileColumn"
    .parameter "pTileRow"

    .prologue
    .line 83
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    if-eq p2, v0, :cond_1

    .line 84
    :cond_0
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileColumn:I

    .line 85
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->mCurrentTileRow:I

    .line 86
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->updateTextureRegionBuffer()V

    .line 88
    :cond_1
    return-void
.end method
