.class public Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;
.super Ljava/lang/Object;
.source "PhysicsConnector.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;
.implements Lorg/anddev/andengine/extension/physics/box2d/util/constants/PhysicsConstants;


# instance fields
.field protected final mBody:Lcom/badlogic/gdx/physics/box2d/Body;

.field protected final mPixelToMeterRatio:F

.field protected final mShape:Lorg/anddev/andengine/entity/shape/Shape;

.field protected final mShapeHalfBaseHeight:F

.field protected final mShapeHalfBaseWidth:F

.field protected mUpdateAngularVelocity:Z

.field protected mUpdateLinearVelocity:Z

.field protected mUpdatePosition:Z

.field protected mUpdateRotation:Z


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 7
    .parameter "pShape"
    .parameter "pBody"

    .prologue
    const/4 v3, 0x1

    .line 41
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, v3

    move v5, v3

    move v6, v3

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;-><init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;ZZZZ)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;F)V
    .locals 8
    .parameter "pShape"
    .parameter "pBody"
    .parameter "pPixelToMeterRatio"

    .prologue
    const/4 v3, 0x1

    .line 45
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, v3

    move v5, v3

    move v6, v3

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;-><init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;ZZZZF)V

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;ZZZZ)V
    .locals 8
    .parameter "pShape"
    .parameter "pBody"
    .parameter "pUdatePosition"
    .parameter "pUpdateRotation"
    .parameter "pUpdateLinearVelocity"
    .parameter "pUpdateAngularVelocity"

    .prologue
    .line 49
    const/high16 v7, 0x4200

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;-><init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;ZZZZF)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/Body;ZZZZF)V
    .locals 2
    .parameter "pShape"
    .parameter "pBody"
    .parameter "pUdatePosition"
    .parameter "pUpdateRotation"
    .parameter "pUpdateLinearVelocity"
    .parameter "pUpdateAngularVelocity"
    .parameter "pPixelToMeterRatio"

    .prologue
    const/high16 v1, 0x3f00

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    .line 54
    iput-object p2, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mBody:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 56
    iput-boolean p3, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdatePosition:Z

    .line 57
    iput-boolean p4, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateRotation:Z

    .line 58
    iput-boolean p5, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateLinearVelocity:Z

    .line 59
    iput-boolean p6, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateAngularVelocity:Z

    .line 60
    iput p7, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mPixelToMeterRatio:F

    .line 62
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getBaseWidth()F

    move-result v0

    mul-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShapeHalfBaseWidth:F

    .line 63
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getBaseHeight()F

    move-result v0

    mul-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShapeHalfBaseHeight:F

    .line 64
    return-void
.end method


# virtual methods
.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mBody:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getShape()Lorg/anddev/andengine/entity/shape/Shape;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    return-object v0
.end method

.method public isUpdateAngularVelocity()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateAngularVelocity:Z

    return v0
.end method

.method public isUpdateLinearVelocity()Z
    .locals 1

    .prologue
    .line 87
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateLinearVelocity:Z

    return v0
.end method

.method public isUpdatePosition()Z
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdatePosition:Z

    return v0
.end method

.method public isUpdateRotation()Z
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateRotation:Z

    return v0
.end method

.method public onUpdate(F)V
    .locals 10
    .parameter "pSecondsElapsed"

    .prologue
    .line 116
    iget-object v6, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    .line 117
    .local v6, shape:Lorg/anddev/andengine/entity/shape/Shape;
    iget-object v2, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mBody:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 119
    .local v2, body:Lcom/badlogic/gdx/physics/box2d/Body;
    iget-boolean v7, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdatePosition:Z

    if-eqz v7, :cond_0

    .line 120
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v5

    .line 121
    .local v5, position:Lcom/badlogic/gdx/math/Vector2;
    iget v4, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mPixelToMeterRatio:F

    .line 122
    .local v4, pixelToMeterRatio:F
    iget v7, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float/2addr v7, v4

    iget v8, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShapeHalfBaseWidth:F

    sub-float/2addr v7, v8

    iget v8, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float/2addr v8, v4

    iget v9, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mShapeHalfBaseHeight:F

    sub-float/2addr v8, v9

    invoke-virtual {v6, v7, v8}, Lorg/anddev/andengine/entity/shape/Shape;->setPosition(FF)V

    .line 125
    .end local v4           #pixelToMeterRatio:F
    .end local v5           #position:Lcom/badlogic/gdx/math/Vector2;
    :cond_0
    iget-boolean v7, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateRotation:Z

    if-eqz v7, :cond_1

    .line 126
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v0

    .line 127
    .local v0, angle:F
    invoke-static {v0}, Lorg/anddev/andengine/util/MathUtils;->radToDeg(F)F

    move-result v7

    invoke-virtual {v6, v7}, Lorg/anddev/andengine/entity/shape/Shape;->setRotation(F)V

    .line 130
    .end local v0           #angle:F
    :cond_1
    iget-boolean v7, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateLinearVelocity:Z

    if-eqz v7, :cond_2

    .line 131
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/Body;->getLinearVelocity()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v3

    .line 132
    .local v3, linearVelocity:Lcom/badlogic/gdx/math/Vector2;
    iget v7, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v8, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {v6, v7, v8}, Lorg/anddev/andengine/entity/shape/Shape;->setVelocity(FF)V

    .line 135
    .end local v3           #linearVelocity:Lcom/badlogic/gdx/math/Vector2;
    :cond_2
    iget-boolean v7, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateAngularVelocity:Z

    if-eqz v7, :cond_3

    .line 136
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngularVelocity()F

    move-result v1

    .line 137
    .local v1, angularVelocity:F
    invoke-virtual {v6, v1}, Lorg/anddev/andengine/entity/shape/Shape;->setAngularVelocity(F)V

    .line 139
    .end local v1           #angularVelocity:F
    :cond_3
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 144
    return-void
.end method

.method public setUpdateAngularVelocity(Z)V
    .locals 0
    .parameter "pUpdateAngularVelocity"

    .prologue
    .line 107
    iput-boolean p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateAngularVelocity:Z

    .line 108
    return-void
.end method

.method public setUpdateLinearVelocity(Z)V
    .locals 0
    .parameter "pUpdateLinearVelocity"

    .prologue
    .line 103
    iput-boolean p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateLinearVelocity:Z

    .line 104
    return-void
.end method

.method public setUpdatePosition(Z)V
    .locals 0
    .parameter "pUpdatePosition"

    .prologue
    .line 95
    iput-boolean p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdatePosition:Z

    .line 96
    return-void
.end method

.method public setUpdateRotation(Z)V
    .locals 0
    .parameter "pUpdateRotation"

    .prologue
    .line 99
    iput-boolean p1, p0, Lorg/anddev/andengine/extension/physics/box2d/PhysicsConnector;->mUpdateRotation:Z

    .line 100
    return-void
.end method
