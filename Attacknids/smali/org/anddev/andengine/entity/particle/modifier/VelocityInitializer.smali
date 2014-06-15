.class public Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;
.source "VelocityInitializer.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pVelocity"

    .prologue
    .line 23
    invoke-direct {p0, p1, p1, p1, p1}, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;-><init>(FFFF)V

    .line 24
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pVelocityX"
    .parameter "pVelocityY"

    .prologue
    .line 27
    invoke-direct {p0, p1, p1, p2, p2}, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;-><init>(FFFF)V

    .line 28
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pMinVelocityX"
    .parameter "pMaxVelocityX"
    .parameter "pMinVelocityY"
    .parameter "pMaxVelocityY"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;-><init>(FFFF)V

    .line 32
    return-void
.end method


# virtual methods
.method public getMaxVelocityX()F
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValue:F

    return v0
.end method

.method public getMaxVelocityY()F
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValueB:F

    return v0
.end method

.method public getMinVelocityX()F
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValue:F

    return v0
.end method

.method public getMinVelocityY()F
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValueB:F

    return v0
.end method

.method public onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pVelocityX"
    .parameter "pVelocityY"

    .prologue
    .line 87
    invoke-virtual {p1, p2, p3}, Lorg/anddev/andengine/entity/particle/Particle;->setVelocity(FF)V

    .line 88
    return-void
.end method

.method public setVelocity(FFFF)V
    .locals 0
    .parameter "pMinVelocityX"
    .parameter "pMaxVelocityX"
    .parameter "pMinVelocityY"
    .parameter "pMaxVelocityY"

    .prologue
    .line 75
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValue:F

    .line 76
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValue:F

    .line 77
    iput p3, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValueB:F

    .line 78
    iput p4, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValueB:F

    .line 79
    return-void
.end method

.method public setVelocityX(F)V
    .locals 0
    .parameter "pVelocityX"

    .prologue
    .line 55
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValue:F

    .line 56
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValue:F

    .line 57
    return-void
.end method

.method public setVelocityX(FF)V
    .locals 0
    .parameter "pMinVelocityX"
    .parameter "pMaxVelocityX"

    .prologue
    .line 65
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValue:F

    .line 66
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValue:F

    .line 67
    return-void
.end method

.method public setVelocityY(F)V
    .locals 0
    .parameter "pVelocityY"

    .prologue
    .line 60
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValueB:F

    .line 61
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValueB:F

    .line 62
    return-void
.end method

.method public setVelocityY(FF)V
    .locals 0
    .parameter "pMinVelocityY"
    .parameter "pMaxVelocityY"

    .prologue
    .line 70
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMinValueB:F

    .line 71
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/VelocityInitializer;->mMaxValueB:F

    .line 72
    return-void
.end method
