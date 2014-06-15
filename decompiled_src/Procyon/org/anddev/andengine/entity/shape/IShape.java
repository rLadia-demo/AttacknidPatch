package org.anddev.andengine.entity.shape;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.util.modifier.*;

public interface IShape extends IEntity, ITouchArea
{
    void accelerate(float p0, float p1);
    
    void addShapeModifier(IModifier<IShape> p0);
    
    void clearShapeModifiers();
    
    boolean collidesWith(IShape p0);
    
    float getAccelerationX();
    
    float getAccelerationY();
    
    float getAlpha();
    
    float getAngularVelocity();
    
    float getBaseHeight();
    
    float getBaseWidth();
    
    float getBaseX();
    
    float getBaseY();
    
    float getBlue();
    
    float getGreen();
    
    float getHeight();
    
    float getHeightScaled();
    
    float getRed();
    
    float getRotation();
    
    float getRotationCenterX();
    
    float getRotationCenterY();
    
    float getScaleCenterX();
    
    float getScaleCenterY();
    
    float getScaleX();
    
    float getScaleY();
    
    float[] getSceneCenterCoordinates();
    
    float getVelocityX();
    
    float getVelocityY();
    
    float getWidth();
    
    float getWidthScaled();
    
    float getX();
    
    float getY();
    
    boolean isCullingEnabled();
    
    boolean isScaled();
    
    boolean isUpdatePhysics();
    
    boolean removeShapeModifier(IModifier<IShape> p0);
    
    void setAcceleration(float p0);
    
    void setAcceleration(float p0, float p1);
    
    void setAccelerationX(float p0);
    
    void setAccelerationY(float p0);
    
    void setAlpha(float p0);
    
    void setAngularVelocity(float p0);
    
    void setBasePosition();
    
    void setBlendFunction(int p0, int p1);
    
    void setColor(float p0, float p1, float p2);
    
    void setColor(float p0, float p1, float p2, float p3);
    
    void setCullingEnabled(boolean p0);
    
    void setPosition(float p0, float p1);
    
    void setPosition(IShape p0);
    
    void setRotation(float p0);
    
    void setRotationCenter(float p0, float p1);
    
    void setRotationCenterX(float p0);
    
    void setRotationCenterY(float p0);
    
    void setScale(float p0);
    
    void setScale(float p0, float p1);
    
    void setScaleCenter(float p0, float p1);
    
    void setScaleCenterX(float p0);
    
    void setScaleCenterY(float p0);
    
    void setScaleX(float p0);
    
    void setScaleY(float p0);
    
    void setUpdatePhysics(boolean p0);
    
    void setVelocity(float p0);
    
    void setVelocity(float p0, float p1);
    
    void setVelocityX(float p0);
    
    void setVelocityY(float p0);
}
