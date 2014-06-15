.class public Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;
.super Lorg/anddev/andengine/util/pool/RunnablePoolItem;
.source "EntityRemoveRunnablePoolItem.java"


# instance fields
.field protected mEntity:Lorg/anddev/andengine/entity/IEntity;

.field protected mLayer:Lorg/anddev/andengine/entity/layer/ILayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/anddev/andengine/util/pool/RunnablePoolItem;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mLayer:Lorg/anddev/andengine/entity/layer/ILayer;

    iget-object v1, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/entity/layer/ILayer;->removeEntity(Lorg/anddev/andengine/entity/IEntity;)Z

    .line 50
    return-void
.end method

.method public set(Lorg/anddev/andengine/entity/IEntity;Lorg/anddev/andengine/entity/layer/ILayer;)V
    .locals 0
    .parameter "pEntity"
    .parameter "pLayer"

    .prologue
    .line 39
    iput-object p1, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 40
    iput-object p2, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mLayer:Lorg/anddev/andengine/entity/layer/ILayer;

    .line 41
    return-void
.end method

.method public setEntity(Lorg/anddev/andengine/entity/IEntity;)V
    .locals 0
    .parameter "pEntity"

    .prologue
    .line 31
    iput-object p1, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 32
    return-void
.end method

.method public setLayer(Lorg/anddev/andengine/entity/layer/ILayer;)V
    .locals 0
    .parameter "pLayer"

    .prologue
    .line 35
    iput-object p1, p0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;->mLayer:Lorg/anddev/andengine/entity/layer/ILayer;

    .line 36
    return-void
.end method
