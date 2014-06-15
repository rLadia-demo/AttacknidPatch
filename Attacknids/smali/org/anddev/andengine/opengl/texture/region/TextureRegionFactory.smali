.class public Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;
.super Ljava/lang/Object;
.source "TextureRegionFactory.java"


# static fields
.field private static sAssetBasePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-string v0, ""

    sput-object v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromAsset(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Landroid/content/Context;Ljava/lang/String;)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 3
    .parameter "pBuildableTexture"
    .parameter "pContext"
    .parameter "pAssetPath"

    .prologue
    .line 104
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 3
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"

    .prologue
    .line 66
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 67
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0, p3, p4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createFromResource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Landroid/content/Context;I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 2
    .parameter "pBuildableTexture"
    .parameter "pContext"
    .parameter "pDrawableResourceID"

    .prologue
    .line 115
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    invoke-direct {v0, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;-><init>(Landroid/content/Context;I)V

    .line 116
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createFromResource(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;III)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 2
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pDrawableResourceID"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"

    .prologue
    .line 77
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    invoke-direct {v0, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;-><init>(Landroid/content/Context;I)V

    .line 78
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0, p3, p4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 6
    .parameter "pBuildableTexture"
    .parameter "pTextureSource"

    .prologue
    const/4 v2, 0x0

    .line 126
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v4

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v5

    move-object v1, p0

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    .line 127
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    new-instance v1, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$1;

    invoke-direct {v1, v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$1;-><init>(Lorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    invoke-virtual {p0, p1, v1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/util/Callback;)V

    .line 133
    return-object v0
.end method

.method public static createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 6
    .parameter "pTexture"
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"

    .prologue
    .line 88
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v4

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v5

    move-object v1, p0

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    .line 89
    .local v0, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionX()I

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->getTexturePositionY()I

    move-result v2

    invoke-virtual {p0, p1, v1, v2}, Lorg/anddev/andengine/opengl/texture/Texture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    .line 90
    return-object v0
.end method

.method public static createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 3
    .parameter "pBuildableTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    .line 109
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 110
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0, p3, p4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 6
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    .line 71
    new-instance v1, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lorg/anddev/andengine/opengl/texture/source/AssetTextureSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .local v1, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    move-object v0, p0

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    .line 72
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public static createTiledFromResource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Landroid/content/Context;III)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 2
    .parameter "pBuildableTexture"
    .parameter "pContext"
    .parameter "pDrawableResourceID"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    .line 120
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    invoke-direct {v0, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;-><init>(Landroid/content/Context;I)V

    .line 121
    .local v0, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {p0, v0, p3, p4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v1

    return-object v1
.end method

.method public static createTiledFromResource(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;IIIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 6
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pDrawableResourceID"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    .line 82
    new-instance v1, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;

    invoke-direct {v1, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/ResourceTextureSource;-><init>(Landroid/content/Context;I)V

    .local v1, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    move-object v0, p0

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    .line 83
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public static createTiledFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 8
    .parameter "pBuildableTexture"
    .parameter "pTextureSource"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    const/4 v2, 0x0

    .line 137
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v4

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v5

    move-object v1, p0

    move v3, v2

    move v6, p2

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIIIII)V

    .line 138
    .local v0, tiledTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    new-instance v1, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;

    invoke-direct {v1, v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;-><init>(Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    invoke-virtual {p0, p1, v1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/util/Callback;)V

    .line 144
    return-object v0
.end method

.method public static createTiledFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 8
    .parameter "pTexture"
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pTileColumns"
    .parameter "pTileRows"

    .prologue
    .line 94
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v4

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v5

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIIIII)V

    .line 95
    .local v0, tiledTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionX()I

    move-result v1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTexturePositionY()I

    move-result v2

    invoke-virtual {p0, p1, v1, v2}, Lorg/anddev/andengine/opengl/texture/Texture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    .line 96
    return-object v0
.end method

.method public static extractFromTexture(Lorg/anddev/andengine/opengl/texture/Texture;IIII)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 6
    .parameter "pTexture"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 58
    new-instance v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V

    return-object v0
.end method

.method public static setAssetBasePath(Ljava/lang/String;)V
    .locals 2
    .parameter "pAssetBasePath"

    .prologue
    .line 42
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 43
    :cond_0
    sput-object p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->sAssetBasePath:Ljava/lang/String;

    .line 47
    return-void

    .line 45
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "pAssetBasePath must end with \'/\' or be lenght zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
