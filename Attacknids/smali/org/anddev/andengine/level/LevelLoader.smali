.class public Lorg/anddev/andengine/level/LevelLoader;
.super Ljava/lang/Object;
.source "LevelLoader.java"

# interfaces
.implements Lorg/anddev/andengine/level/util/constants/LevelConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;
    }
.end annotation


# instance fields
.field private mAssetBasePath:Ljava/lang/String;

.field private final mEntityLoaders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, ""

    invoke-direct {p0, v0}, Lorg/anddev/andengine/level/LevelLoader;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "pAssetBasePath"

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/level/LevelLoader;->mEntityLoaders:Ljava/util/HashMap;

    .line 48
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/level/LevelLoader;->setAssetBasePath(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public loadLevelFromAsset(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter "pContext"
    .parameter "pAssetPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/anddev/andengine/level/LevelLoader;->mAssetBasePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/level/LevelLoader;->loadLevelFromStream(Ljava/io/InputStream;)V

    .line 88
    return-void
.end method

.method public loadLevelFromResource(Landroid/content/Context;I)V
    .locals 1
    .parameter "pContext"
    .parameter "pRawResourceID"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/level/LevelLoader;->loadLevelFromStream(Ljava/io/InputStream;)V

    .line 92
    return-void
.end method

.method public loadLevelFromStream(Ljava/io/InputStream;)V
    .locals 8
    .parameter "pInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v4

    .line 97
    .local v4, spf:Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    .line 99
    .local v3, sp:Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v5

    .line 100
    .local v5, xr:Lorg/xml/sax/XMLReader;
    new-instance v0, Lorg/anddev/andengine/level/LevelParser;

    iget-object v6, p0, Lorg/anddev/andengine/level/LevelLoader;->mEntityLoaders:Ljava/util/HashMap;

    invoke-direct {v0, v6}, Lorg/anddev/andengine/level/LevelParser;-><init>(Ljava/util/HashMap;)V

    .line 101
    .local v0, levelParser:Lorg/anddev/andengine/level/LevelParser;
    invoke-interface {v5, v0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 103
    new-instance v6, Lorg/xml/sax/InputSource;

    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-direct {v7, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v5, v6}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 111
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 113
    .end local v0           #levelParser:Lorg/anddev/andengine/level/LevelParser;
    .end local v3           #sp:Ljavax/xml/parsers/SAXParser;
    .end local v4           #spf:Ljavax/xml/parsers/SAXParserFactory;
    .end local v5           #xr:Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v2

    .line 105
    .local v2, se:Lorg/xml/sax/SAXException;
    :try_start_1
    invoke-static {v2}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 107
    .end local v2           #se:Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v1

    .line 108
    .local v1, pe:Ljavax/xml/parsers/ParserConfigurationException;
    :try_start_2
    invoke-static {v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_0

    .line 110
    .end local v1           #pe:Ljavax/xml/parsers/ParserConfigurationException;
    :catchall_0
    move-exception v6

    .line 111
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 112
    throw v6
.end method

.method public registerEntityLoader(Ljava/lang/String;Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;)V
    .locals 1
    .parameter "pEntityName"
    .parameter "pEntityLoader"

    .prologue
    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/level/LevelLoader;->mEntityLoaders:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method

.method public registerEntityLoader([Ljava/lang/String;Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;)V
    .locals 3
    .parameter "pEntityNames"
    .parameter "pEntityLoader"

    .prologue
    .line 79
    iget-object v0, p0, Lorg/anddev/andengine/level/LevelLoader;->mEntityLoaders:Ljava/util/HashMap;

    .line 81
    .local v0, entityLoaders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;>;"
    array-length v2, p1

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 84
    return-void

    .line 82
    :cond_0
    aget-object v2, p1, v1

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public setAssetBasePath(Ljava/lang/String;)V
    .locals 2
    .parameter "pAssetBasePath"

    .prologue
    .line 59
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 60
    :cond_0
    iput-object p1, p0, Lorg/anddev/andengine/level/LevelLoader;->mAssetBasePath:Ljava/lang/String;

    .line 64
    return-void

    .line 62
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "pAssetBasePath must end with \'/\' or be lenght zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
