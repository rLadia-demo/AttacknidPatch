.class public Lorg/anddev/andengine/entity/scene/background/AutoParallaxBackground;
.super Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;
.source "AutoParallaxBackground.java"


# instance fields
.field private final mParallaxChangePerSecond:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pParallaxChangePerSecond"

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;-><init>(FFF)V

    .line 26
    iput p4, p0, Lorg/anddev/andengine/entity/scene/background/AutoParallaxBackground;->mParallaxChangePerSecond:F

    .line 27
    return-void
.end method


# virtual methods
.method public onUpdate(F)V
    .locals 2
    .parameter "pSecondsElapsed"

    .prologue
    .line 39
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->onUpdate(F)V

    .line 41
    iget v0, p0, Lorg/anddev/andengine/entity/scene/background/AutoParallaxBackground;->mParallaxValue:F

    iget v1, p0, Lorg/anddev/andengine/entity/scene/background/AutoParallaxBackground;->mParallaxChangePerSecond:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/AutoParallaxBackground;->mParallaxValue:F

    .line 42
    return-void
.end method
