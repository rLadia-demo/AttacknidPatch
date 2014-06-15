.class public abstract Lorg/anddev/andengine/entity/shape/Shape;
.super Lorg/anddev/andengine/entity/Entity;
.source "Shape.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/IShape;


# static fields
.field public static final BLENDFUNCTION_DESTINATION_DEFAULT:I = 0x303

.field public static final BLENDFUNCTION_DESTINATION_PREMULTIPLYALPHA_DEFAULT:I = 0x303

.field public static final BLENDFUNCTION_SOURCE_DEFAULT:I = 0x302

.field public static final BLENDFUNCTION_SOURCE_PREMULTIPLYALPHA_DEFAULT:I = 0x1


# instance fields
.field protected mAccelerationX:F

.field protected mAccelerationY:F

.field protected mAlpha:F

.field protected mAngularVelocity:F

.field private final mBaseX:F

.field private final mBaseY:F

.field protected mBlue:F

.field private mCullingEnabled:Z

.field protected mDestinationBlendFunction:I

.field protected mGreen:F

.field protected mRed:F

.field protected mRotation:F

.field protected mRotationCenterX:F

.field protected mRotationCenterY:F

.field protected mScaleCenterX:F

.field protected mScaleCenterY:F

.field protected mScaleX:F

.field protected mScaleY:F

.field private final mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/ModifierList",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;"
        }
    .end annotation
.end field

.field protected mSourceBlendFunction:I

.field private mUpdatePhysics:Z

.field protected mVelocityX:F

.field protected mVelocityY:F

.field protected mX:F

.field protected mY:F


# direct methods
.method public constructor <init>(FF)V
    .locals 2
    .parameter "pX"
    .parameter "pY"

    .prologue
    const/high16 v1, 0x3f80

    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 31
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    .line 32
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    .line 33
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    .line 34
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    .line 42
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 43
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 45
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 46
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 48
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    .line 50
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAngularVelocity:F

    .line 52
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterX:F

    .line 53
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterY:F

    .line 55
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 56
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 58
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterX:F

    .line 59
    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterY:F

    .line 61
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mUpdatePhysics:Z

    .line 63
    const/16 v0, 0x302

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mSourceBlendFunction:I

    .line 64
    const/16 v0, 0x303

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mDestinationBlendFunction:I

    .line 66
    new-instance v0, Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/modifier/ModifierList;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mCullingEnabled:Z

    .line 75
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseX:F

    .line 76
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseY:F

    .line 78
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    .line 79
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    .line 80
    return-void
.end method


# virtual methods
.method public accelerate(FF)V
    .locals 1
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 245
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    add-float/2addr v0, p1

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 246
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    add-float/2addr v0, p2

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 247
    return-void
.end method

.method public addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 399
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->add(Ljava/lang/Object;)Z

    .line 400
    return-void
.end method

.method protected applyRotation(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 6
    .parameter "pGL"

    .prologue
    const/4 v5, 0x0

    .line 500
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    .line 502
    .local v0, rotation:F
    cmpl-float v3, v0, v5

    if-eqz v3, :cond_0

    .line 503
    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterX:F

    .line 504
    .local v1, rotationCenterX:F
    iget v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterY:F

    .line 506
    .local v2, rotationCenterY:F
    invoke-interface {p1, v1, v2, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 507
    const/high16 v3, 0x3f80

    invoke-interface {p1, v0, v5, v5, v3}, Ljavax/microedition/khronos/opengles/GL10;->glRotatef(FFFF)V

    .line 508
    neg-float v3, v1

    neg-float v4, v2

    invoke-interface {p1, v3, v4, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 510
    .end local v1           #rotationCenterX:F
    .end local v2           #rotationCenterY:F
    :cond_0
    return-void
.end method

.method protected applyScale(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 7
    .parameter "pGL"

    .prologue
    const/4 v6, 0x0

    const/high16 v5, 0x3f80

    .line 513
    iget v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 514
    .local v2, scaleX:F
    iget v3, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 516
    .local v3, scaleY:F
    cmpl-float v4, v2, v5

    if-nez v4, :cond_0

    cmpl-float v4, v3, v5

    if-eqz v4, :cond_1

    .line 517
    :cond_0
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterX:F

    .line 518
    .local v0, scaleCenterX:F
    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterY:F

    .line 520
    .local v1, scaleCenterY:F
    invoke-interface {p1, v0, v1, v6}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 521
    invoke-interface {p1, v2, v3, v5}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    .line 522
    neg-float v4, v0

    neg-float v5, v1

    invoke-interface {p1, v4, v5, v6}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 524
    .end local v0           #scaleCenterX:F
    .end local v1           #scaleCenterY:F
    :cond_1
    return-void
.end method

.method protected applyTranslation(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3
    .parameter "pGL"

    .prologue
    .line 496
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    const/4 v2, 0x0

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 497
    return-void
.end method

.method public clearShapeModifiers()V
    .locals 1

    .prologue
    .line 409
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/ModifierList;->clear()V

    .line 410
    return-void
.end method

.method protected abstract drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
.end method

.method public getAccelerationX()F
    .locals 1

    .prologue
    .line 213
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    return v0
.end method

.method public getAccelerationY()F
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    return v0
.end method

.method public getAlpha()F
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    return v0
.end method

.method public getAngularVelocity()F
    .locals 1

    .prologue
    .line 261
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAngularVelocity:F

    return v0
.end method

.method public getBaseX()F
    .locals 1

    .prologue
    .line 152
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseX:F

    return v0
.end method

.method public getBaseY()F
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseY:F

    return v0
.end method

.method public getBlue()F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    return v0
.end method

.method public getGreen()F
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    return v0
.end method

.method public getHeightScaled()F
    .locals 2

    .prologue
    .line 394
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getHeight()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    mul-float/2addr v0, v1

    return v0
.end method

.method public getRed()F
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    return v0
.end method

.method public getRotation()F
    .locals 1

    .prologue
    .line 251
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    return v0
.end method

.method public getRotationCenterX()F
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterX:F

    return v0
.end method

.method public getRotationCenterY()F
    .locals 1

    .prologue
    .line 276
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterY:F

    return v0
.end method

.method public getScaleCenterX()F
    .locals 1

    .prologue
    .line 333
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterX:F

    return v0
.end method

.method public getScaleCenterY()F
    .locals 1

    .prologue
    .line 338
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterY:F

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .prologue
    .line 301
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .prologue
    .line 306
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    return v0
.end method

.method public getVelocityX()F
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    return v0
.end method

.method public getVelocityY()F
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    return v0
.end method

.method public getWidthScaled()F
    .locals 2

    .prologue
    .line 389
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getWidth()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    mul-float/2addr v0, v1

    return v0
.end method

.method public getX()F
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    return v0
.end method

.method public getY()F
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    return v0
.end method

.method protected abstract isCulled(Lorg/anddev/andengine/engine/camera/Camera;)Z
.end method

.method public isCullingEnabled()Z
    .locals 1

    .prologue
    .line 373
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mCullingEnabled:Z

    return v0
.end method

.method public isScaled()Z
    .locals 2

    .prologue
    const/high16 v1, 0x3f80

    .line 296
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isUpdatePhysics()Z
    .locals 1

    .prologue
    .line 359
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mUpdatePhysics:Z

    return v0
.end method

.method protected onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 488
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->applyTranslation(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 490
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->applyRotation(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 492
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->applyScale(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 493
    return-void
.end method

.method protected abstract onApplyVertices(Ljavax/microedition/khronos/opengles/GL10;)V
.end method

.method public onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 1
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    .line 418
    const/4 v0, 0x0

    return v0
.end method

.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .parameter "pGL"

    .prologue
    .line 481
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    iget v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    iget v3, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    invoke-static {p1, v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/util/GLHelper;->setColor(Ljavax/microedition/khronos/opengles/GL10;FFFF)V

    .line 483
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableVertexArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 484
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mSourceBlendFunction:I

    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mDestinationBlendFunction:I

    invoke-static {p1, v0, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->blendFunction(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 485
    return-void
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 467
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mCullingEnabled:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p2}, Lorg/anddev/andengine/entity/shape/Shape;->isCulled(Lorg/anddev/andengine/engine/camera/Camera;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 468
    :cond_0
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 470
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPushMatrix()V

    .line 472
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->onApplyVertices(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 473
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/Shape;->onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 474
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/Shape;->drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 476
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPopMatrix()V

    .line 478
    :cond_1
    return-void
.end method

.method protected onManagedUpdate(F)V
    .locals 8
    .parameter "pSecondsElapsed"

    .prologue
    const/4 v7, 0x0

    .line 437
    iget-boolean v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mUpdatePhysics:Z

    if-eqz v5, :cond_4

    .line 439
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 440
    .local v0, accelerationX:F
    iget v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 441
    .local v1, accelerationY:F
    cmpl-float v5, v0, v7

    if-nez v5, :cond_0

    cmpl-float v5, v1, v7

    if-eqz v5, :cond_1

    .line 442
    :cond_0
    iget v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    mul-float v6, v0, p1

    add-float/2addr v5, v6

    iput v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 443
    iget v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    mul-float v6, v1, p1

    add-float/2addr v5, v6

    iput v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 447
    :cond_1
    iget v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAngularVelocity:F

    .line 448
    .local v2, angularVelocity:F
    cmpl-float v5, v2, v7

    if-eqz v5, :cond_2

    .line 449
    iget v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    mul-float v6, v2, p1

    add-float/2addr v5, v6

    iput v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    .line 453
    :cond_2
    iget v3, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 454
    .local v3, velocityX:F
    iget v4, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 455
    .local v4, velocityY:F
    cmpl-float v5, v3, v7

    if-nez v5, :cond_3

    cmpl-float v5, v4, v7

    if-eqz v5, :cond_4

    .line 456
    :cond_3
    iget v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    mul-float v6, v3, p1

    add-float/2addr v5, v6

    iput v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    .line 457
    iget v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    mul-float v6, v4, p1

    add-float/2addr v5, v6

    iput v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    .line 458
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->onPositionChanged()V

    .line 462
    .end local v0           #accelerationX:F
    .end local v1           #accelerationY:F
    .end local v2           #angularVelocity:F
    .end local v3           #velocityX:F
    .end local v4           #velocityY:F
    :cond_4
    iget-object v5, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v5, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->onUpdate(F)V

    .line 463
    return-void
.end method

.method protected onPositionChanged()V
    .locals 0

    .prologue
    .line 430
    return-void
.end method

.method public removeShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 404
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 3

    .prologue
    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 528
    invoke-super {p0}, Lorg/anddev/andengine/entity/Entity;->reset()V

    .line 530
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseX:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    .line 531
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseY:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    .line 532
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 533
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 534
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 535
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 536
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    .line 537
    iput v1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAngularVelocity:F

    .line 538
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 539
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 541
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->onPositionChanged()V

    .line 543
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    .line 544
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    .line 545
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    .line 546
    iput v2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    .line 548
    const/16 v0, 0x302

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mSourceBlendFunction:I

    .line 549
    const/16 v0, 0x303

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mDestinationBlendFunction:I

    .line 551
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mShapeModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/ModifierList;->reset()V

    .line 552
    return-void
.end method

.method public setAcceleration(F)V
    .locals 0
    .parameter "pAcceleration"

    .prologue
    .line 239
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 240
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 241
    return-void
.end method

.method public setAcceleration(FF)V
    .locals 0
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 233
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 234
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 235
    return-void
.end method

.method public setAccelerationX(F)V
    .locals 0
    .parameter "pAccelerationX"

    .prologue
    .line 223
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationX:F

    .line 224
    return-void
.end method

.method public setAccelerationY(F)V
    .locals 0
    .parameter "pAccelerationY"

    .prologue
    .line 228
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAccelerationY:F

    .line 229
    return-void
.end method

.method public setAlpha(F)V
    .locals 0
    .parameter "pAlpha"

    .prologue
    .line 111
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    .line 112
    return-void
.end method

.method public setAngularVelocity(F)V
    .locals 0
    .parameter "pAngularVelocity"

    .prologue
    .line 266
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAngularVelocity:F

    .line 267
    return-void
.end method

.method public setBasePosition()V
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseX:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    .line 175
    iget v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBaseY:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    .line 176
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->onPositionChanged()V

    .line 177
    return-void
.end method

.method public setBlendFunction(II)V
    .locals 0
    .parameter "pSourceBlendFunction"
    .parameter "pDestinationBlendFunction"

    .prologue
    .line 383
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mSourceBlendFunction:I

    .line 384
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mDestinationBlendFunction:I

    .line 385
    return-void
.end method

.method public setColor(FFF)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 121
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    .line 122
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    .line 123
    iput p3, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    .line 124
    return-void
.end method

.method public setColor(FFFF)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"

    .prologue
    .line 134
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRed:F

    .line 135
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mGreen:F

    .line 136
    iput p3, p0, Lorg/anddev/andengine/entity/shape/Shape;->mBlue:F

    .line 137
    iput p4, p0, Lorg/anddev/andengine/entity/shape/Shape;->mAlpha:F

    .line 138
    return-void
.end method

.method public setCullingEnabled(Z)V
    .locals 0
    .parameter "pCullingEnabled"

    .prologue
    .line 378
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mCullingEnabled:Z

    .line 379
    return-void
.end method

.method public setPosition(FF)V
    .locals 0
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 167
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mX:F

    .line 168
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mY:F

    .line 169
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->onPositionChanged()V

    .line 170
    return-void
.end method

.method public setPosition(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 2
    .parameter "pOtherShape"

    .prologue
    .line 162
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getX()F

    move-result v0

    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getY()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/entity/shape/Shape;->setPosition(FF)V

    .line 163
    return-void
.end method

.method public setRotation(F)V
    .locals 0
    .parameter "pRotation"

    .prologue
    .line 256
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotation:F

    .line 257
    return-void
.end method

.method public setRotationCenter(FF)V
    .locals 0
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"

    .prologue
    .line 291
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterX:F

    .line 292
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterY:F

    .line 293
    return-void
.end method

.method public setRotationCenterX(F)V
    .locals 0
    .parameter "pRotationCenterX"

    .prologue
    .line 281
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterX:F

    .line 282
    return-void
.end method

.method public setRotationCenterY(F)V
    .locals 0
    .parameter "pRotationCenterY"

    .prologue
    .line 286
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mRotationCenterY:F

    .line 287
    return-void
.end method

.method public setScale(F)V
    .locals 0
    .parameter "pScale"

    .prologue
    .line 321
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 322
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 323
    return-void
.end method

.method public setScale(FF)V
    .locals 0
    .parameter "pScaleX"
    .parameter "pScaleY"

    .prologue
    .line 327
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 328
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 329
    return-void
.end method

.method public setScaleCenter(FF)V
    .locals 0
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 353
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterX:F

    .line 354
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterY:F

    .line 355
    return-void
.end method

.method public setScaleCenterX(F)V
    .locals 0
    .parameter "pScaleCenterX"

    .prologue
    .line 343
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterX:F

    .line 344
    return-void
.end method

.method public setScaleCenterY(F)V
    .locals 0
    .parameter "pScaleCenterY"

    .prologue
    .line 348
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleCenterY:F

    .line 349
    return-void
.end method

.method public setScaleX(F)V
    .locals 0
    .parameter "pScaleX"

    .prologue
    .line 311
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleX:F

    .line 312
    return-void
.end method

.method public setScaleY(F)V
    .locals 0
    .parameter "pScaleY"

    .prologue
    .line 316
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mScaleY:F

    .line 317
    return-void
.end method

.method public setUpdatePhysics(Z)V
    .locals 0
    .parameter "pUpdatePhysics"

    .prologue
    .line 368
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mUpdatePhysics:Z

    .line 369
    return-void
.end method

.method public setVelocity(F)V
    .locals 0
    .parameter "pVelocity"

    .prologue
    .line 201
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 202
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 203
    return-void
.end method

.method public setVelocity(FF)V
    .locals 0
    .parameter "pVelocityX"
    .parameter "pVelocityY"

    .prologue
    .line 207
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 208
    iput p2, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 209
    return-void
.end method

.method public setVelocityX(F)V
    .locals 0
    .parameter "pVelocityX"

    .prologue
    .line 191
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityX:F

    .line 192
    return-void
.end method

.method public setVelocityY(F)V
    .locals 0
    .parameter "pVelocityY"

    .prologue
    .line 196
    iput p1, p0, Lorg/anddev/andengine/entity/shape/Shape;->mVelocityY:F

    .line 197
    return-void
.end method
