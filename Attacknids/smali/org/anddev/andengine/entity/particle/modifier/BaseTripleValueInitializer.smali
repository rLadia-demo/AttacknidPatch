.class public abstract Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;
.source "BaseTripleValueInitializer.java"


# instance fields
.field protected mMaxValueC:F

.field protected mMinValueC:F


# direct methods
.method public constructor <init>(FFFFFF)V
    .locals 0
    .parameter "pMinValueA"
    .parameter "pMaxValueA"
    .parameter "pMinValueB"
    .parameter "pMaxValueB"
    .parameter "pMinValueC"
    .parameter "pMaxValueC"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueInitializer;-><init>(FFFF)V

    .line 29
    iput p5, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMinValueC:F

    .line 30
    iput p6, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMaxValueC:F

    .line 31
    return-void
.end method

.method private final getRandomValueC()F
    .locals 3

    .prologue
    .line 53
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMinValueC:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMaxValueC:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 54
    iget v0, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMaxValueC:F

    .line 56
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMaxValueC:F

    iget v2, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMinValueC:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    iget v1, p0, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->mMinValueC:F

    add-float/2addr v0, v1

    goto :goto_0
.end method


# virtual methods
.method protected onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 1
    .parameter "pParticle"
    .parameter "pValueA"
    .parameter "pValueB"

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->getRandomValueC()F

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;->onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FFF)V

    .line 46
    return-void
.end method

.method protected abstract onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
.end method
