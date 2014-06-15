/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ModifierList;

public abstract class Shape
extends Entity
implements IShape {
    public static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
    public static final int BLENDFUNCTION_DESTINATION_PREMULTIPLYALPHA_DEFAULT = 771;
    public static final int BLENDFUNCTION_SOURCE_DEFAULT = 770;
    public static final int BLENDFUNCTION_SOURCE_PREMULTIPLYALPHA_DEFAULT = 1;
    protected float mAccelerationX = 0.0f;
    protected float mAccelerationY = 0.0f;
    protected float mAlpha = 1.0f;
    protected float mAngularVelocity = 0.0f;
    private final float mBaseX;
    private final float mBaseY;
    protected float mBlue = 1.0f;
    private boolean mCullingEnabled;
    protected int mDestinationBlendFunction = 771;
    protected float mGreen = 1.0f;
    protected float mRed = 1.0f;
    protected float mRotation = 0.0f;
    protected float mRotationCenterX = 0.0f;
    protected float mRotationCenterY = 0.0f;
    protected float mScaleCenterX = 0.0f;
    protected float mScaleCenterY = 0.0f;
    protected float mScaleX = 1.0f;
    protected float mScaleY = 1.0f;
    private final ModifierList<IShape> mShapeModifiers;
    protected int mSourceBlendFunction = 770;
    private boolean mUpdatePhysics = true;
    protected float mVelocityX = 0.0f;
    protected float mVelocityY = 0.0f;
    protected float mX;
    protected float mY;

    public Shape(float f, float f2) {
        this.mShapeModifiers = new ModifierList<Shape>(this);
        this.mCullingEnabled = false;
        this.mBaseX = f;
        this.mBaseY = f2;
        this.mX = f;
        this.mY = f2;
    }

    @Override
    public void accelerate(float f, float f2) {
        this.mAccelerationX = f + this.mAccelerationX;
        this.mAccelerationY = f2 + this.mAccelerationY;
    }

    @Override
    public void addShapeModifier(IModifier<IShape> iModifier) {
        this.mShapeModifiers.add(iModifier);
    }

    protected void applyRotation(GL10 gL10) {
        float f = this.mRotation;
        if (f == 0.0f) return;
        float f2 = this.mRotationCenterX;
        float f3 = this.mRotationCenterY;
        gL10.glTranslatef(f2, f3, 0.0f);
        gL10.glRotatef(f, 0.0f, 0.0f, 1.0f);
        gL10.glTranslatef(- f2, - f3, 0.0f);
    }

    protected void applyScale(GL10 gL10) {
        float f = this.mScaleX;
        float f2 = this.mScaleY;
        if (f == 1.0f && f2 == 1.0f) return;
        float f3 = this.mScaleCenterX;
        float f4 = this.mScaleCenterY;
        gL10.glTranslatef(f3, f4, 0.0f);
        gL10.glScalef(f, f2, 1.0f);
        gL10.glTranslatef(- f3, - f4, 0.0f);
    }

    protected void applyTranslation(GL10 gL10) {
        gL10.glTranslatef(this.mX, this.mY, 0.0f);
    }

    @Override
    public void clearShapeModifiers() {
        this.mShapeModifiers.clear();
    }

    protected abstract void drawVertices(GL10 var1, Camera var2);

    @Override
    public float getAccelerationX() {
        return this.mAccelerationX;
    }

    @Override
    public float getAccelerationY() {
        return this.mAccelerationY;
    }

    @Override
    public float getAlpha() {
        return this.mAlpha;
    }

    @Override
    public float getAngularVelocity() {
        return this.mAngularVelocity;
    }

    @Override
    public float getBaseX() {
        return this.mBaseX;
    }

    @Override
    public float getBaseY() {
        return this.mBaseY;
    }

    @Override
    public float getBlue() {
        return this.mBlue;
    }

    @Override
    public float getGreen() {
        return this.mGreen;
    }

    @Override
    public float getHeightScaled() {
        return this.getHeight() * this.mScaleY;
    }

    @Override
    public float getRed() {
        return this.mRed;
    }

    @Override
    public float getRotation() {
        return this.mRotation;
    }

    @Override
    public float getRotationCenterX() {
        return this.mRotationCenterX;
    }

    @Override
    public float getRotationCenterY() {
        return this.mRotationCenterY;
    }

    @Override
    public float getScaleCenterX() {
        return this.mScaleCenterX;
    }

    @Override
    public float getScaleCenterY() {
        return this.mScaleCenterY;
    }

    @Override
    public float getScaleX() {
        return this.mScaleX;
    }

    @Override
    public float getScaleY() {
        return this.mScaleY;
    }

    @Override
    public float getVelocityX() {
        return this.mVelocityX;
    }

    @Override
    public float getVelocityY() {
        return this.mVelocityY;
    }

    @Override
    public float getWidthScaled() {
        return this.getWidth() * this.mScaleX;
    }

    @Override
    public float getX() {
        return this.mX;
    }

    @Override
    public float getY() {
        return this.mY;
    }

    protected abstract boolean isCulled(Camera var1);

    @Override
    public boolean isCullingEnabled() {
        return this.mCullingEnabled;
    }

    @Override
    public boolean isScaled() {
        if (this.mScaleX != 1.0f || this.mScaleY != 1.0f) return true;
        return false;
    }

    @Override
    public boolean isUpdatePhysics() {
        return this.mUpdatePhysics;
    }

    protected void onApplyTransformations(GL10 gL10) {
        this.applyTranslation(gL10);
        this.applyRotation(gL10);
        this.applyScale(gL10);
    }

    protected abstract void onApplyVertices(GL10 var1);

    @Override
    public boolean onAreaTouched(TouchEvent touchEvent22, float touchEvent22, float touchEvent22) {
        return false;
    }

    protected void onInitDraw(GL10 gL10) {
        GLHelper.setColor(gL10, this.mRed, this.mGreen, this.mBlue, this.mAlpha);
        GLHelper.enableVertexArray(gL10);
        GLHelper.blendFunction(gL10, this.mSourceBlendFunction, this.mDestinationBlendFunction);
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        if (this.mCullingEnabled && this.isCulled(camera)) return;
        this.onInitDraw(gL10);
        gL10.glPushMatrix();
        this.onApplyVertices(gL10);
        this.onApplyTransformations(gL10);
        this.drawVertices(gL10, camera);
        gL10.glPopMatrix();
    }

    @Override
    protected void onManagedUpdate(float f) {
        if (this.mUpdatePhysics) {
            float f2;
            float f3 = this.mAccelerationX;
            float f4 = this.mAccelerationY;
            if (f3 != 0.0f || f4 != 0.0f) {
                this.mVelocityX+=f3 * f;
                this.mVelocityY+=f4 * f;
            }
            if ((f2 = this.mAngularVelocity) != 0.0f) {
                this.mRotation+=f2 * f;
            }
            float f5 = this.mVelocityX;
            float f6 = this.mVelocityY;
            if (f5 != 0.0f || f6 != 0.0f) {
                this.mX+=f5 * f;
                this.mY+=f6 * f;
                this.onPositionChanged();
            }
        }
        this.mShapeModifiers.onUpdate(f);
    }

    protected void onPositionChanged() {
    }

    @Override
    public boolean removeShapeModifier(IModifier<IShape> iModifier) {
        return this.mShapeModifiers.remove(iModifier);
    }

    @Override
    public void reset() {
        super.reset();
        this.mX = this.mBaseX;
        this.mY = this.mBaseY;
        this.mAccelerationX = 0.0f;
        this.mAccelerationY = 0.0f;
        this.mVelocityX = 0.0f;
        this.mVelocityY = 0.0f;
        this.mRotation = 0.0f;
        this.mAngularVelocity = 0.0f;
        this.mScaleX = 1.0f;
        this.mScaleY = 1.0f;
        this.onPositionChanged();
        this.mRed = 1.0f;
        this.mGreen = 1.0f;
        this.mBlue = 1.0f;
        this.mAlpha = 1.0f;
        this.mSourceBlendFunction = 770;
        this.mDestinationBlendFunction = 771;
        this.mShapeModifiers.reset();
    }

    @Override
    public void setAcceleration(float f) {
        this.mAccelerationX = f;
        this.mAccelerationY = f;
    }

    @Override
    public void setAcceleration(float f, float f2) {
        this.mAccelerationX = f;
        this.mAccelerationY = f2;
    }

    @Override
    public void setAccelerationX(float f) {
        this.mAccelerationX = f;
    }

    @Override
    public void setAccelerationY(float f) {
        this.mAccelerationY = f;
    }

    @Override
    public void setAlpha(float f) {
        this.mAlpha = f;
    }

    @Override
    public void setAngularVelocity(float f) {
        this.mAngularVelocity = f;
    }

    @Override
    public void setBasePosition() {
        this.mX = this.mBaseX;
        this.mY = this.mBaseY;
        this.onPositionChanged();
    }

    @Override
    public void setBlendFunction(int n, int n2) {
        this.mSourceBlendFunction = n;
        this.mDestinationBlendFunction = n2;
    }

    @Override
    public void setColor(float f, float f2, float f3) {
        this.mRed = f;
        this.mGreen = f2;
        this.mBlue = f3;
    }

    @Override
    public void setColor(float f, float f2, float f3, float f4) {
        this.mRed = f;
        this.mGreen = f2;
        this.mBlue = f3;
        this.mAlpha = f4;
    }

    @Override
    public void setCullingEnabled(boolean bl) {
        this.mCullingEnabled = bl;
    }

    @Override
    public void setPosition(float f, float f2) {
        this.mX = f;
        this.mY = f2;
        this.onPositionChanged();
    }

    @Override
    public void setPosition(IShape iShape) {
        this.setPosition(iShape.getX(), iShape.getY());
    }

    @Override
    public void setRotation(float f) {
        this.mRotation = f;
    }

    @Override
    public void setRotationCenter(float f, float f2) {
        this.mRotationCenterX = f;
        this.mRotationCenterY = f2;
    }

    @Override
    public void setRotationCenterX(float f) {
        this.mRotationCenterX = f;
    }

    @Override
    public void setRotationCenterY(float f) {
        this.mRotationCenterY = f;
    }

    @Override
    public void setScale(float f) {
        this.mScaleX = f;
        this.mScaleY = f;
    }

    @Override
    public void setScale(float f, float f2) {
        this.mScaleX = f;
        this.mScaleY = f2;
    }

    @Override
    public void setScaleCenter(float f, float f2) {
        this.mScaleCenterX = f;
        this.mScaleCenterY = f2;
    }

    @Override
    public void setScaleCenterX(float f) {
        this.mScaleCenterX = f;
    }

    @Override
    public void setScaleCenterY(float f) {
        this.mScaleCenterY = f;
    }

    @Override
    public void setScaleX(float f) {
        this.mScaleX = f;
    }

    @Override
    public void setScaleY(float f) {
        this.mScaleY = f;
    }

    @Override
    public void setUpdatePhysics(boolean bl) {
        this.mUpdatePhysics = bl;
    }

    @Override
    public void setVelocity(float f) {
        this.mVelocityX = f;
        this.mVelocityY = f;
    }

    @Override
    public void setVelocity(float f, float f2) {
        this.mVelocityX = f;
        this.mVelocityY = f2;
    }

    @Override
    public void setVelocityX(float f) {
        this.mVelocityX = f;
    }

    @Override
    public void setVelocityY(float f) {
        this.mVelocityY = f;
    }
}

