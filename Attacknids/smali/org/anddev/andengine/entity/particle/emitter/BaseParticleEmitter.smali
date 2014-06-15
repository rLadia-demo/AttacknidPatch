.class public abstract Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;
.super Ljava/lang/Object;
.source "BaseParticleEmitter.java"

# interfaces
.implements Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;


# instance fields
.field protected mCenterX:F

.field protected mCenterY:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterX:F

    .line 25
    iput p2, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterY:F

    .line 26
    return-void
.end method


# virtual methods
.method public getCenterX()F
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterX:F

    return v0
.end method

.method public getCenterY()F
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterY:F

    return v0
.end method

.method public onUpdate(F)V
    .locals 0
    .parameter "pSecondsElapsed"

    .prologue
    .line 60
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 65
    return-void
.end method

.method public setCenter(FF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 49
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterX:F

    .line 50
    iput p2, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterY:F

    .line 51
    return-void
.end method

.method public setCenterX(F)V
    .locals 0
    .parameter "pCenterX"

    .prologue
    .line 41
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterX:F

    .line 42
    return-void
.end method

.method public setCenterY(F)V
    .locals 0
    .parameter "pCenterY"

    .prologue
    .line 45
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;->mCenterY:F

    .line 46
    return-void
.end method
