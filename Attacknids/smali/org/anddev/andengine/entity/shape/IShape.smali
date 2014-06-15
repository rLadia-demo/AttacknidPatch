.class public interface abstract Lorg/anddev/andengine/entity/shape/IShape;
.super Ljava/lang/Object;
.source "IShape.java"

# interfaces
.implements Lorg/anddev/andengine/entity/IEntity;
.implements Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;


# virtual methods
.method public abstract accelerate(FF)V
.end method

.method public abstract addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract clearShapeModifiers()V
.end method

.method public abstract collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z
.end method

.method public abstract getAccelerationX()F
.end method

.method public abstract getAccelerationY()F
.end method

.method public abstract getAlpha()F
.end method

.method public abstract getAngularVelocity()F
.end method

.method public abstract getBaseHeight()F
.end method

.method public abstract getBaseWidth()F
.end method

.method public abstract getBaseX()F
.end method

.method public abstract getBaseY()F
.end method

.method public abstract getBlue()F
.end method

.method public abstract getGreen()F
.end method

.method public abstract getHeight()F
.end method

.method public abstract getHeightScaled()F
.end method

.method public abstract getRed()F
.end method

.method public abstract getRotation()F
.end method

.method public abstract getRotationCenterX()F
.end method

.method public abstract getRotationCenterY()F
.end method

.method public abstract getScaleCenterX()F
.end method

.method public abstract getScaleCenterY()F
.end method

.method public abstract getScaleX()F
.end method

.method public abstract getScaleY()F
.end method

.method public abstract getSceneCenterCoordinates()[F
.end method

.method public abstract getVelocityX()F
.end method

.method public abstract getVelocityY()F
.end method

.method public abstract getWidth()F
.end method

.method public abstract getWidthScaled()F
.end method

.method public abstract getX()F
.end method

.method public abstract getY()F
.end method

.method public abstract isCullingEnabled()Z
.end method

.method public abstract isScaled()Z
.end method

.method public abstract isUpdatePhysics()Z
.end method

.method public abstract removeShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract setAcceleration(F)V
.end method

.method public abstract setAcceleration(FF)V
.end method

.method public abstract setAccelerationX(F)V
.end method

.method public abstract setAccelerationY(F)V
.end method

.method public abstract setAlpha(F)V
.end method

.method public abstract setAngularVelocity(F)V
.end method

.method public abstract setBasePosition()V
.end method

.method public abstract setBlendFunction(II)V
.end method

.method public abstract setColor(FFF)V
.end method

.method public abstract setColor(FFFF)V
.end method

.method public abstract setCullingEnabled(Z)V
.end method

.method public abstract setPosition(FF)V
.end method

.method public abstract setPosition(Lorg/anddev/andengine/entity/shape/IShape;)V
.end method

.method public abstract setRotation(F)V
.end method

.method public abstract setRotationCenter(FF)V
.end method

.method public abstract setRotationCenterX(F)V
.end method

.method public abstract setRotationCenterY(F)V
.end method

.method public abstract setScale(F)V
.end method

.method public abstract setScale(FF)V
.end method

.method public abstract setScaleCenter(FF)V
.end method

.method public abstract setScaleCenterX(F)V
.end method

.method public abstract setScaleCenterY(F)V
.end method

.method public abstract setScaleX(F)V
.end method

.method public abstract setScaleY(F)V
.end method

.method public abstract setUpdatePhysics(Z)V
.end method

.method public abstract setVelocity(F)V
.end method

.method public abstract setVelocity(FF)V
.end method

.method public abstract setVelocityX(F)V
.end method

.method public abstract setVelocityY(F)V
.end method
