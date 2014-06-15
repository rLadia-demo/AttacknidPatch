.class public abstract Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;
.source "BaseTripleValueSpanModifier.java"


# instance fields
.field private final mFromValueC:F

.field private final mSpanValueC:F

.field private final mToValueC:F


# direct methods
.method public constructor <init>(FFFFFFFF)V
    .locals 7
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pFromValueC"
    .parameter "pToValueC"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 28
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p7

    move v6, p8

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFFF)V

    .line 29
    iput p5, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mFromValueC:F

    .line 30
    iput p6, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mToValueC:F

    .line 32
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mToValueC:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mFromValueC:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mSpanValueC:F

    .line 33
    return-void
.end method

.method private final calculateValueC(F)F
    .locals 2
    .parameter "pPercent"

    .prologue
    .line 65
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mFromValueC:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mSpanValueC:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 1
    .parameter "pParticle"
    .parameter "pValueA"
    .parameter "pValueB"

    .prologue
    .line 52
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->mFromValueC:F

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V

    .line 53
    return-void
.end method

.method protected abstract onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
.end method

.method protected onSetValueInternal(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 3
    .parameter "pParticle"
    .parameter "pPercent"

    .prologue
    .line 57
    invoke-super {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->calculateValue(F)F

    move-result v0

    invoke-super {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;->calculateValueB(F)F

    move-result v1

    invoke-direct {p0, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->calculateValueC(F)F

    move-result v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;->onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V

    .line 58
    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pValueA"
    .parameter "pValueB"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 48
    return-void
.end method

.method protected abstract onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
.end method
