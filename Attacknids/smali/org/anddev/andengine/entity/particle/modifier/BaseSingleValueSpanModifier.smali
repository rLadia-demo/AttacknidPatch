.class public abstract Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;
.super Ljava/lang/Object;
.source "BaseSingleValueSpanModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;


# instance fields
.field private final mDuration:F

.field private final mFromTime:F

.field private final mFromValue:F

.field private final mSpanValue:F

.field private final mToTime:F

.field private final mToValue:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 2
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    .line 33
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mToValue:F

    .line 34
    iput p3, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromTime:F

    .line 35
    iput p4, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mToTime:F

    .line 37
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mToValue:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mSpanValue:F

    .line 38
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mToTime:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromTime:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mDuration:F

    .line 39
    return-void
.end method


# virtual methods
.method protected final calculateValue(F)F
    .locals 2
    .parameter "pPercent"

    .prologue
    .line 71
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mSpanValue:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method public onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;)V
    .locals 1
    .parameter "pParticle"

    .prologue
    .line 54
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->onSetInitialValue(Lorg/anddev/andengine/entity/particle/Particle;F)V

    .line 55
    return-void
.end method

.method protected abstract onSetInitialValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
.end method

.method protected abstract onSetValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
.end method

.method protected onSetValueInternal(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 1
    .parameter "pParticle"
    .parameter "pPercent"

    .prologue
    .line 67
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->calculateValue(F)F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->onSetValue(Lorg/anddev/andengine/entity/particle/Particle;F)V

    .line 68
    return-void
.end method

.method public onUpdateParticle(Lorg/anddev/andengine/entity/particle/Particle;)V
    .locals 4
    .parameter "pParticle"

    .prologue
    .line 59
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/particle/Particle;->getLifeTime()F

    move-result v0

    .line 60
    .local v0, lifeTime:F
    iget v2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromTime:F

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    iget v2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mToTime:F

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    .line 61
    iget v2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mFromTime:F

    sub-float v2, v0, v2

    iget v3, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->mDuration:F

    div-float v1, v2, v3

    .line 62
    .local v1, percent:F
    invoke-virtual {p0, p1, v1}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->onSetValueInternal(Lorg/anddev/andengine/entity/particle/Particle;F)V

    .line 64
    .end local v1           #percent:F
    :cond_0
    return-void
.end method
