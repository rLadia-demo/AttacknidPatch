.class public Lorg/anddev/andengine/engine/camera/BoundCamera;
.super Lorg/anddev/andengine/engine/camera/Camera;
.source "BoundCamera.java"


# instance fields
.field private mBoundsCenterX:F

.field private mBoundsCenterY:F

.field protected mBoundsEnabled:Z

.field private mBoundsHeight:F

.field private mBoundsMaxX:F

.field private mBoundsMaxY:F

.field private mBoundsMinX:F

.field private mBoundsMinY:F

.field private mBoundsWidth:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    .line 35
    return-void
.end method

.method public constructor <init>(FFFFFFFF)V
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pBoundMinX"
    .parameter "pBoundMaxX"
    .parameter "pBoundMinY"
    .parameter "pBoundMaxY"

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    .line 39
    invoke-virtual {p0, p5, p6, p7, p8}, Lorg/anddev/andengine/engine/camera/BoundCamera;->setBounds(FFFF)V

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsEnabled:Z

    .line 41
    return-void
.end method

.method private determineBoundedX()F
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v9, 0x0

    .line 90
    iget v7, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsWidth:F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getWidth()F

    move-result v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_1

    .line 91
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsCenterX:F

    .line 115
    :cond_0
    :goto_0
    return v0

    .line 93
    :cond_1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getCenterX()F

    move-result v0

    .line 95
    .local v0, currentCenterX:F
    iget v7, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinX:F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinX()F

    move-result v8

    sub-float v4, v7, v8

    .line 96
    .local v4, minXBoundExceededAmount:F
    cmpl-float v7, v4, v9

    if-lez v7, :cond_2

    move v3, v5

    .line 98
    .local v3, minXBoundExceeded:Z
    :goto_1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxX()F

    move-result v7

    iget v8, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxX:F

    sub-float v2, v7, v8

    .line 99
    .local v2, maxXBoundExceededAmount:F
    cmpl-float v7, v2, v9

    if-lez v7, :cond_3

    move v1, v5

    .line 101
    .local v1, maxXBoundExceeded:Z
    :goto_2
    if-eqz v3, :cond_5

    .line 102
    if-eqz v1, :cond_4

    .line 104
    sub-float v5, v0, v2

    add-float v0, v5, v4

    goto :goto_0

    .end local v1           #maxXBoundExceeded:Z
    .end local v2           #maxXBoundExceededAmount:F
    .end local v3           #minXBoundExceeded:Z
    :cond_2
    move v3, v6

    .line 96
    goto :goto_1

    .restart local v2       #maxXBoundExceededAmount:F
    .restart local v3       #minXBoundExceeded:Z
    :cond_3
    move v1, v6

    .line 99
    goto :goto_2

    .line 107
    .restart local v1       #maxXBoundExceeded:Z
    :cond_4
    add-float/2addr v0, v4

    goto :goto_0

    .line 110
    :cond_5
    if-eqz v1, :cond_0

    .line 112
    sub-float/2addr v0, v2

    goto :goto_0
.end method

.method private determineBoundedY()F
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v9, 0x0

    .line 122
    iget v7, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsHeight:F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getHeight()F

    move-result v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_1

    .line 123
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsCenterY:F

    .line 147
    :cond_0
    :goto_0
    return v0

    .line 125
    :cond_1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getCenterY()F

    move-result v0

    .line 127
    .local v0, currentCenterY:F
    iget v7, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinY:F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMinY()F

    move-result v8

    sub-float v4, v7, v8

    .line 128
    .local v4, minYBoundExceededAmount:F
    cmpl-float v7, v4, v9

    if-lez v7, :cond_2

    move v3, v5

    .line 130
    .local v3, minYBoundExceeded:Z
    :goto_1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->getMaxY()F

    move-result v7

    iget v8, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxY:F

    sub-float v2, v7, v8

    .line 131
    .local v2, maxYBoundExceededAmount:F
    cmpl-float v7, v2, v9

    if-lez v7, :cond_3

    move v1, v5

    .line 133
    .local v1, maxYBoundExceeded:Z
    :goto_2
    if-eqz v3, :cond_5

    .line 134
    if-eqz v1, :cond_4

    .line 136
    sub-float v5, v0, v2

    add-float v0, v5, v4

    goto :goto_0

    .end local v1           #maxYBoundExceeded:Z
    .end local v2           #maxYBoundExceededAmount:F
    .end local v3           #minYBoundExceeded:Z
    :cond_2
    move v3, v6

    .line 128
    goto :goto_1

    .restart local v2       #maxYBoundExceededAmount:F
    .restart local v3       #minYBoundExceeded:Z
    :cond_3
    move v1, v6

    .line 131
    goto :goto_2

    .line 139
    .restart local v1       #maxYBoundExceeded:Z
    :cond_4
    add-float/2addr v0, v4

    goto :goto_0

    .line 142
    :cond_5
    if-eqz v1, :cond_0

    .line 144
    sub-float/2addr v0, v2

    goto :goto_0
.end method


# virtual methods
.method protected ensureInBounds()V
    .locals 2

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->determineBoundedX()F

    move-result v0

    invoke-direct {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->determineBoundedY()F

    move-result v1

    invoke-super {p0, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->setCenter(FF)V

    .line 87
    return-void
.end method

.method public isBoundsEnabled()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsEnabled:Z

    return v0
.end method

.method public setBounds(FFFF)V
    .locals 3
    .parameter "pBoundMinX"
    .parameter "pBoundMaxX"
    .parameter "pBoundMinY"
    .parameter "pBoundMaxY"

    .prologue
    const/high16 v2, 0x3f00

    .line 56
    iput p1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinX:F

    .line 57
    iput p2, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxX:F

    .line 58
    iput p3, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinY:F

    .line 59
    iput p4, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxY:F

    .line 61
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxX:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinX:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsWidth:F

    .line 62
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMaxY:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinY:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsHeight:F

    .line 64
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinX:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsWidth:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsCenterX:F

    .line 65
    iget v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsMinY:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsHeight:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsCenterY:F

    .line 66
    return-void
.end method

.method public setBoundsEnabled(Z)V
    .locals 0
    .parameter "pBoundsEnabled"

    .prologue
    .line 52
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsEnabled:Z

    .line 53
    return-void
.end method

.method public setCenter(FF)V
    .locals 1
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 70
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/engine/camera/Camera;->setCenter(FF)V

    .line 72
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/camera/BoundCamera;->mBoundsEnabled:Z

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/BoundCamera;->ensureInBounds()V

    .line 75
    :cond_0
    return-void
.end method
