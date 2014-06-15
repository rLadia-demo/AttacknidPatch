.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;
.super Ljava/lang/Object;
.source "TSXLoader.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

.field private final mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/TextureOptions;)V
    .locals 0
    .parameter "pContext"
    .parameter "pTextureManager"
    .parameter "pTextureOptions"

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mContext:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    .line 44
    iput-object p3, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 45
    return-void
.end method

.method private load(ILjava/io/InputStream;)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    .locals 9
    .parameter "pFirstGlobalTileID"
    .parameter "pInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;
        }
    .end annotation

    .prologue
    .line 69
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    .line 70
    .local v3, spf:Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 72
    .local v2, sp:Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v5

    .line 73
    .local v5, xr:Lorg/xml/sax/XMLReader;
    new-instance v4, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXParser;

    iget-object v6, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mContext:Landroid/content/Context;

    iget-object v7, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    iget-object v8, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v4, v6, v7, v8, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXParser;-><init>(Landroid/content/Context;Lorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/TextureOptions;I)V

    .line 74
    .local v4, tsxParser:Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXParser;
    invoke-interface {v5, v4}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 76
    new-instance v6, Lorg/xml/sax/InputSource;

    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-direct {v7, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v5, v6}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 78
    invoke-virtual {v4}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXParser;->getTMXTileSet()Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .line 83
    .end local v2           #sp:Ljavax/xml/parsers/SAXParser;
    .end local v3           #spf:Ljavax/xml/parsers/SAXParserFactory;
    .end local v4           #tsxParser:Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXParser;
    .end local v5           #xr:Lorg/xml/sax/XMLReader;
    :goto_0
    return-object v6

    .line 79
    :catch_0
    move-exception v0

    .line 80
    .local v0, e:Lorg/xml/sax/SAXException;
    new-instance v6, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;

    invoke-direct {v6, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 81
    .end local v0           #e:Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v1

    .line 83
    .local v1, pe:Ljavax/xml/parsers/ParserConfigurationException;
    const/4 v6, 0x0

    goto :goto_0

    .line 84
    .end local v1           #pe:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_2
    move-exception v0

    .line 85
    .local v0, e:Ljava/io/IOException;
    new-instance v6, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;

    invoke-direct {v6, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method


# virtual methods
.method public loadFromAsset(Landroid/content/Context;ILjava/lang/String;)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    .locals 4
    .parameter "pContext"
    .parameter "pFirstGlobalTileID"
    .parameter "pAssetPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;
        }
    .end annotation

    .prologue
    .line 61
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TSXLoader;->load(ILjava/io/InputStream;)Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXTileSet;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Could not load TMXTileSet from asset: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
