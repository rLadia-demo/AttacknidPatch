.class public abstract Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;
.super Ljava/lang/Object;
.source "BaseMenuItemDecorator.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;


# instance fields
.field private final mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
    .locals 0
    .parameter "pMenuItem"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 32
    return-void
.end method


# virtual methods
.method public accelerate(FF)V
    .locals 1
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 65
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->accelerate(FF)V

    .line 66
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
    .line 70
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 71
    return-void
.end method

.method public clearShapeModifiers()V
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->clearShapeModifiers()V

    .line 76
    return-void
.end method

.method public collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z
    .locals 1
    .parameter "pOtherShape"

    .prologue
    .line 80
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z

    move-result v0

    return v0
.end method

.method public contains(FF)Z
    .locals 1
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 411
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->contains(FF)Z

    move-result v0

    return v0
.end method

.method public convertLocalToSceneCoordinates(FF)[F
    .locals 1
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 416
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->convertLocalToSceneCoordinates(FF)[F

    move-result-object v0

    return-object v0
.end method

.method public convertSceneToLocalCoordinates(FF)[F
    .locals 1
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 421
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->convertSceneToLocalCoordinates(FF)[F

    move-result-object v0

    return-object v0
.end method

.method public getAccelerationX()F
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getAccelerationX()F

    move-result v0

    return v0
.end method

.method public getAccelerationY()F
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getAccelerationY()F

    move-result v0

    return v0
.end method

.method public getAlpha()F
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getAlpha()F

    move-result v0

    return v0
.end method

.method public getAngularVelocity()F
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getAngularVelocity()F

    move-result v0

    return v0
.end method

.method public getBaseHeight()F
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getBaseHeight()F

    move-result v0

    return v0
.end method

.method public getBaseWidth()F
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getBaseWidth()F

    move-result v0

    return v0
.end method

.method public getBaseX()F
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getBaseX()F

    move-result v0

    return v0
.end method

.method public getBaseY()F
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getBaseY()F

    move-result v0

    return v0
.end method

.method public getBlue()F
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getBlue()F

    move-result v0

    return v0
.end method

.method public getGreen()F
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getGreen()F

    move-result v0

    return v0
.end method

.method public getHeight()F
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getHeight()F

    move-result v0

    return v0
.end method

.method public getHeightScaled()F
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getHeightScaled()F

    move-result v0

    return v0
.end method

.method public getID()I
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getID()I

    move-result v0

    return v0
.end method

.method public getRed()F
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getRed()F

    move-result v0

    return v0
.end method

.method public getRotation()F
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getRotation()F

    move-result v0

    return v0
.end method

.method public getRotationCenterX()F
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getRotationCenterX()F

    move-result v0

    return v0
.end method

.method public getRotationCenterY()F
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getRotationCenterY()F

    move-result v0

    return v0
.end method

.method public getScaleCenterX()F
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getScaleCenterX()F

    move-result v0

    return v0
.end method

.method public getScaleCenterY()F
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getScaleCenterY()F

    move-result v0

    return v0
.end method

.method public getScaleX()F
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getScaleX()F

    move-result v0

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getScaleY()F

    move-result v0

    return v0
.end method

.method public getSceneCenterCoordinates()[F
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getSceneCenterCoordinates()[F

    move-result-object v0

    return-object v0
.end method

.method public getVelocityX()F
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getVelocityX()F

    move-result v0

    return v0
.end method

.method public getVelocityY()F
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getVelocityY()F

    move-result v0

    return v0
.end method

.method public getWidth()F
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getWidth()F

    move-result v0

    return v0
.end method

.method public getWidthScaled()F
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getWidthScaled()F

    move-result v0

    return v0
.end method

.method public getX()F
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getX()F

    move-result v0

    return v0
.end method

.method public getY()F
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getY()F

    move-result v0

    return v0
.end method

.method public getZIndex()I
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getZIndex()I

    move-result v0

    return v0
.end method

.method public isCullingEnabled()Z
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->isCullingEnabled()Z

    move-result v0

    return v0
.end method

.method public isScaled()Z
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->isScaled()Z

    move-result v0

    return v0
.end method

.method public isUpdatePhysics()Z
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->isUpdatePhysics()Z

    move-result v0

    return v0
.end method

.method public onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 1
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    .line 426
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z

    move-result v0

    return v0
.end method

.method public onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 395
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 396
    return-void
.end method

.method protected abstract onMenuItemReset(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
.end method

.method protected abstract onMenuItemSelected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
.end method

.method protected abstract onMenuItemUnselected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
.end method

.method public final onSelected()V
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onSelected()V

    .line 54
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->onMenuItemSelected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V

    .line 55
    return-void
.end method

.method public final onUnselected()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUnselected()V

    .line 60
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->onMenuItemUnselected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V

    .line 61
    return-void
.end method

.method public onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 400
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUpdate(F)V

    .line 401
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
    .line 235
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->removeShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->reset()V

    .line 406
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->onMenuItemReset(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V

    .line 407
    return-void
.end method

.method public setAcceleration(F)V
    .locals 1
    .parameter "pAcceleration"

    .prologue
    .line 240
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAcceleration(F)V

    .line 241
    return-void
.end method

.method public setAcceleration(FF)V
    .locals 1
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"

    .prologue
    .line 245
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAcceleration(FF)V

    .line 246
    return-void
.end method

.method public setAccelerationX(F)V
    .locals 1
    .parameter "pAccelerationX"

    .prologue
    .line 250
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAccelerationX(F)V

    .line 251
    return-void
.end method

.method public setAccelerationY(F)V
    .locals 1
    .parameter "pAccelerationY"

    .prologue
    .line 255
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAccelerationY(F)V

    .line 256
    return-void
.end method

.method public setAlpha(F)V
    .locals 1
    .parameter "pAlpha"

    .prologue
    .line 260
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAlpha(F)V

    .line 261
    return-void
.end method

.method public setAngularVelocity(F)V
    .locals 1
    .parameter "pAngularVelocity"

    .prologue
    .line 265
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAngularVelocity(F)V

    .line 266
    return-void
.end method

.method public setBasePosition()V
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setBasePosition()V

    .line 271
    return-void
.end method

.method public setBlendFunction(II)V
    .locals 1
    .parameter "pSourceBlendFunction"
    .parameter "pDestinationBlendFunction"

    .prologue
    .line 275
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setBlendFunction(II)V

    .line 276
    return-void
.end method

.method public setColor(FFF)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 280
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setColor(FFF)V

    .line 281
    return-void
.end method

.method public setColor(FFFF)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"

    .prologue
    .line 285
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setColor(FFFF)V

    .line 286
    return-void
.end method

.method public setCullingEnabled(Z)V
    .locals 1
    .parameter "pCullingEnabled"

    .prologue
    .line 290
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setCullingEnabled(Z)V

    .line 291
    return-void
.end method

.method public setPosition(FF)V
    .locals 1
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 300
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setPosition(FF)V

    .line 301
    return-void
.end method

.method public setPosition(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 1
    .parameter "pOtherShape"

    .prologue
    .line 295
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setPosition(Lorg/anddev/andengine/entity/shape/IShape;)V

    .line 296
    return-void
.end method

.method public setRotation(F)V
    .locals 1
    .parameter "pRotation"

    .prologue
    .line 305
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setRotation(F)V

    .line 306
    return-void
.end method

.method public setRotationCenter(FF)V
    .locals 1
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"

    .prologue
    .line 310
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setRotationCenter(FF)V

    .line 311
    return-void
.end method

.method public setRotationCenterX(F)V
    .locals 1
    .parameter "pRotationCenterX"

    .prologue
    .line 315
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setRotationCenterX(F)V

    .line 316
    return-void
.end method

.method public setRotationCenterY(F)V
    .locals 1
    .parameter "pRotationCenterY"

    .prologue
    .line 320
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setRotationCenterY(F)V

    .line 321
    return-void
.end method

.method public setScale(F)V
    .locals 1
    .parameter "pScale"

    .prologue
    .line 325
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScale(F)V

    .line 326
    return-void
.end method

.method public setScale(FF)V
    .locals 1
    .parameter "pScaleX"
    .parameter "pScaleY"

    .prologue
    .line 330
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScale(FF)V

    .line 331
    return-void
.end method

.method public setScaleCenter(FF)V
    .locals 1
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 335
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScaleCenter(FF)V

    .line 336
    return-void
.end method

.method public setScaleCenterX(F)V
    .locals 1
    .parameter "pScaleCenterX"

    .prologue
    .line 340
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScaleCenterX(F)V

    .line 341
    return-void
.end method

.method public setScaleCenterY(F)V
    .locals 1
    .parameter "pScaleCenterY"

    .prologue
    .line 345
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScaleCenterY(F)V

    .line 346
    return-void
.end method

.method public setScaleX(F)V
    .locals 1
    .parameter "pScaleX"

    .prologue
    .line 350
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScaleX(F)V

    .line 351
    return-void
.end method

.method public setScaleY(F)V
    .locals 1
    .parameter "pScaleY"

    .prologue
    .line 355
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScaleY(F)V

    .line 356
    return-void
.end method

.method public setUpdatePhysics(Z)V
    .locals 1
    .parameter "pUpdatePhysics"

    .prologue
    .line 360
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setUpdatePhysics(Z)V

    .line 361
    return-void
.end method

.method public setVelocity(F)V
    .locals 1
    .parameter "pVelocity"

    .prologue
    .line 365
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setVelocity(F)V

    .line 366
    return-void
.end method

.method public setVelocity(FF)V
    .locals 1
    .parameter "pVelocityX"
    .parameter "pVelocityY"

    .prologue
    .line 370
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setVelocity(FF)V

    .line 371
    return-void
.end method

.method public setVelocityX(F)V
    .locals 1
    .parameter "pVelocityX"

    .prologue
    .line 375
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setVelocityX(F)V

    .line 376
    return-void
.end method

.method public setVelocityY(F)V
    .locals 1
    .parameter "pVelocityY"

    .prologue
    .line 380
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setVelocityY(F)V

    .line 381
    return-void
.end method

.method public setZIndex(I)V
    .locals 1
    .parameter "pZIndex"

    .prologue
    .line 390
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;->mMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setZIndex(I)V

    .line 391
    return-void
.end method
