.class public abstract Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;
.super Ljava/lang/Object;
.source "BaseSingleValueInitializer.java"

# interfaces
.implements Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;


# instance fields
.field protected mMaxValue:F

.field protected mMinValue:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMinValue:F

    .line 29
    iput p2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMaxValue:F

    .line 30
    return-void
.end method

.method private final getRandomValue()F
    .locals 3

    .prologue
    .line 52
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMinValue:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMaxValue:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 53
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMaxValue:F

    .line 55
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMaxValue:F

    iget v2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMinValue:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->mMinValue:F

    add-float/2addr v0, v1

    goto :goto_0
.end method


# virtual methods
.method public onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;)V
    .locals 1
    .parameter "pParticle"

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->getRandomValue()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;->onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;F)V

    .line 45
    return-void
.end method

.method protected abstract onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;F)V
.end method
