.class public Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;
.super Ljava/lang/Object;
.source "CollisionHandler.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# instance fields
.field private final mCheckShape:Lorg/anddev/andengine/entity/shape/IShape;

.field private final mCollisionCallback:Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;

.field private final mTargetStaticEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<+",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;Lorg/anddev/andengine/entity/shape/IShape;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "pCollisionCallback"
    .parameter "pCheckShape"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            "Ljava/util/ArrayList",
            "<+",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 34
    .local p3, pTargetStaticEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<+Lorg/anddev/andengine/entity/shape/IShape;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    if-nez p1, :cond_0

    .line 36
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pCollisionCallback must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    if-nez p2, :cond_1

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pCheckShape must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_1
    if-nez p3, :cond_2

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pTargetStaticEntities must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_2
    iput-object p1, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mCollisionCallback:Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;

    .line 46
    iput-object p2, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mCheckShape:Lorg/anddev/andengine/entity/shape/IShape;

    .line 47
    iput-object p3, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mTargetStaticEntities:Ljava/util/ArrayList;

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;Lorg/anddev/andengine/entity/shape/IShape;Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 1
    .parameter "pCollisionCallback"
    .parameter "pCheckShape"
    .parameter "pTargetShape"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-static {p3}, Lorg/anddev/andengine/util/ListUtils;->toList(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;-><init>(Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;Lorg/anddev/andengine/entity/shape/IShape;Ljava/util/ArrayList;)V

    .line 32
    return-void
.end method


# virtual methods
.method public onUpdate(F)V
    .locals 7
    .parameter "pSecondsElapsed"

    .prologue
    .line 60
    iget-object v0, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mCheckShape:Lorg/anddev/andengine/entity/shape/IShape;

    .line 61
    .local v0, checkShape:Lorg/anddev/andengine/entity/shape/IShape;
    iget-object v3, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mTargetStaticEntities:Ljava/util/ArrayList;

    .line 62
    .local v3, staticEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<+Lorg/anddev/andengine/entity/shape/IShape;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 64
    .local v4, staticEntityCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v4, :cond_1

    .line 72
    :cond_0
    return-void

    .line 65
    :cond_1
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-interface {v0, v5}, Lorg/anddev/andengine/entity/shape/IShape;->collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 66
    iget-object v6, p0, Lorg/anddev/andengine/engine/handler/collision/CollisionHandler;->mCollisionCallback:Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-interface {v6, v0, v5}, Lorg/anddev/andengine/engine/handler/collision/ICollisionCallback;->onCollision(Lorg/anddev/andengine/entity/shape/IShape;Lorg/anddev/andengine/entity/shape/IShape;)Z

    move-result v2

    .line 67
    .local v2, proceed:Z
    if-eqz v2, :cond_0

    .line 64
    .end local v2           #proceed:Z
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 77
    return-void
.end method
