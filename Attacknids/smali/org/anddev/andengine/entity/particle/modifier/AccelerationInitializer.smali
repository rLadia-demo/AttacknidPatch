.class public Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;
.source "AccelerationInitializer.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pAcceleration"

    .prologue
    .line 23
    invoke-direct {p0, p1, p1}, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;-><init>(FF)V

    .line 24
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 27
    invoke-direct {p0, p1, p1, p2, p2}, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;-><init>(FFFF)V

    .line 28
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pMinAccelerationX"
    .parameter "pMaxAccelerationX"
    .parameter "pMinAccelerationY"
    .parameter "pMaxAccelerationY"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;-><init>(FFFF)V

    .line 32
    return-void
.end method


# virtual methods
.method public getMaxAccelerationX()F
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValue:F

    return v0
.end method

.method public getMaxAccelerationY()F
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValueB:F

    return v0
.end method

.method public getMinAccelerationX()F
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValue:F

    return v0
.end method

.method public getMinAccelerationY()F
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValueB:F

    return v0
.end method

.method public onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 87
    invoke-virtual {p1, p2, p3}, Lorg/anddev/andengine/entity/particle/Particle;->accelerate(FF)V

    .line 88
    return-void
.end method

.method public setAcceleration(FFFF)V
    .locals 0
    .parameter "pMinAccelerationX"
    .parameter "pMaxAccelerationX"
    .parameter "pMinAccelerationY"
    .parameter "pMaxAccelerationY"

    .prologue
    .line 75
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValue:F

    .line 76
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValue:F

    .line 77
    iput p3, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValueB:F

    .line 78
    iput p4, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValueB:F

    .line 79
    return-void
.end method

.method public setAccelerationX(F)V
    .locals 0
    .parameter "pAccelerationX"

    .prologue
    .line 55
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValue:F

    .line 56
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValue:F

    .line 57
    return-void
.end method

.method public setAccelerationX(FF)V
    .locals 0
    .parameter "pMinAccelerationX"
    .parameter "pMaxAccelerationX"

    .prologue
    .line 65
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValue:F

    .line 66
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValue:F

    .line 67
    return-void
.end method

.method public setAccelerationY(F)V
    .locals 0
    .parameter "pAccelerationY"

    .prologue
    .line 60
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValueB:F

    .line 61
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValueB:F

    .line 62
    return-void
.end method

.method public setAccelerationY(FF)V
    .locals 0
    .parameter "pMinAccelerationY"
    .parameter "pMaxAccelerationY"

    .prologue
    .line 70
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMinValueB:F

    .line 71
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/AccelerationInitializer;->mMaxValueB:F

    .line 72
    return-void
.end method
