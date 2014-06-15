.class public abstract Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;
.super Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;
.source "BaseCircleParticleEmitter.java"


# instance fields
.field protected mRadiusX:F

.field protected mRadiusY:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"
    .parameter "pRadius"

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3, p3}, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;-><init>(FFFF)V

    .line 26
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"
    .parameter "pRadiusX"
    .parameter "pRadiusY"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/particle/emitter/BaseParticleEmitter;-><init>(FF)V

    .line 30
    invoke-virtual {p0, p3}, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->setRadiusX(F)V

    .line 31
    invoke-virtual {p0, p4}, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->setRadiusY(F)V

    .line 32
    return-void
.end method


# virtual methods
.method public getRadiusX()F
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusX:F

    return v0
.end method

.method public getRadiusY()F
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusY:F

    return v0
.end method

.method public setRadius(F)V
    .locals 0
    .parameter "pRadius"

    .prologue
    .line 55
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusX:F

    .line 56
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusY:F

    .line 57
    return-void
.end method

.method public setRadius(FF)V
    .locals 0
    .parameter "pRadiusX"
    .parameter "pRadiusY"

    .prologue
    .line 60
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusX:F

    .line 61
    iput p2, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusY:F

    .line 62
    return-void
.end method

.method public setRadiusX(F)V
    .locals 0
    .parameter "pRadiusX"

    .prologue
    .line 43
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusX:F

    .line 44
    return-void
.end method

.method public setRadiusY(F)V
    .locals 0
    .parameter "pRadiusY"

    .prologue
    .line 51
    iput p1, p0, Lorg/anddev/andengine/entity/particle/emitter/BaseCircleParticleEmitter;->mRadiusY:F

    .line 52
    return-void
.end method
