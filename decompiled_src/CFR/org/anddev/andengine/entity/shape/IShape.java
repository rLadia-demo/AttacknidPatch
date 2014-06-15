/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape;

import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.util.modifier.IModifier;

public interface IShape
extends IEntity,
Scene.ITouchArea {
    public void accelerate(float var1, float var2);

    public void addShapeModifier(IModifier<IShape> var1);

    public void clearShapeModifiers();

    public boolean collidesWith(IShape var1);

    public float getAccelerationX();

    public float getAccelerationY();

    public float getAlpha();

    public float getAngularVelocity();

    public float getBaseHeight();

    public float getBaseWidth();

    public float getBaseX();

    public float getBaseY();

    public float getBlue();

    public float getGreen();

    public float getHeight();

    public float getHeightScaled();

    public float getRed();

    public float getRotation();

    public float getRotationCenterX();

    public float getRotationCenterY();

    public float getScaleCenterX();

    public float getScaleCenterY();

    public float getScaleX();

    public float getScaleY();

    public float[] getSceneCenterCoordinates();

    public float getVelocityX();

    public float getVelocityY();

    public float getWidth();

    public float getWidthScaled();

    public float getX();

    public float getY();

    public boolean isCullingEnabled();

    public boolean isScaled();

    public boolean isUpdatePhysics();

    public boolean removeShapeModifier(IModifier<IShape> var1);

    public void setAcceleration(float var1);

    public void setAcceleration(float var1, float var2);

    public void setAccelerationX(float var1);

    public void setAccelerationY(float var1);

    public void setAlpha(float var1);

    public void setAngularVelocity(float var1);

    public void setBasePosition();

    public void setBlendFunction(int var1, int var2);

    public void setColor(float var1, float var2, float var3);

    public void setColor(float var1, float var2, float var3, float var4);

    public void setCullingEnabled(boolean var1);

    public void setPosition(float var1, float var2);

    public void setPosition(IShape var1);

    public void setRotation(float var1);

    public void setRotationCenter(float var1, float var2);

    public void setRotationCenterX(float var1);

    public void setRotationCenterY(float var1);

    public void setScale(float var1);

    public void setScale(float var1, float var2);

    public void setScaleCenter(float var1, float var2);

    public void setScaleCenterX(float var1);

    public void setScaleCenterY(float var1);

    public void setScaleX(float var1);

    public void setScaleY(float var1);

    public void setUpdatePhysics(boolean var1);

    public void setVelocity(float var1);

    public void setVelocity(float var1, float var2);

    public void setVelocityX(float var1);

    public void setVelocityY(float var1);
}

