.class public abstract Lorg/anddev/andengine/entity/layer/BaseLayer;
.super Lorg/anddev/andengine/entity/Entity;
.source "BaseLayer.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/ILayer;


# instance fields
.field private final mTouchAreas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/BaseLayer;->mTouchAreas:Ljava/util/ArrayList;

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pZIndex"

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/Entity;-><init>(I)V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/BaseLayer;->mTouchAreas:Ljava/util/ArrayList;

    .line 33
    return-void
.end method


# virtual methods
.method public getTouchAreas()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/BaseLayer;->mTouchAreas:Ljava/util/ArrayList;

    return-object v0
.end method

.method public registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
    .locals 1
    .parameter "pTouchArea"

    .prologue
    .line 45
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/BaseLayer;->mTouchAreas:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public unregisterTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
    .locals 1
    .parameter "pTouchArea"

    .prologue
    .line 50
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/BaseLayer;->mTouchAreas:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method
