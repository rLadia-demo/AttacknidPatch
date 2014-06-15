.class public Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;
.source "RotationInitializer.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pRotation"

    .prologue
    .line 23
    invoke-direct {p0, p1, p1}, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;-><init>(FF)V

    .line 24
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pMinRotation"
    .parameter "pMaxRotation"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;-><init>(FF)V

    .line 28
    return-void
.end method


# virtual methods
.method public getMaxRotation()F
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMaxValue:F

    return v0
.end method

.method public getMinRotation()F
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMinValue:F

    return v0
.end method

.method public onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 0
    .parameter "pParticle"
    .parameter "pRotation"

    .prologue
    .line 58
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/particle/Particle;->setRotation(F)V

    .line 59
    return-void
.end method

.method public setRotation(F)V
    .locals 0
    .parameter "pRotation"

    .prologue
    .line 43
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMinValue:F

    .line 44
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMaxValue:F

    .line 45
    return-void
.end method

.method public setRotation(FF)V
    .locals 0
    .parameter "pMinRotation"
    .parameter "pMaxRotation"

    .prologue
    .line 48
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMinValue:F

    .line 49
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/RotationInitializer;->mMaxValue:F

    .line 50
    return-void
.end method
