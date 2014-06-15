.class public Lorg/anddev/andengine/engine/camera/SmoothCamera;
.super Lorg/anddev/andengine/engine/camera/ZoomCamera;
.source "SmoothCamera.java"


# instance fields
.field private mMaxVelocityX:F

.field private mMaxVelocityY:F

.field private mMaxZoomFactorChange:F

.field private mTargetCenterX:F

.field private mTargetCenterY:F

.field private mTargetZoomFactor:F


# direct methods
.method public constructor <init>(FFFFFFF)V
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pMaxVelocityX"
    .parameter "pMaxVelocityY"
    .parameter "pMaxZoomFactorChange"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/engine/camera/ZoomCamera;-><init>(FFFF)V

    .line 32
    iput p5, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityX:F

    .line 33
    iput p6, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityY:F

    .line 34
    iput p7, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxZoomFactorChange:F

    .line 36
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->getCenterX()F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterX:F

    .line 37
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->getCenterY()F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterY:F

    .line 39
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetZoomFactor:F

    .line 40
    return-void
.end method

.method private cutToMaxVelocityX(FF)F
    .locals 1
    .parameter "pValue"
    .parameter "pSecondsElapsed"

    .prologue
    .line 117
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 118
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityX:F

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 120
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityX:F

    neg-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_0
.end method

.method private cutToMaxVelocityY(FF)F
    .locals 1
    .parameter "pValue"
    .parameter "pSecondsElapsed"

    .prologue
    .line 125
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 126
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityY:F

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 128
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityY:F

    neg-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_0
.end method

.method private cutToMaxZoomFactorChange(FF)F
    .locals 1
    .parameter "pValue"
    .parameter "pSecondsElapsed"

    .prologue
    .line 133
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 134
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxZoomFactorChange:F

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 136
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxZoomFactorChange:F

    neg-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public onUpdate(F)V
    .locals 14
    .parameter "pSecondsElapsed"

    .prologue
    .line 86
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->onUpdate(F)V

    .line 88
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->getCenterX()F

    move-result v0

    .line 89
    .local v0, currentCenterX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->getCenterY()F

    move-result v1

    .line 91
    .local v1, currentCenterY:F
    iget v9, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterX:F

    .line 92
    .local v9, targetCenterX:F
    iget v10, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterY:F

    .line 94
    .local v10, targetCenterY:F
    cmpl-float v12, v0, v9

    if-nez v12, :cond_0

    cmpl-float v12, v1, v10

    if-eqz v12, :cond_1

    .line 95
    :cond_0
    sub-float v6, v9, v0

    .line 96
    .local v6, diffX:F
    invoke-direct {p0, v6, p1}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->cutToMaxVelocityX(FF)F

    move-result v3

    .line 98
    .local v3, dX:F
    sub-float v7, v10, v1

    .line 99
    .local v7, diffY:F
    invoke-direct {p0, v7, p1}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->cutToMaxVelocityY(FF)F

    move-result v4

    .line 101
    .local v4, dY:F
    add-float v12, v0, v3

    add-float v13, v1, v4

    invoke-super {p0, v12, v13}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->setCenter(FF)V

    .line 105
    .end local v3           #dX:F
    .end local v4           #dY:F
    .end local v6           #diffX:F
    .end local v7           #diffY:F
    :cond_1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->getZoomFactor()F

    move-result v2

    .line 107
    .local v2, currentZoom:F
    iget v11, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetZoomFactor:F

    .line 109
    .local v11, targetZoomFactor:F
    cmpl-float v12, v2, v11

    if-eqz v12, :cond_2

    .line 110
    sub-float v8, v11, v2

    .line 111
    .local v8, diffZoom:F
    invoke-direct {p0, v8, p1}, Lorg/anddev/andengine/engine/camera/SmoothCamera;->cutToMaxZoomFactorChange(FF)F

    move-result v5

    .line 112
    .local v5, dZoom:F
    add-float v12, v2, v5

    invoke-super {p0, v12}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->setZoomFactor(F)V

    .line 114
    .end local v5           #dZoom:F
    .end local v8           #diffZoom:F
    :cond_2
    return-void
.end method

.method public setCenter(FF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 48
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterX:F

    .line 49
    iput p2, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterY:F

    .line 50
    return-void
.end method

.method public setCenterDirect(FF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->setCenter(FF)V

    .line 54
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterX:F

    .line 55
    iput p2, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetCenterY:F

    .line 56
    return-void
.end method

.method public setMaxVelocityX(F)V
    .locals 0
    .parameter "pMaxVelocityX"

    .prologue
    .line 64
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityX:F

    .line 65
    return-void
.end method

.method public setMaxVelocityX(FF)V
    .locals 0
    .parameter "pMaxVelocityX"
    .parameter "pMaxVelocityY"

    .prologue
    .line 72
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityX:F

    .line 73
    iput p2, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityY:F

    .line 74
    return-void
.end method

.method public setMaxVelocityY(F)V
    .locals 0
    .parameter "pMaxVelocityY"

    .prologue
    .line 68
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxVelocityY:F

    .line 69
    return-void
.end method

.method public setMaxZoomFactorChange(F)V
    .locals 0
    .parameter "pMaxZoomFactorChange"

    .prologue
    .line 77
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mMaxZoomFactorChange:F

    .line 78
    return-void
.end method

.method public setZoomFactor(F)V
    .locals 0
    .parameter "pZoomFactor"

    .prologue
    .line 60
    iput p1, p0, Lorg/anddev/andengine/engine/camera/SmoothCamera;->mTargetZoomFactor:F

    .line 61
    return-void
.end method
