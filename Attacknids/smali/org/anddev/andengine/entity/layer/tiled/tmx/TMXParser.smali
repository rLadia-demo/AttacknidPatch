.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "TMXParser.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDataCompression:Ljava/lang/String;

.field private mDataEncoding:Ljava/lang/String;

.field private mInData:Z

.field private mInImage:Z

.field private mInLayer:Z

.field private mInMap:Z

.field private mInObject:Z

.field private mInObjectGroup:Z

.field private mInProperties:Z

.field private mInProperty:Z

.field private mInTile:Z

.field private mInTileset:Z

.field private mLastTileSetTileID:I

.field private final mStringBuilder:Ljava/lang/StringBuilder;

.field private final mTMXTilePropertyListener:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;

.field private mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

.field private final mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

.field private final mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    .locals 1
    .parameter "pContext"
    .parameter "pTextureManager"
    .parameter "pTextureOptions"
    .parameter "pTMXTilePropertyListener"

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mStringBuilder:Ljava/lang/StringBuilder;

    .line 65
    iput-object p1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mContext:Landroid/content/Context;

    .line 66
    iput-object p2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    .line 67
    iput-object p3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 68
    iput-object p4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTilePropertyListener:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;

    .line 69
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .parameter "pCharacters"
    .parameter "pStart"
    .parameter "pLength"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 167
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .parameter "pUri"
    .parameter "pLocalName"
    .parameter "pQualifiedName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v4, 0x0

    .line 171
    const-string v3, "map"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 172
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInMap:Z

    .line 207
    :goto_0
    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 208
    return-void

    .line 173
    :cond_0
    const-string v3, "tileset"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 174
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTileset:Z

    goto :goto_0

    .line 175
    :cond_1
    const-string v3, "image"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 176
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInImage:Z

    goto :goto_0

    .line 177
    :cond_2
    const-string v3, "tile"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 178
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTile:Z

    goto :goto_0

    .line 179
    :cond_3
    const-string v3, "properties"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 180
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInProperties:Z

    goto :goto_0

    .line 181
    :cond_4
    const-string v3, "property"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 182
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInProperty:Z

    goto :goto_0

    .line 183
    :cond_5
    const-string v3, "layer"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 184
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInLayer:Z

    goto :goto_0

    .line 185
    :cond_6
    const-string v3, "data"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 186
    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataCompression:Ljava/lang/String;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataEncoding:Ljava/lang/String;

    if-eqz v3, :cond_8

    const/4 v0, 0x1

    .line 187
    .local v0, binarySaved:Z
    :goto_1
    if-eqz v0, :cond_7

    .line 188
    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v3}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXLayers()Ljava/util/ArrayList;

    move-result-object v2

    .line 190
    .local v2, tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :try_start_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;

    iget-object v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataEncoding:Ljava/lang/String;

    iget-object v7, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataCompression:Ljava/lang/String;

    iget-object v8, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTilePropertyListener:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;

    invoke-virtual {v3, v5, v6, v7, v8}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->initializeTMXTilesFromDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    :goto_2
    iput-object v9, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataCompression:Ljava/lang/String;

    .line 195
    iput-object v9, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataEncoding:Ljava/lang/String;

    .line 197
    .end local v2           #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :cond_7
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInData:Z

    goto/16 :goto_0

    .end local v0           #binarySaved:Z
    :cond_8
    move v0, v4

    .line 186
    goto :goto_1

    .line 191
    .restart local v0       #binarySaved:Z
    .restart local v2       #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :catch_0
    move-exception v1

    .line 192
    .local v1, e:Ljava/io/IOException;
    invoke-static {v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 198
    .end local v0           #binarySaved:Z
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :cond_9
    const-string v3, "objectgroup"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 199
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObjectGroup:Z

    goto/16 :goto_0

    .line 200
    :cond_a
    const-string v3, "object"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 201
    iput-boolean v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObject:Z

    goto/16 :goto_0

    .line 203
    :cond_b
    new-instance v3, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unexpected end tag: \'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method getTMXTiledMap()Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    return-object v0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 17
    .parameter "pUri"
    .parameter "pLocalName"
    .parameter "pQualifiedName"
    .parameter "pAttributes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 85
    const-string v13, "map"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 86
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInMap:Z

    .line 87
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    move-object/from16 v0, p4

    invoke-direct {v13, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;-><init>(Lorg/xml/sax/Attributes;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    .line 162
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    const-string v13, "tileset"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 89
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTileset:Z

    .line 91
    const-string v13, ""

    const-string v14, "source"

    move-object/from16 v0, p4

    invoke-interface {v0, v13, v14}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 92
    .local v12, tsxTileSetSource:Ljava/lang/String;
    if-nez v12, :cond_2

    .line 93
    new-instance v10, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    move-object/from16 v0, p4

    invoke-direct {v10, v0, v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;-><init>(Lorg/xml/sax/Attributes;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 102
    .local v10, tmxTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13, v10}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->addTMXTileSet(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;)V

    goto :goto_0

    .line 96
    .end local v10           #tmxTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :cond_2
    :try_start_0
    const-string v13, "firstgid"

    const/4 v14, 0x1

    move-object/from16 v0, p4

    invoke-static {v0, v13, v14}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v2

    .line 97
    .local v2, firstGlobalTileID:I
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    move-object/from16 v16, v0

    invoke-direct/range {v13 .. v16}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;-><init>(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mContext:Landroid/content/Context;

    invoke-virtual {v13, v14, v2, v12}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->loadFromAsset(Landroid/content/Context;ILjava/lang/String;)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :try_end_0
    .catch Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .restart local v10       #tmxTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    goto :goto_1

    .line 98
    .end local v2           #firstGlobalTileID:I
    .end local v10           #tmxTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :catch_0
    move-exception v1

    .line 99
    .local v1, e:Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Failed to load TMXTileSet from source: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14, v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v13

    .line 103
    .end local v1           #e:Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;
    .end local v12           #tsxTileSetSource:Ljava/lang/String;
    :cond_3
    const-string v13, "image"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 104
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInImage:Z

    .line 105
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXTileSets()Ljava/util/ArrayList;

    move-result-object v11

    .line 106
    .local v11, tmxTileSets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-object/from16 v0, p4

    invoke-virtual {v13, v14, v15, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->setImageSource(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/xml/sax/Attributes;)V

    goto/16 :goto_0

    .line 107
    .end local v11           #tmxTileSets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;>;"
    :cond_4
    const-string v13, "tile"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 108
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTile:Z

    .line 109
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTileset:Z

    if-eqz v13, :cond_5

    .line 110
    const-string v13, "id"

    move-object/from16 v0, p4

    invoke-static {v0, v13}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mLastTileSetTileID:I

    goto/16 :goto_0

    .line 111
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInData:Z

    if-eqz v13, :cond_0

    .line 112
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXLayers()Ljava/util/ArrayList;

    move-result-object v7

    .line 113
    .local v7, tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTilePropertyListener:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;

    move-object/from16 v0, p4

    invoke-virtual {v13, v0, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->initializeTMXTileFromXML(Lorg/xml/sax/Attributes;Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V

    goto/16 :goto_0

    .line 115
    .end local v7           #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :cond_6
    const-string v13, "properties"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 116
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInProperties:Z

    goto/16 :goto_0

    .line 117
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInProperties:Z

    if-eqz v13, :cond_c

    const-string v13, "property"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 118
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInProperty:Z

    .line 119
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInTile:Z

    if-eqz v13, :cond_8

    .line 120
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXTileSets()Ljava/util/ArrayList;

    move-result-object v11

    .line 121
    .restart local v11       #tmxTileSets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;

    .line 123
    .local v6, lastTMXTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    move-object/from16 v0, p0

    iget v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mLastTileSetTileID:I

    new-instance v14, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v6, v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->addTMXTileProperty(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;)V

    goto/16 :goto_0

    .line 124
    .end local v6           #lastTMXTileSet:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    .end local v11           #tmxTileSets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;>;"
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInLayer:Z

    if-eqz v13, :cond_9

    .line 125
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXLayers()Ljava/util/ArrayList;

    move-result-object v7

    .line 126
    .restart local v7       #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;

    .line 128
    .local v3, lastTMXLayer:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;

    move-object/from16 v0, p4

    invoke-direct {v13, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v3, v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;->addTMXLayerProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayerProperty;)V

    goto/16 :goto_0

    .line 129
    .end local v3           #lastTMXLayer:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;
    .end local v7           #tmxLayers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;>;"
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObject:Z

    if-eqz v13, :cond_a

    .line 130
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXObjectGroups()Ljava/util/ArrayList;

    move-result-object v8

    .line 131
    .local v8, tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;

    .line 133
    .local v5, lastTMXObjectGroup:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;
    invoke-virtual {v5}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->getTMXObjects()Ljava/util/ArrayList;

    move-result-object v9

    .line 134
    .local v9, tmxObjects:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;

    .line 136
    .local v4, lastTMXObject:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectProperty;

    move-object/from16 v0, p4

    invoke-direct {v13, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectProperty;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v4, v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;->addTMXObjectProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectProperty;)V

    goto/16 :goto_0

    .line 137
    .end local v4           #lastTMXObject:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;
    .end local v5           #lastTMXObjectGroup:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;
    .end local v8           #tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    .end local v9           #tmxObjects:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;>;"
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObjectGroup:Z

    if-eqz v13, :cond_b

    .line 138
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXObjectGroups()Ljava/util/ArrayList;

    move-result-object v8

    .line 139
    .restart local v8       #tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;

    .line 141
    .restart local v5       #lastTMXObjectGroup:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;

    move-object/from16 v0, p4

    invoke-direct {v13, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v5, v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->addTMXObjectGroupProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;)V

    goto/16 :goto_0

    .line 142
    .end local v5           #lastTMXObjectGroup:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;
    .end local v8           #tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInMap:Z

    if-eqz v13, :cond_0

    .line 143
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    new-instance v14, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMapProperty;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMapProperty;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->addTMXTiledMapProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMapProperty;)V

    goto/16 :goto_0

    .line 145
    :cond_c
    const-string v13, "layer"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 146
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInLayer:Z

    .line 147
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    new-instance v14, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    move-object/from16 v0, p4

    invoke-direct {v14, v15, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;-><init>(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;Lorg/xml/sax/Attributes;)V

    invoke-virtual {v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->addTMXLayer(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXLayer;)V

    goto/16 :goto_0

    .line 148
    :cond_d
    const-string v13, "data"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 149
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInData:Z

    .line 150
    const-string v13, ""

    const-string v14, "encoding"

    move-object/from16 v0, p4

    invoke-interface {v0, v13, v14}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataEncoding:Ljava/lang/String;

    .line 151
    const-string v13, ""

    const-string v14, "compression"

    move-object/from16 v0, p4

    invoke-interface {v0, v13, v14}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mDataCompression:Ljava/lang/String;

    goto/16 :goto_0

    .line 152
    :cond_e
    const-string v13, "objectgroup"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_f

    .line 153
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObjectGroup:Z

    .line 154
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    new-instance v14, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->addTMXObjectGroup(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;)V

    goto/16 :goto_0

    .line 155
    :cond_f
    const-string v13, "object"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_10

    .line 156
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mInObject:Z

    .line 157
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXParser;->mTMXTiledMap:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;

    invoke-virtual {v13}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTiledMap;->getTMXObjectGroups()Ljava/util/ArrayList;

    move-result-object v8

    .line 158
    .restart local v8       #tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;

    new-instance v14, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;-><init>(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->addTMXObject(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;)V

    goto/16 :goto_0

    .line 160
    .end local v8           #tmxObjectGroups:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;>;"
    :cond_10
    new-instance v13, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Unexpected start tag: \'"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\'."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;-><init>(Ljava/lang/String;)V

    throw v13
.end method
