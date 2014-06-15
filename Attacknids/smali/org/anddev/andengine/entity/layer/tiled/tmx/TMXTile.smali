.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
.super Ljava/lang/Object;
.source "TMXTile.java"


# instance fields
.field mGlobalTileID:I

.field mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

.field private final mTileColumn:I

.field private final mTileHeight:I

.field private final mTileRow:I

.field private final mTileWidth:I


# direct methods
.method public constructor <init>(IIIIILorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 0
    .parameter "pGlobalTileID"
    .parameter "pTileColumn"
    .parameter "pTileRow"
    .parameter "pTileWidth"
    .parameter "pTileHeight"
    .parameter "pTextureRegion"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mGlobalTileID:I

    .line 31
    iput p3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileRow:I

    .line 32
    iput p2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileColumn:I

    .line 33
    iput p4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileWidth:I

    .line 34
    iput p5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileHeight:I

    .line 35
    iput-object p6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 36
    return-void
.end method


# virtual methods
.method public getGlobalTileID()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mGlobalTileID:I

    return v0
.end method

.method public getTMXTileProperties(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .locals 1
    .parameter "pTMXTiledMap"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;",
            ")",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mGlobalTileID:I

    invoke-virtual {p1, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXTileProperties(I)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    move-result-object v0

    return-object v0
.end method

.method public getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    return-object v0
.end method

.method public getTileColumn()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileColumn:I

    return v0
.end method

.method public getTileHeight()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileHeight:I

    return v0
.end method

.method public getTileRow()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileRow:I

    return v0
.end method

.method public getTileWidth()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileWidth:I

    return v0
.end method

.method public getTileX()I
    .locals 2

    .prologue
    .line 55
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileColumn:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileWidth:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public getTileY()I
    .locals 2

    .prologue
    .line 59
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileRow:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTileHeight:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public setGlobalTileID(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;I)V
    .locals 1
    .parameter "pTMXTiledMap"
    .parameter "pGlobalTileID"

    .prologue
    .line 80
    iput p2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mGlobalTileID:I

    .line 81
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTextureRegionFromGlobalTileID(I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 82
    return-void
.end method

.method public setTextureRegion(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 0
    .parameter "pTextureRegion"

    .prologue
    .line 89
    iput-object p1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 90
    return-void
.end method
