.class public Lorg/anddev/andengine/level/LevelParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "LevelParser.java"

# interfaces
.implements Lorg/anddev/andengine/level/util/constants/LevelConstants;


# instance fields
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
.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, pEntityLoaders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;>;"
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/anddev/andengine/level/LevelParser;->mEntityLoaders:Ljava/util/HashMap;

    .line 32
    return-void
.end method


# virtual methods
.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 4
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
    .line 44
    iget-object v1, p0, Lorg/anddev/andengine/level/LevelParser;->mEntityLoaders:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;

    .line 45
    .local v0, entityLoader:Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;
    if-eqz v0, :cond_0

    .line 46
    invoke-interface {v0, p2, p4}, Lorg/anddev/andengine/level/LevelLoader$IEntityLoader;->onLoadEntity(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 50
    return-void

    .line 48
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected tag: \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
