.class public Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;
.super Ljava/lang/Object;
.source "PhysicsWorld.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# static fields
.field public static final POSITION_ITERATIONS_DEFAULT:I = 0x8

.field public static final VELOCITY_ITERATIONS_DEFAULT:I = 0x8


# instance fields
.field protected final mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

.field protected mPositionIterations:I

.field protected final mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

.field protected mVelocityIterations:I

.field protected final mWorld:Lcom/badlogic/gdx/physics/box2d/World;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "andenginephysicsbox2dextension"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Z)V
    .locals 1
    .parameter "pGravity"
    .parameter "pAllowSleep"

    .prologue
    const/16 v0, 0x8

    .line 52
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;-><init>(Lcom/badlogic/gdx/math/Vector2;ZII)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;ZII)V
    .locals 2
    .parameter "pGravity"
    .parameter "pAllowSleep"
    .parameter "pVelocityIterations"
    .parameter "pPositionIterations"

    .prologue
    const/16 v1, 0x8

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    .line 41
    new-instance v0, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    .line 44
    iput v1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mVelocityIterations:I

    .line 45
    iput v1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPositionIterations:I

    .line 56
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/World;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/physics/box2d/World;-><init>(Lcom/badlogic/gdx/math/Vector2;Z)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    .line 57
    return-void
.end method


# virtual methods
.method public QueryAABB(Lcom/badlogic/gdx/physics/box2d/QueryCallback;FFFF)V
    .locals 6
    .parameter "pCallback"
    .parameter "pLowerX"
    .parameter "pLowerY"
    .parameter "pUpperX"
    .parameter "pUpperY"

    .prologue
    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/World;->QueryAABB(Lcom/badlogic/gdx/physics/box2d/QueryCallback;FFFF)V

    .line 191
    return-void
.end method

.method public clearForces()V
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->clearForces()V

    .line 127
    return-void
.end method

.method public clearPhysicsConnectors()V
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;->clear()V

    .line 89
    return-void
.end method

.method public createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1
    .parameter "pDef"

    .prologue
    .line 130
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public createJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)Lcom/badlogic/gdx/physics/box2d/Joint;
    .locals 1
    .parameter "pDef"

    .prologue
    .line 134
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->createJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)Lcom/badlogic/gdx/physics/box2d/Joint;

    move-result-object v0

    return-object v0
.end method

.method public destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 1
    .parameter "pBody"

    .prologue
    .line 138
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 139
    return-void
.end method

.method public destroyJoint(Lcom/badlogic/gdx/physics/box2d/Joint;)V
    .locals 1
    .parameter "pJoint"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyJoint(Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 143
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->dispose()V

    .line 147
    return-void
.end method

.method public getAutoClearForces()Z
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getAutoClearForces()Z

    move-result v0

    return v0
.end method

.method public getBodies()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;"
        }
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getBodies()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getBodyCount()I
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getBodyCount()I

    move-result v0

    return v0
.end method

.method public getContactCount()I
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getContactCount()I

    move-result v0

    return v0
.end method

.method public getContactList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getContactList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getGravity()Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getGravity()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    return-object v0
.end method

.method public getJointCount()I
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getJointCount()I

    move-result v0

    return v0
.end method

.method public getJoints()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Joint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getJoints()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getPhysicsConnectorManager()Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    return-object v0
.end method

.method public getPositionIterations()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPositionIterations:I

    return v0
.end method

.method public getProxyCount()I
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->getProxyCount()I

    move-result v0

    return v0
.end method

.method public getVelocityIterations()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mVelocityIterations:I

    return v0
.end method

.method public isLocked()Z
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/World;->isLocked()Z

    move-result v0

    return v0
.end method

.method public onUpdate(F)V
    .locals 3
    .parameter "pSecondsElapsed"

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->onUpdate(F)V

    .line 106
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    iget v1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mVelocityIterations:I

    iget v2, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPositionIterations:I

    invoke-virtual {v0, p1, v1, v2}, Lcom/badlogic/gdx/physics/box2d/World;->step(FII)V

    .line 107
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;->onUpdate(F)V

    .line 108
    return-void
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "pRunnable"

    .prologue
    .line 122
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->postRunnable(Ljava/lang/Runnable;)V

    .line 123
    return-void
.end method

.method public registerPhysicsConnector(Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;)V
    .locals 1
    .parameter "pPhysicsConnector"

    .prologue
    .line 92
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;->add(Ljava/lang/Object;)Z

    .line 93
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;->reset()V

    .line 114
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->reset()V

    .line 115
    return-void
.end method

.method public setAutoClearForces(Z)V
    .locals 1
    .parameter "pFlag"

    .prologue
    .line 194
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setAutoClearForces(Z)V

    .line 195
    return-void
.end method

.method public setContactFilter(Lcom/badlogic/gdx/physics/box2d/ContactFilter;)V
    .locals 1
    .parameter "pFilter"

    .prologue
    .line 198
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setContactFilter(Lcom/badlogic/gdx/physics/box2d/ContactFilter;)V

    .line 199
    return-void
.end method

.method public setContactListener(Lcom/badlogic/gdx/physics/box2d/ContactListener;)V
    .locals 1
    .parameter "pListener"

    .prologue
    .line 202
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setContactListener(Lcom/badlogic/gdx/physics/box2d/ContactListener;)V

    .line 203
    return-void
.end method

.method public setContinuousPhysics(Z)V
    .locals 1
    .parameter "pFlag"

    .prologue
    .line 206
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setContinuousPhysics(Z)V

    .line 207
    return-void
.end method

.method public setDestructionListener(Lcom/badlogic/gdx/physics/box2d/DestructionListener;)V
    .locals 1
    .parameter "pListener"

    .prologue
    .line 210
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setDestructionListener(Lcom/badlogic/gdx/physics/box2d/DestructionListener;)V

    .line 211
    return-void
.end method

.method public setGravity(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1
    .parameter "pGravity"

    .prologue
    .line 214
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setGravity(Lcom/badlogic/gdx/math/Vector2;)V

    .line 215
    return-void
.end method

.method public setPositionIterations(I)V
    .locals 0
    .parameter "pPositionIterations"

    .prologue
    .line 72
    iput p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPositionIterations:I

    .line 73
    return-void
.end method

.method public setVelocityIterations(I)V
    .locals 0
    .parameter "pVelocityIterations"

    .prologue
    .line 80
    iput p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mVelocityIterations:I

    .line 81
    return-void
.end method

.method public setWarmStarting(Z)V
    .locals 1
    .parameter "pFlag"

    .prologue
    .line 218
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mWorld:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setWarmStarting(Z)V

    .line 219
    return-void
.end method

.method public unregisterPhysicsConnector(Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;)V
    .locals 1
    .parameter "pPhysicsConnector"

    .prologue
    .line 96
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->mPhysicsConnectorManager:Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnectorManager;->remove(Ljava/lang/Object;)Z

    .line 97
    return-void
.end method
