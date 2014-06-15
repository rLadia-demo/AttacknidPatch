.class public Lorg/anddev/andengine/engine/camera/ZoomCamera;
.super Lorg/anddev/andengine/engine/camera/BoundCamera;
.source "ZoomCamera.java"


# instance fields
.field private mZoomFactor:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/engine/camera/BoundCamera;-><init>(FFFF)V

    .line 25
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    .line 33
    return-void
.end method


# virtual methods
.method protected applySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 7
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 107
    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    .line 108
    .local v2, zoomFactor:F
    const/high16 v3, 0x3f80

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_0

    .line 109
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterX()F

    move-result v0

    .line 110
    .local v0, scaleCenterX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterY()F

    move-result v1

    .line 112
    .local v1, scaleCenterY:F
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v4

    aput v4, v3, v5

    .line 113
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v4

    aput v4, v3, v6

    .line 115
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-static {v3, v2, v2, v0, v1}, Lorg/anddev/andengine/util/MathUtils;->scaleAroundCenter([FFFFF)[F

    .line 117
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    aget v3, v3, v5

    sget-object v4, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    aget v4, v4, v6

    invoke-virtual {p1, v3, v4}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 119
    .end local v0           #scaleCenterX:F
    .end local v1           #scaleCenterY:F
    :cond_0
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/camera/BoundCamera;->applySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 120
    return-void
.end method

.method public getHeight()F
    .locals 2

    .prologue
    .line 102
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getHeight()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v0, v1

    return v0
.end method

.method public getMaxX()F
    .locals 3

    .prologue
    .line 67
    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    const/high16 v2, 0x3f80

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 68
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxX()F

    move-result v1

    .line 71
    :goto_0
    return v1

    .line 70
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterX()F

    move-result v0

    .line 71
    .local v0, centerX:F
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxX()F

    move-result v1

    sub-float/2addr v1, v0

    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v1, v2

    add-float/2addr v1, v0

    goto :goto_0
.end method

.method public getMaxY()F
    .locals 3

    .prologue
    .line 87
    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    const/high16 v2, 0x3f80

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 88
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxY()F

    move-result v1

    .line 91
    :goto_0
    return v1

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterY()F

    move-result v0

    .line 91
    .local v0, centerY:F
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxY()F

    move-result v1

    sub-float/2addr v1, v0

    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v1, v2

    add-float/2addr v1, v0

    goto :goto_0
.end method

.method public getMinX()F
    .locals 3

    .prologue
    .line 57
    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    const/high16 v2, 0x3f80

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 58
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinX()F

    move-result v1

    .line 61
    :goto_0
    return v1

    .line 60
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterX()F

    move-result v0

    .line 61
    .local v0, centerX:F
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinX()F

    move-result v1

    sub-float v1, v0, v1

    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v1, v2

    sub-float v1, v0, v1

    goto :goto_0
.end method

.method public getMinY()F
    .locals 3

    .prologue
    .line 77
    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    const/high16 v2, 0x3f80

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 78
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinY()F

    move-result v1

    .line 81
    :goto_0
    return v1

    .line 80
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterY()F

    move-result v0

    .line 81
    .local v0, centerY:F
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinY()F

    move-result v1

    sub-float v1, v0, v1

    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v1, v2

    sub-float v1, v0, v1

    goto :goto_0
.end method

.method public getWidth()F
    .locals 2

    .prologue
    .line 97
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getWidth()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    div-float/2addr v0, v1

    return v0
.end method

.method public getZoomFactor()F
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    return v0
.end method

.method public setZoomFactor(F)V
    .locals 1
    .parameter "pZoomFactor"

    .prologue
    .line 44
    iput p1, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    .line 46
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mBoundsEnabled:Z

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->ensureInBounds()V

    .line 49
    :cond_0
    return-void
.end method

.method protected unapplySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 7
    .parameter "pCameraSceneTouchEvent"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 124
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/camera/BoundCamera;->unapplySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 126
    iget v2, p0, Lorg/anddev/andengine/engine/camera/ZoomCamera;->mZoomFactor:F

    .line 127
    .local v2, zoomFactor:F
    const/high16 v3, 0x3f80

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_0

    .line 128
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterX()F

    move-result v0

    .line 129
    .local v0, scaleCenterX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/ZoomCamera;->getCenterY()F

    move-result v1

    .line 131
    .local v1, scaleCenterY:F
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v4

    aput v4, v3, v5

    .line 132
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v4

    aput v4, v3, v6

    .line 134
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    invoke-static {v3, v2, v2, v0, v1}, Lorg/anddev/andengine/util/MathUtils;->revertScaleAroundCenter([FFFFF)[F

    .line 136
    sget-object v3, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    aget v3, v3, v5

    sget-object v4, Lorg/anddev/andengine/engine/camera/ZoomCamera;->VERTICES_TOUCH_TMP:[F

    aget v4, v4, v6

    invoke-virtual {p1, v3, v4}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 138
    .end local v0           #scaleCenterX:F
    .end local v1           #scaleCenterY:F
    :cond_0
    return-void
.end method
