.class public Lorg/anddev/andengine/engine/camera/Camera;
.super Ljava/lang/Object;
.source "Camera.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# static fields
.field protected static final VERTICES_TOUCH_TMP:[F


# instance fields
.field protected mCameraSceneRotation:F

.field private mChaseShape:Lorg/anddev/andengine/entity/shape/IShape;

.field private mFarZ:F

.field private mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

.field private mMaxX:F

.field private mMaxY:F

.field private mMinX:F

.field private mMinY:F

.field private mNearZ:F

.field protected mRotation:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x2

    new-array v0, v0, [F

    sput-object v0, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 2
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/high16 v0, -0x4080

    iput v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    .line 38
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    .line 44
    iput v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 45
    iput v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    .line 52
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    .line 53
    add-float v0, p1, p3

    iput v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    .line 54
    iput p2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    .line 55
    add-float v0, p2, p4

    iput v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    .line 56
    return-void
.end method

.method private applyCameraSceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 8
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/high16 v5, 0x3f00

    .line 300
    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    neg-float v0, v1

    .line 302
    .local v0, cameraSceneRotation:F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    .line 303
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v2

    aput v2, v1, v6

    .line 304
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v2

    aput v2, v1, v7

    .line 306
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    iget v3, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, v5

    iget v3, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, v5

    invoke-static {v1, v0, v2, v3}, Lorg/anddev/andengine/util/MathUtils;->rotateAroundCenter([FFFF)[F

    .line 308
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v1, v1, v6

    sget-object v2, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v2, v2, v7

    invoke-virtual {p1, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 310
    :cond_0
    return-void
.end method

.method private applyRotation(Ljavax/microedition/khronos/opengles/GL10;FFF)V
    .locals 3
    .parameter "pGL"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pAngle"

    .prologue
    const/4 v2, 0x0

    .line 245
    invoke-interface {p1, p2, p3, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 246
    const/high16 v0, 0x3f80

    invoke-interface {p1, p4, v2, v2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glRotatef(FFFF)V

    .line 247
    neg-float v0, p2

    neg-float v1, p3

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 248
    return-void
.end method

.method private applySceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 6
    .parameter "pCameraSceneTouchEvent"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 275
    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    neg-float v0, v1

    .line 276
    .local v0, rotation:F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    .line 277
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v2

    aput v2, v1, v4

    .line 278
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v2

    aput v2, v1, v5

    .line 280
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterX()F

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterY()F

    move-result v3

    invoke-static {v1, v0, v2, v3}, Lorg/anddev/andengine/util/MathUtils;->rotateAroundCenter([FFFF)[F

    .line 282
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v1, v1, v4

    sget-object v2, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v2, v2, v5

    invoke-virtual {p1, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 284
    :cond_0
    return-void
.end method

.method private convertAxisAlignedSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FF)V
    .locals 7
    .parameter "pSurfaceTouchEvent"
    .parameter "pRelativeX"
    .parameter "pRelativeY"

    .prologue
    .line 350
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v2

    .line 351
    .local v2, minX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxX()F

    move-result v0

    .line 352
    .local v0, maxX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v3

    .line 353
    .local v3, minY:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxY()F

    move-result v1

    .line 355
    .local v1, maxY:F
    sub-float v6, v0, v2

    mul-float/2addr v6, p2

    add-float v4, v2, v6

    .line 356
    .local v4, x:F
    sub-float v6, v1, v3

    mul-float/2addr v6, p3

    add-float v5, v3, v6

    .line 358
    .local v5, y:F
    invoke-virtual {p1, v4, v5}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 359
    return-void
.end method

.method private unapplyCameraSceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 8
    .parameter "pCameraSceneTouchEvent"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/high16 v5, 0x3f00

    .line 313
    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    neg-float v0, v1

    .line 315
    .local v0, cameraSceneRotation:F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    .line 316
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v2

    aput v2, v1, v6

    .line 317
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v2

    aput v2, v1, v7

    .line 319
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    iget v3, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, v5

    iget v3, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, v5

    invoke-static {v1, v0, v2, v3}, Lorg/anddev/andengine/util/MathUtils;->revertRotateAroundCenter([FFFF)[F

    .line 321
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v1, v1, v6

    sget-object v2, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v2, v2, v7

    invoke-virtual {p1, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 323
    :cond_0
    return-void
.end method

.method private unapplySceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 6
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 287
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 289
    .local v0, rotation:F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    .line 290
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v2

    aput v2, v1, v4

    .line 291
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v2

    aput v2, v1, v5

    .line 293
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterX()F

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterY()F

    move-result v3

    invoke-static {v1, v0, v2, v3}, Lorg/anddev/andengine/util/MathUtils;->revertRotateAroundCenter([FFFF)[F

    .line 295
    sget-object v1, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v1, v1, v4

    sget-object v2, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v2, v2, v5

    invoke-virtual {p1, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FF)V

    .line 297
    :cond_0
    return-void
.end method


# virtual methods
.method protected applySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 2
    .parameter "pSceneTouchEvent"

    .prologue
    .line 267
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    neg-float v0, v0

    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    neg-float v1, v1

    invoke-virtual {p1, v0, v1}, Lorg/anddev/andengine/input/touch/TouchEvent;->offset(FF)V

    .line 268
    return-void
.end method

.method public convertCameraSceneToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 0
    .parameter "pCameraSceneTouchEvent"

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->unapplyCameraSceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 261
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->unapplySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 263
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->applySceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 264
    return-void
.end method

.method public convertSceneToCameraSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 0
    .parameter "pSceneTouchEvent"

    .prologue
    .line 251
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->unapplySceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 253
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->applySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 255
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->applyCameraSceneRotation(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 256
    return-void
.end method

.method public convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V
    .locals 8
    .parameter "pSurfaceTouchEvent"
    .parameter "pSurfaceWidth"
    .parameter "pSurfaceHeight"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/high16 v5, 0x3f80

    .line 329
    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 330
    .local v2, rotation:F
    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-nez v3, :cond_0

    .line 331
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v3

    int-to-float v4, p2

    div-float v0, v3, v4

    .line 332
    .local v0, relativeX:F
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v3

    int-to-float v4, p3

    div-float v1, v3, v4

    .line 346
    .local v1, relativeY:F
    :goto_0
    invoke-direct {p0, p1, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertAxisAlignedSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FF)V

    .line 347
    return-void

    .line 333
    .end local v0           #relativeX:F
    .end local v1           #relativeY:F
    :cond_0
    const/high16 v3, 0x4334

    cmpl-float v3, v2, v3

    if-nez v3, :cond_1

    .line 334
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v3

    int-to-float v4, p2

    div-float/2addr v3, v4

    sub-float v0, v5, v3

    .line 335
    .restart local v0       #relativeX:F
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v3

    int-to-float v4, p3

    div-float/2addr v3, v4

    sub-float v1, v5, v3

    .line 336
    .restart local v1       #relativeY:F
    goto :goto_0

    .line 337
    .end local v0           #relativeX:F
    .end local v1           #relativeY:F
    :cond_1
    sget-object v3, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v4

    aput v4, v3, v6

    .line 338
    sget-object v3, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v4

    aput v4, v3, v7

    .line 340
    sget-object v3, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    div-int/lit8 v4, p2, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, p3, 0x2

    int-to-float v5, v5

    invoke-static {v3, v2, v4, v5}, Lorg/anddev/andengine/util/MathUtils;->rotateAroundCenter([FFFF)[F

    .line 342
    sget-object v3, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v3, v3, v6

    int-to-float v4, p2

    div-float v0, v3, v4

    .line 343
    .restart local v0       #relativeX:F
    sget-object v3, Lorg/anddev/andengine/engine/camera/Camera;->VERTICES_TOUCH_TMP:[F

    aget v3, v3, v7

    int-to-float v4, p3

    div-float v1, v3, v4

    .restart local v1       #relativeY:F
    goto :goto_0
.end method

.method public getCameraSceneRotation()F
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    return v0
.end method

.method public getCenterX()F
    .locals 3

    .prologue
    .line 108
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    .line 109
    .local v0, minX:F
    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    sub-float/2addr v1, v0

    const/high16 v2, 0x3f00

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    return v1
.end method

.method public getCenterY()F
    .locals 3

    .prologue
    .line 113
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    .line 114
    .local v0, minY:F
    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    sub-float/2addr v1, v0

    const/high16 v2, 0x3f00

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    return v1
.end method

.method public getFarZClippingPlane()F
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    return v0
.end method

.method public getHUD()Lorg/anddev/andengine/engine/camera/hud/HUD;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    return-object v0
.end method

.method public getHeight()F
    .locals 2

    .prologue
    .line 104
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getMaxX()F
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    return v0
.end method

.method public getMaxY()F
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    return v0
.end method

.method public getMinX()F
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    return v0
.end method

.method public getMinY()F
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    return v0
.end method

.method public getNearZClippingPlane()F
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    return v0
.end method

.method public getRotation()F
    .locals 1

    .prologue
    .line 149
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    return v0
.end method

.method public getWidth()F
    .locals 2

    .prologue
    .line 100
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public hasHUD()Z
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRectangularShapeVisible(Lorg/anddev/andengine/entity/shape/RectangularShape;)Z
    .locals 8
    .parameter "pRectangularShape"

    .prologue
    .line 196
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getX()F

    move-result v4

    .line 197
    .local v4, otherLeft:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getY()F

    move-result v5

    .line 198
    .local v5, otherTop:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getWidthScaled()F

    move-result v0

    add-float v6, v0, v4

    .line 199
    .local v6, otherRight:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getHeightScaled()F

    move-result v0

    add-float v7, v0, v5

    .line 202
    .local v7, otherBottom:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v0

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v1

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxX()F

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxY()F

    move-result v3

    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/collision/BaseCollisionChecker;->checkAxisAlignedRectangleCollision(FFFFFFFF)Z

    move-result v0

    return v0
.end method

.method public offsetCenter(FF)V
    .locals 2
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 128
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterX()F

    move-result v0

    add-float/2addr v0, p1

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterY()F

    move-result v1

    add-float/2addr v1, p2

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->setCenter(FF)V

    .line 129
    return-void
.end method

.method public onApplyCameraSceneMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 9
    .parameter "pGL"

    .prologue
    const/high16 v8, 0x3f00

    const/4 v1, 0x0

    .line 231
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setProjectionIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 233
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    sub-float v2, v0, v4

    .line 234
    .local v2, width:F
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    sub-float v3, v0, v4

    .line 236
    .local v3, height:F
    iget v5, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    iget v6, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    move-object v0, p1

    move v4, v1

    invoke-interface/range {v0 .. v6}, Ljavax/microedition/khronos/opengles/GL10;->glOrthof(FFFFFF)V

    .line 238
    iget v7, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    .line 239
    .local v7, cameraSceneRotation:F
    cmpl-float v0, v7, v1

    if-eqz v0, :cond_0

    .line 240
    mul-float v0, v2, v8

    mul-float v1, v3, v8

    invoke-direct {p0, p1, v0, v1, v7}, Lorg/anddev/andengine/engine/camera/Camera;->applyRotation(Ljavax/microedition/khronos/opengles/GL10;FFF)V

    .line 242
    :cond_0
    return-void
.end method

.method public onApplyMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 8
    .parameter "pGL"

    .prologue
    .line 206
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setProjectionIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 208
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v1

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxX()F

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxY()F

    move-result v3

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v4

    iget v5, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    iget v6, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    move-object v0, p1

    invoke-interface/range {v0 .. v6}, Ljavax/microedition/khronos/opengles/GL10;->glOrthof(FFFFFF)V

    .line 210
    iget v7, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 211
    .local v7, rotation:F
    const/4 v0, 0x0

    cmpl-float v0, v7, v0

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterX()F

    move-result v0

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterY()F

    move-result v1

    invoke-direct {p0, p1, v0, v1, v7}, Lorg/anddev/andengine/engine/camera/Camera;->applyRotation(Ljavax/microedition/khronos/opengles/GL10;FFF)V

    .line 214
    :cond_0
    return-void
.end method

.method public onApplyPositionIndependentMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 9
    .parameter "pGL"

    .prologue
    const/high16 v8, 0x3f00

    const/4 v1, 0x0

    .line 217
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setProjectionIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 219
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    sub-float v2, v0, v4

    .line 220
    .local v2, width:F
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    iget v4, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    sub-float v3, v0, v4

    .line 222
    .local v3, height:F
    iget v5, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    iget v6, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    move-object v0, p1

    move v4, v1

    invoke-interface/range {v0 .. v6}, Ljavax/microedition/khronos/opengles/GL10;->glOrthof(FFFFFF)V

    .line 224
    iget v7, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 225
    .local v7, rotation:F
    cmpl-float v0, v7, v1

    if-eqz v0, :cond_0

    .line 226
    mul-float v0, v2, v8

    mul-float v1, v3, v8

    invoke-direct {p0, p1, v0, v1, v7}, Lorg/anddev/andengine/engine/camera/Camera;->applyRotation(Ljavax/microedition/khronos/opengles/GL10;FFF)V

    .line 228
    :cond_0
    return-void
.end method

.method public onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v0, p1, p0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 193
    :cond_0
    return-void
.end method

.method public onUpdate(F)V
    .locals 3
    .parameter "pSecondsElapsed"

    .prologue
    .line 170
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    if-eqz v1, :cond_0

    .line 171
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, p1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->onUpdate(F)V

    .line 174
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mChaseShape:Lorg/anddev/andengine/entity/shape/IShape;

    if-eqz v1, :cond_1

    .line 175
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mChaseShape:Lorg/anddev/andengine/entity/shape/IShape;

    invoke-interface {v1}, Lorg/anddev/andengine/entity/shape/IShape;->getSceneCenterCoordinates()[F

    move-result-object v0

    .line 176
    .local v0, centerCoordinates:[F
    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    invoke-virtual {p0, v1, v2}, Lorg/anddev/andengine/engine/camera/Camera;->setCenter(FF)V

    .line 178
    .end local v0           #centerCoordinates:[F
    :cond_1
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 183
    return-void
.end method

.method public setCameraSceneRotation(F)V
    .locals 0
    .parameter "pCameraSceneRotation"

    .prologue
    .line 161
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mCameraSceneRotation:F

    .line 162
    return-void
.end method

.method public setCenter(FF)V
    .locals 3
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterX()F

    move-result v2

    sub-float v0, p1, v2

    .line 119
    .local v0, dX:F
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/Camera;->getCenterY()F

    move-result v2

    sub-float v1, p2, v2

    .line 121
    .local v1, dY:F
    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    add-float/2addr v2, v0

    iput v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    .line 122
    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    add-float/2addr v2, v0

    iput v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxX:F

    .line 123
    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    add-float/2addr v2, v1

    iput v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    .line 124
    iget v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    add-float/2addr v2, v1

    iput v2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMaxY:F

    .line 125
    return-void
.end method

.method public setChaseShape(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 0
    .parameter "pChaseShape"

    .prologue
    .line 145
    iput-object p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mChaseShape:Lorg/anddev/andengine/entity/shape/IShape;

    .line 146
    return-void
.end method

.method public setFarZClippingPlane(F)V
    .locals 0
    .parameter "pFarZClippingPlane"

    .prologue
    .line 91
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    .line 92
    return-void
.end method

.method public setHUD(Lorg/anddev/andengine/engine/camera/hud/HUD;)V
    .locals 0
    .parameter "pHUD"

    .prologue
    .line 136
    iput-object p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mHUD:Lorg/anddev/andengine/engine/camera/hud/HUD;

    .line 137
    invoke-virtual {p1, p0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setCamera(Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 138
    return-void
.end method

.method public setNearZClippingPlane(F)V
    .locals 0
    .parameter "pNearZClippingPlane"

    .prologue
    .line 87
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    .line 88
    return-void
.end method

.method public setRotation(F)V
    .locals 0
    .parameter "pRotation"

    .prologue
    .line 153
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mRotation:F

    .line 154
    return-void
.end method

.method public setZClippingPlanes(FF)V
    .locals 0
    .parameter "pNearZClippingPlane"
    .parameter "pFarZClippingPlane"

    .prologue
    .line 95
    iput p1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mNearZ:F

    .line 96
    iput p2, p0, Lorg/anddev/andengine/engine/camera/Camera;->mFarZ:F

    .line 97
    return-void
.end method

.method protected unapplySceneToCameraSceneOffset(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 2
    .parameter "pCameraSceneTouchEvent"

    .prologue
    .line 271
    iget v0, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinX:F

    iget v1, p0, Lorg/anddev/andengine/engine/camera/Camera;->mMinY:F

    invoke-virtual {p1, v0, v1}, Lorg/anddev/andengine/input/touch/TouchEvent;->offset(FF)V

    .line 272
    return-void
.end method
