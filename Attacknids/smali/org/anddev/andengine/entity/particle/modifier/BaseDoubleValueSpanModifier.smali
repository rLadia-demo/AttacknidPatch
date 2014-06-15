.class public abstract Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;
.source "BaseDoubleValueSpanModifier.java"


# instance fields
.field private final mFromValueB:F

.field private final mSpanValueB:F

.field private final mToValueB:F


# direct methods
.method public constructor <init>(FFFFFF)V
    .locals 2
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p5, p6}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;-><init>(FFFF)V

    .line 29
    iput p3, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mFromValueB:F

    .line 30
    iput p4, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mToValueB:F

    .line 32
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mToValueB:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mFromValueB:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mSpanValueB:F

    .line 33
    return-void
.end method


# virtual methods
.method protected final calculateValueB(F)F
    .locals 2
    .parameter "pPercent"

    .prologue
    .line 65
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mFromValueB:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mSpanValueB:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method public onSetInitialValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 1
    .parameter "pParticle"
    .parameter "pValueA"

    .prologue
    .line 52
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->mFromValueB:F

    invoke-virtual {p0, p1, p2, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V

    .line 53
    return-void
.end method

.method protected abstract onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
.end method

.method protected onSetValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 0
    .parameter "pParticle"
    .parameter "pValue"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 45
    return-void
.end method

.method protected onSetValueInternal(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 2
    .parameter "pParticle"
    .parameter "pPercent"

    .prologue
    .line 57
    invoke-super {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;->calculateValue(F)F

    move-result v0

    invoke-virtual {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->calculateValueB(F)F

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V

    .line 58
    return-void
.end method

.method protected abstract onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
.end method
