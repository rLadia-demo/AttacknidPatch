.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
.super Ljava/lang/Object;
.source "TMXTileSet.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;


# instance fields
.field private final mFirstGlobalTileID:I

.field private mImageSource:Ljava/lang/String;

.field private final mMargin:I

.field private final mName:Ljava/lang/String;

.field private final mSpacing:I

.field private final mTMXTileProperties:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;",
            ">;>;"
        }
    .end annotation
.end field

.field private mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field private final mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field private final mTileHeight:I

.field private final mTileWidth:I

.field private mTilesHorizontal:I

.field private mTilesVertical:I


# direct methods
.method constructor <init>(ILorg/xml/sax/Attributes;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V
    .locals 3
    .parameter "pFirstGlobalTileID"
    .parameter "pAttributes"
    .parameter "pTextureOptions"

    .prologue
    const/4 v2, 0x0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTMXTileProperties:Landroid/util/SparseArray;

    .line 59
    const-string v0, "firstgid"

    const/4 v1, 0x1

    invoke-static {p2, v0, v1}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mFirstGlobalTileID:I

    .line 60
    const-string v0, ""

    const-string v1, "name"

    invoke-interface {p2, v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mName:Ljava/lang/String;

    .line 61
    const-string v0, "tilewidth"

    invoke-static {p2, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileWidth:I

    .line 62
    const-string v0, "tileheight"

    invoke-static {p2, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileHeight:I

    .line 63
    const-string v0, "spacing"

    invoke-static {p2, v0, v2}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mSpacing:I

    .line 64
    const-string v0, "margin"

    invoke-static {p2, v0, v2}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mMargin:I

    .line 66
    iput-object p3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 67
    return-void
.end method

.method constructor <init>(Lorg/xml/sax/Attributes;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V
    .locals 2
    .parameter "pAttributes"
    .parameter "pTextureOptions"

    .prologue
    .line 55
    const-string v0, "firstgid"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v0, p1, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;-><init>(ILorg/xml/sax/Attributes;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 56
    return-void
.end method

.method private static determineCount(IIII)I
    .locals 3
    .parameter "pTotalExtent"
    .parameter "pTileExtent"
    .parameter "pMargin"
    .parameter "pSpacing"

    .prologue
    .line 159
    const/4 v0, 0x0

    .line 160
    .local v0, count:I
    move v1, p0

    .line 162
    .local v1, remainingExtent:I
    mul-int/lit8 v2, p2, 0x2

    sub-int/2addr v1, v2

    .line 164
    :goto_0
    if-gtz v1, :cond_0

    .line 170
    return v0

    .line 165
    :cond_0
    sub-int/2addr v1, p1

    .line 166
    sub-int/2addr v1, p3

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addTMXTileProperty(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;)V
    .locals 3
    .parameter "pLocalTileID"
    .parameter "pTMXTileProperty"

    .prologue
    .line 137
    iget-object v2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTMXTileProperties:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    .line 138
    .local v0, existingProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;>;"
    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {v0, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->add(Ljava/lang/Object;)Z

    .line 145
    :goto_0
    return-void

    .line 141
    :cond_0
    new-instance v1, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    invoke-direct {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;-><init>()V

    .line 142
    .local v1, newProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;>;"
    invoke-virtual {v1, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTMXTileProperties:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public final getFirstGlobalTileID()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mFirstGlobalTileID:I

    return v0
.end method

.method public getImageSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mImageSource:Ljava/lang/String;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getTMXTileProperties()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTMXTileProperties:Landroid/util/SparseArray;

    return-object v0
.end method

.method public getTMXTilePropertiesFromGlobalTileID(I)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .locals 2
    .parameter "pGlobalTileID"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mFirstGlobalTileID:I

    sub-int v0, p1, v1

    .line 133
    .local v0, localTileID:I
    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTMXTileProperties:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    return-object v1
.end method

.method public getTexture()Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    return-object v0
.end method

.method public getTextureRegionFromGlobalTileID(I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 9
    .parameter "pGlobalTileID"

    .prologue
    .line 148
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mFirstGlobalTileID:I

    sub-int v6, p1, v0

    .line 149
    .local v6, localTileID:I
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTilesHorizontal:I

    rem-int v7, v6, v0

    .line 150
    .local v7, tileColumn:I
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTilesHorizontal:I

    div-int v8, v6, v0

    .line 152
    .local v8, tileRow:I
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mMargin:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mSpacing:I

    iget v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileWidth:I

    add-int/2addr v1, v4

    mul-int/2addr v1, v7

    add-int v2, v0, v1

    .line 153
    .local v2, texturePositionX:I
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mMargin:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mSpacing:I

    iget v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileHeight:I

    add-int/2addr v1, v4

    mul-int/2addr v1, v8

    add-int v3, v0, v1

    .line 155
    .local v3, texturePositionY:I
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    iget v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileWidth:I

    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileHeight:I

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    return-object v0
.end method

.method public final getTileHeight()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileHeight:I

    return v0
.end method

.method public final getTileWidth()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileWidth:I

    return v0
.end method

.method public setImageSource(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/xml/sax/Attributes;)V
    .locals 9
    .parameter "pContext"
    .parameter "pTextureManager"
    .parameter "pAttributes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 94
    const-string v4, ""

    const-string v5, "source"

    invoke-interface {p3, v4, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mImageSource:Ljava/lang/String;

    .line 96
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mImageSource:Ljava/lang/String;

    invoke-direct {v0, p1, v4}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 97
    .local v0, assetTextureSource:Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->getWidth()I

    move-result v4

    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileWidth:I

    iget v6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mMargin:I

    iget v7, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mSpacing:I

    invoke-static {v4, v5, v6, v7}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->determineCount(IIII)I

    move-result v4

    iput v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTilesHorizontal:I

    .line 98
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;->getHeight()I

    move-result v4

    iget v5, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTileHeight:I

    iget v6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mMargin:I

    iget v7, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mSpacing:I

    invoke-static {v4, v5, v6, v7}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->determineCount(IIII)I

    move-result v4

    iput v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTilesVertical:I

    .line 99
    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-static {v0, v4}, Lorg/anddev/andengine/opengl/texture/TextureFactory;->createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v4

    iput-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 101
    const-string v4, "trans"

    const/4 v5, 0x0

    invoke-static {p3, v4, v5}, Lorg/anddev/andengine/util/SAXUtils;->getAttribute(Lorg/xml/sax/Attributes;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 102
    .local v3, transparentColor:Ljava/lang/String;
    if-nez v3, :cond_0

    .line 103
    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-static {v4, v0, v8, v8}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 112
    :goto_0
    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {p2, v4}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 113
    return-void

    .line 106
    :cond_0
    :try_start_0
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v4, v3

    :goto_1
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    .line 107
    .local v1, color:I
    iget-object v4, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    new-instance v5, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;

    invoke-direct {v5, v0, v1}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;I)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v4, v5, v6, v7}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 108
    .end local v1           #color:I
    :catch_0
    move-exception v2

    .line 109
    .local v2, e:Ljava/lang/IllegalArgumentException;
    new-instance v4, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Illegal value: \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' for attribute \'trans\' supplied!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 106
    .end local v2           #e:Ljava/lang/IllegalArgumentException;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "#"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_1
.end method
