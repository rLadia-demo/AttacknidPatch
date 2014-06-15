.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;
.super Ljava/lang/Object;
.source "TMXObjectGroup.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;


# instance fields
.field private final mHeight:I

.field private final mName:Ljava/lang/String;

.field private final mTMXObjectGroupProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;",
            ">;"
        }
    .end annotation
.end field

.field private final mTMXObjects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;",
            ">;"
        }
    .end annotation
.end field

.field private final mWidth:I


# direct methods
.method public constructor <init>(Lorg/xml/sax/Attributes;)V
    .locals 2
    .parameter "pAttributes"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjects:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    invoke-direct {v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjectGroupProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    .line 33
    const-string v0, ""

    const-string v1, "name"

    invoke-interface {p1, v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mName:Ljava/lang/String;

    .line 34
    const-string v0, "width"

    invoke-static {p1, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mWidth:I

    .line 35
    const-string v0, "height"

    invoke-static {p1, v0}, Lorg/anddev/andengine/util/SAXUtils;->getIntAttributeOrThrow(Lorg/xml/sax/Attributes;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mHeight:I

    .line 36
    return-void
.end method


# virtual methods
.method addTMXObject(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;)V
    .locals 1
    .parameter "pTMXObject"

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjects:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public addTMXObjectGroupProperty(Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;)V
    .locals 1
    .parameter "pTMXObjectGroupProperty"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjectGroupProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->add(Ljava/lang/Object;)Z

    .line 64
    return-void
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mHeight:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getTMXObjectGroupProperties()Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroupProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjectGroupProperties:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;

    return-object v0
.end method

.method public getTMXObjects()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mTMXObjects:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXObjectGroup;->mWidth:I

    return v0
.end method
