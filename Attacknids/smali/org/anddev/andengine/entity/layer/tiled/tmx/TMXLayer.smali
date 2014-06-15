.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;
.super Lorg/anddev/andengine/entity/shape/RectangularShape;
.source "TMXLayer.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;


# instance fields
.field private final mCullingVertices:[F

.field private final mGlobalTileIDsExpected:I

.field private final mName:Ljava/lang/String;

.field private final mTMXLayerProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;",
            ">;"
        }
    .end annotation
.end field

.field private final mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

.field private final mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

.field private final mTileColumns:I

.field private final mTileRows:I

.field private mTilesAdded:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;Lorg/xml/sax/Attributes;)V
    .locals 10
    .parameter "pTMXTiledMap"
    .parameter "pAttributes"

    .prologue
    const/high16 v9, 0x3f00

    const/4 v8, 0x1

    const/4 v1, 0x0

    .line 62
    const/4 v5, 0x0

    move-object v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/RectangularShape;-><init>(FFFFLorg/anddev/andengine/opengl/vertex/VertexBuffer;)V

    .line 53
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mCullingVertices:[F

    .line 55
    new-instance v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    invoke-direct {v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXLayerProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    .line 64
    iput-object p1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    .line 65
    const-string v0, ""

    const-string v1, "name"

    invoke-interface {p2, v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mName:Ljava/lang/String;

    .line 66
    const-string v0, "width"

    invoke-static {p2, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    .line 67
    const-string v0, "height"

    invoke-static {p2, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    .line 68
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v1, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    .line 70
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileWidth()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    mul-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 71
    iget v7, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 72
    .local v7, width:F
    iput v7, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    .line 74
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileHeight()I

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    mul-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 75
    iget v6, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 76
    .local v6, height:F
    iput v6, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    .line 78
    mul-float v0, v7, v9

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mRotationCenterX:F

    .line 79
    mul-float v0, v6, v9

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mRotationCenterY:F

    .line 81
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mRotationCenterX:F

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mScaleCenterX:F

    .line 82
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mRotationCenterY:F

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mScaleCenterY:F

    .line 84
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    mul-int/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mGlobalTileIDsExpected:I

    .line 86
    const-string v0, "visible"

    invoke-static {p2, v0, v8}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v8, :cond_0

    move v0, v8

    :goto_0
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->setVisible(Z)V

    .line 87
    const-string v0, "opacity"

    const/high16 v1, 0x3f80

    invoke-static {p2, v0, v1}, Lorg/anddev/andengine/util/SAXUtils;->getFloatAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;F)F

    move-result v0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->setAlpha(F)V

    .line 88
    return-void

    .line 86
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private addTileByGlobalTileID(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    .locals 11
    .parameter "pGlobalTileID"
    .parameter "pTMXTilePropertyListener"

    .prologue
    .line 274
    iget-object v9, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    .line 276
    .local v9, tmxTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;
    iget v7, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    .line 278
    .local v7, tilesHorizontal:I
    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTilesAdded:I

    rem-int v2, v1, v7

    .line 279
    .local v2, column:I
    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTilesAdded:I

    div-int v3, v1, v7

    .line 281
    .local v3, row:I
    iget-object v10, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    .line 284
    .local v10, tmxTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    if-nez p1, :cond_1

    .line 285
    const/4 v6, 0x0

    .line 289
    .local v6, tmxTileTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    :goto_0
    new-instance v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileWidth()I

    move-result v4

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileHeight()I

    move-result v5

    move v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;-><init>(IIIIILorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    .line 290
    .local v0, tmxTile:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    aget-object v1, v10, v3

    aput-object v0, v1, v2

    .line 292
    if-eqz p1, :cond_0

    .line 294
    if-eqz p2, :cond_0

    .line 295
    invoke-virtual {v9, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXTileProperties(I)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    move-result-object v8

    .line 296
    .local v8, tmxTileProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;>;"
    if-eqz v8, :cond_0

    .line 297
    invoke-interface {p2, v9, p0, v0, v8}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;->onTMXTileWithPropertiesCreated(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;)V

    .line 302
    .end local v8           #tmxTileProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;>;"
    :cond_0
    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTilesAdded:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTilesAdded:I

    .line 303
    return-void

    .line 287
    .end local v0           #tmxTile:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    .end local v6           #tmxTileTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    :cond_1
    invoke-virtual {v9, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTextureRegionFromGlobalTileID(I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v6

    .restart local v6       #tmxTileTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    goto :goto_0
.end method

.method private readGlobalTileID(Ljava/io/DataInputStream;)I
    .locals 6
    .parameter "pDataIn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    invoke-virtual {p1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 307
    .local v1, lowestByte:I
    invoke-virtual {p1}, Ljava/io/DataInputStream;->read()I

    move-result v3

    .line 308
    .local v3, secondLowestByte:I
    invoke-virtual {p1}, Ljava/io/DataInputStream;->read()I

    move-result v2

    .line 309
    .local v2, secondHighestByte:I
    invoke-virtual {p1}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 311
    .local v0, highestByte:I
    if-ltz v1, :cond_0

    if-ltz v3, :cond_0

    if-ltz v2, :cond_0

    if-gez v0, :cond_1

    .line 312
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Couldn\'t read global Tile ID."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 315
    :cond_1
    shl-int/lit8 v4, v3, 0x8

    or-int/2addr v4, v1

    shl-int/lit8 v5, v2, 0x10

    or-int/2addr v4, v5

    shl-int/lit8 v5, v0, 0x18

    or-int/2addr v4, v5

    return v4
.end method


# virtual methods
.method public addTMXLayerProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;)V
    .locals 1
    .parameter "pTMXLayerProperty"

    .prologue
    .line 136
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXLayerProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->add(Ljava/lang/Object;)Z

    .line 137
    return-void
.end method

.method protected drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 33
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    move-object/from16 v27, v0

    .line 182
    .local v27, tmxTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    move/from16 v22, v0

    .line 183
    .local v22, tileColumns:I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    move/from16 v24, v0

    .line 184
    .local v24, tileRows:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileWidth()I

    move-result v25

    .line 185
    .local v25, tileWidth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileHeight()I

    move-result v23

    .line 187
    .local v23, tileHeight:I
    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mScaleX:F

    move/from16 v30, v0

    mul-float v20, v29, v30

    .line 188
    .local v20, scaledTileWidth:F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mScaleY:F

    move/from16 v30, v0

    mul-float v19, v29, v30

    .line 190
    .local v19, scaledTileHeight:F
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mCullingVertices:[F

    .line 191
    .local v9, cullingVertices:[F
    move-object/from16 v0, p0

    invoke-static {v0, v9}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->fillVertices(Lorg/anddev/andengine/entity/shape/RectangularShape;[F)V

    .line 193
    const/16 v29, 0x0

    aget v16, v9, v29

    .line 194
    .local v16, layerMinX:F
    const/16 v29, 0x1

    aget v17, v9, v29

    .line 196
    .local v17, layerMinY:F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v5

    .line 197
    .local v5, cameraMinX:F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v6

    .line 198
    .local v6, cameraMinY:F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v7

    .line 199
    .local v7, cameraWidth:F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v4

    .line 202
    .local v4, cameraHeight:F
    sub-float v29, v5, v16

    div-float v11, v29, v20

    .line 203
    .local v11, firstColumnRaw:F
    const/16 v29, 0x0

    add-int/lit8 v30, v22, -0x1

    float-to-double v0, v11

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->floor(D)D

    move-result-wide v31

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v31, v0

    invoke-static/range {v29 .. v31}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(III)I

    move-result v10

    .line 204
    .local v10, firstColumn:I
    const/16 v29, 0x0

    add-int/lit8 v30, v22, -0x1

    div-float v31, v7, v20

    add-float v31, v31, v11

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v31

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v31, v0

    invoke-static/range {v29 .. v31}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(III)I

    move-result v14

    .line 206
    .local v14, lastColumn:I
    sub-float v29, v6, v17

    div-float v13, v29, v19

    .line 207
    .local v13, firstRowRaw:F
    const/16 v29, 0x0

    add-int/lit8 v30, v24, -0x1

    float-to-double v0, v13

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->floor(D)D

    move-result-wide v31

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v31, v0

    invoke-static/range {v29 .. v31}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(III)I

    move-result v12

    .line 208
    .local v12, firstRow:I
    const/16 v29, 0x0

    add-int/lit8 v30, v24, -0x1

    div-float v31, v4, v19

    add-float v31, v31, v13

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->floor(D)D

    move-result-wide v31

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v31, v0

    invoke-static/range {v29 .. v31}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(III)I

    move-result v15

    .line 210
    .local v15, lastRow:I
    sub-int v29, v14, v10

    add-int/lit8 v29, v29, 0x1

    mul-int v28, v29, v25

    .line 212
    .local v28, visibleTilesTotalWidth:I
    mul-int v29, v10, v25

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    mul-int v30, v12, v23

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 214
    move/from16 v18, v12

    .local v18, row:I
    :goto_0
    move/from16 v0, v18

    if-le v0, v15, :cond_0

    .line 230
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 231
    return-void

    .line 215
    :cond_0
    aget-object v26, v27, v18

    .line 217
    .local v26, tmxTileRow:[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    move v8, v10

    .local v8, column:I
    :goto_1
    if-le v8, v14, :cond_1

    .line 228
    move/from16 v0, v28

    neg-int v0, v0

    move/from16 v29, v0

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 214
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 218
    :cond_1
    aget-object v29, v26, v8

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-object/from16 v21, v0

    .line 219
    .local v21, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    if-eqz v21, :cond_2

    .line 220
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->onApply(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 222
    const/16 v29, 0x5

    const/16 v30, 0x0

    const/16 v31, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 224
    :cond_2
    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v29, v0

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 217
    add-int/lit8 v8, v8, 0x1

    goto :goto_1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getTMXLayerProperties()Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXLayerProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    return-object v0
.end method

.method public getTMXTile(II)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    .locals 1
    .parameter "pTileColumn"
    .parameter "pTileRow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArrayIndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    aget-object v0, v0, p2

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getTMXTileAt(FF)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    .locals 7
    .parameter "pX"
    .parameter "pY"

    .prologue
    const/4 v4, 0x0

    .line 120
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->convertSceneToLocalCoordinates(FF)[F

    move-result-object v0

    .line 121
    .local v0, localCoords:[F
    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    .line 123
    .local v3, tmxTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;
    const/4 v5, 0x0

    aget v5, v0, v5

    invoke-virtual {v3}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    float-to-int v1, v5

    .line 124
    .local v1, tileColumn:I
    if-ltz v1, :cond_0

    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    add-int/lit8 v5, v5, -0x1

    if-le v1, v5, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-object v4

    .line 127
    :cond_1
    const/4 v5, 0x1

    aget v5, v0, v5

    invoke-virtual {v3}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTileWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    float-to-int v2, v5

    .line 128
    .local v2, tileRow:I
    if-ltz v2, :cond_0

    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    add-int/lit8 v5, v5, -0x1

    if-gt v2, v5, :cond_0

    .line 132
    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    aget-object v4, v4, v2

    aget-object v4, v4, v1

    goto :goto_0
.end method

.method public getTMXTiles()[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiles:[[Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTile;

    return-object v0
.end method

.method public getTileColumns()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileColumns:I

    return v0
.end method

.method public getTileRows()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTileRows:I

    return v0
.end method

.method initializeTMXTileFromXML(Lorg/xml/sax/Attributes;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    .locals 1
    .parameter "pAttributes"
    .parameter "pTMXTilePropertyListener"

    .prologue
    .line 243
    const-string v0, "gid"

    invoke-static {p1, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->addTileByGlobalTileID(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V

    .line 244
    return-void
.end method

.method initializeTMXTilesFromDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    .locals 8
    .parameter "pDataString"
    .parameter "pDataEncoding"
    .parameter "pDataCompression"
    .parameter "pTMXTilePropertyListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 247
    const/4 v0, 0x0

    .line 249
    .local v0, dataIn:Ljava/io/DataInputStream;
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayInputStream;

    const-string v5, "UTF-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 252
    .local v3, in:Ljava/io/InputStream;
    if-eqz p2, :cond_3

    const-string v5, "base64"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 253
    new-instance v4, Lorg/anddev/andengine/util/Base64InputStream;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lorg/anddev/andengine/util/Base64InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 255
    .end local v3           #in:Ljava/io/InputStream;
    .local v4, in:Ljava/io/InputStream;
    :goto_0
    if-eqz p3, :cond_2

    .line 256
    const-string v5, "gzip"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 257
    new-instance v3, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v3, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 262
    .end local v4           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :goto_1
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    .end local v0           #dataIn:Ljava/io/DataInputStream;
    .local v1, dataIn:Ljava/io/DataInputStream;
    :goto_2
    :try_start_1
    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTilesAdded:I

    iget v6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mGlobalTileIDsExpected:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-lt v5, v6, :cond_1

    .line 269
    invoke-static {v1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 271
    return-void

    .line 259
    .end local v1           #dataIn:Ljava/io/DataInputStream;
    .end local v3           #in:Ljava/io/InputStream;
    .restart local v0       #dataIn:Ljava/io/DataInputStream;
    .restart local v4       #in:Ljava/io/InputStream;
    :cond_0
    :try_start_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Supplied compression \'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\' is not supported yet."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 268
    .end local v4           #in:Ljava/io/InputStream;
    :catchall_0
    move-exception v5

    .line 269
    :goto_3
    invoke-static {v0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 270
    throw v5

    .line 265
    .end local v0           #dataIn:Ljava/io/DataInputStream;
    .restart local v1       #dataIn:Ljava/io/DataInputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    :cond_1
    :try_start_3
    invoke-direct {p0, v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->readGlobalTileID(Ljava/io/DataInputStream;)I

    move-result v2

    .line 266
    .local v2, globalTileID:I
    invoke-direct {p0, v2, p4}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->addTileByGlobalTileID(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 268
    .end local v2           #globalTileID:I
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1           #dataIn:Ljava/io/DataInputStream;
    .restart local v0       #dataIn:Ljava/io/DataInputStream;
    goto :goto_3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v4       #in:Ljava/io/InputStream;
    :cond_2
    move-object v3, v4

    .end local v4           #in:Ljava/io/InputStream;
    .restart local v3       #in:Ljava/io/InputStream;
    goto :goto_1

    :cond_3
    move-object v4, v3

    .end local v3           #in:Ljava/io/InputStream;
    .restart local v4       #in:Ljava/io/InputStream;
    goto :goto_0
.end method

.method protected onApplyVertices(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 168
    sget-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 169
    check-cast v0, Ljavax/microedition/khronos/opengles/GL11;

    .line 171
    .local v0, gl11:Ljavax/microedition/khronos/opengles/GL11;
    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getSharedVertexBuffer()Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->selectOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 172
    invoke-static {v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->vertexZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 176
    .end local v0           #gl11:Ljavax/microedition/khronos/opengles/GL11;
    :goto_0
    return-void

    .line 174
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getSharedVertexBuffer()Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->vertexPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V

    goto :goto_0
.end method

.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 160
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 162
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 163
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 164
    return-void
.end method

.method protected onManagedUpdate(F)V
    .locals 0
    .parameter "pSecondsElapsed"

    .prologue
    .line 236
    return-void
.end method

.method protected onUpdateVertexBuffer()V
    .locals 0

    .prologue
    .line 156
    return-void
.end method

.method public setRotation(F)V
    .locals 0
    .parameter "pRotation"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 151
    return-void
.end method
