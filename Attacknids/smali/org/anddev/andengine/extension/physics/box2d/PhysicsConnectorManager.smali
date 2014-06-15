.class public Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;
.super Ljava/util/ArrayList;
.source "PhysicsConnectorManager.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;",
        ">;",
        "Lorg/anddev/andengine/engine/handler/IUpdateHandler;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5bb2994d7a3b7a7L


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    return-void
.end method


# virtual methods
.method public findBodyByShape(Lorg/anddev/andengine/entity/shape/Shape;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 4
    .parameter "pShape"

    .prologue
    .line 62
    move-object v2, p0

    .line 63
    .local v2, physicsConnectors:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 69
    const/4 v3, 0x0

    :goto_1
    return-object v3

    .line 64
    :cond_0
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;

    .line 65
    .local v1, physicsConnector:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;
    iget-object v3, v1, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    if-ne v3, p1, :cond_1

    .line 66
    iget-object v3, v1, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mBody:Lcom/badlogic/gdx/physics/box2d/Body;

    goto :goto_1

    .line 63
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public findPhysicsConnectorByShape(Lorg/anddev/andengine/entity/shape/Shape;)Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;
    .locals 4
    .parameter "pShape"

    .prologue
    .line 73
    move-object v2, p0

    .line 74
    .local v2, physicsConnectors:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 80
    const/4 v1, 0x0

    :cond_0
    return-object v1

    .line 75
    :cond_1
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;

    .line 76
    .local v1, physicsConnector:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;
    iget-object v3, v1, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    if-eq v3, p1, :cond_0

    .line 74
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public onUpdate(F)V
    .locals 3
    .parameter "pSecondsElapsed"

    .prologue
    .line 43
    move-object v1, p0

    .line 44
    .local v1, physicsConnectors:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 47
    return-void

    .line 45
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;

    invoke-virtual {v2, p1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->onUpdate(F)V

    .line 44
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 51
    move-object v1, p0

    .line 52
    .local v1, physicsConnectors:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 55
    return-void

    .line 53
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;

    invoke-virtual {v2}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->reset()V

    .line 52
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
