package org.anddev.andengine.entity.shape;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.util.modifier.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.opengl.util.*;

public abstract class Shape extends Entity implements IShape
{
    public static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
    public static final int BLENDFUNCTION_DESTINATION_PREMULTIPLYALPHA_DEFAULT = 771;
    public static final int BLENDFUNCTION_SOURCE_DEFAULT = 770;
    public static final int BLENDFUNCTION_SOURCE_PREMULTIPLYALPHA_DEFAULT = 1;
    protected float mAccelerationX;
    protected float mAccelerationY;
    protected float mAlpha;
    protected float mAngularVelocity;
    private final float mBaseX;
    private final float mBaseY;
    protected float mBlue;
    private boolean mCullingEnabled;
    protected int mDestinationBlendFunction;
    protected float mGreen;
    protected float mRed;
    protected float mRotation;
    protected float mRotationCenterX;
    protected float mRotationCenterY;
    protected float mScaleCenterX;
    protected float mScaleCenterY;
    protected float mScaleX;
    protected float mScaleY;
    private final ModifierList<IShape> mShapeModifiers;
    protected int mSourceBlendFunction;
    private boolean mUpdatePhysics;
    protected float mVelocityX;
    protected float mVelocityY;
    protected float mX;
    protected float mY;
    
    public Shape(final float n, final float n2) {
        super();
        this.mRed = 1.0f;
        this.mGreen = 1.0f;
        this.mBlue = 1.0f;
        this.mAlpha = 1.0f;
        this.mAccelerationX = 0.0f;
        this.mAccelerationY = 0.0f;
        this.mVelocityX = 0.0f;
        this.mVelocityY = 0.0f;
        this.mRotation = 0.0f;
        this.mAngularVelocity = 0.0f;
        this.mRotationCenterX = 0.0f;
        this.mRotationCenterY = 0.0f;
        this.mScaleX = 1.0f;
        this.mScaleY = 1.0f;
        this.mScaleCenterX = 0.0f;
        this.mScaleCenterY = 0.0f;
        this.mUpdatePhysics = true;
        this.mSourceBlendFunction = 770;
        this.mDestinationBlendFunction = 771;
        this.mShapeModifiers = new ModifierList<IShape>(this);
        this.mCullingEnabled = false;
        this.mBaseX = n;
        this.mBaseY = n2;
        this.mX = n;
        this.mY = n2;
    }
    
    @Override
    public void accelerate(final float n, final float n2) {
        this.mAccelerationX += n;
        this.mAccelerationY += n2;
    }
    
    @Override
    public void addShapeModifier(final IModifier<IShape> modifier) {
        this.mShapeModifiers.add(modifier);
    }
    
    protected void applyRotation(final GL10 gl10) {
        final float mRotation = this.mRotation;
        if (mRotation != 0.0f) {
            final float mRotationCenterX = this.mRotationCenterX;
            final float mRotationCenterY = this.mRotationCenterY;
            gl10.glTranslatef(mRotationCenterX, mRotationCenterY, 0.0f);
            gl10.glRotatef(mRotation, 0.0f, 0.0f, 1.0f);
            gl10.glTranslatef(-mRotationCenterX, -mRotationCenterY, 0.0f);
        }
    }
    
    protected void applyScale(final GL10 gl10) {
        final float mScaleX = this.mScaleX;
        final float mScaleY = this.mScaleY;
        if (mScaleX != 1.0f || mScaleY != 1.0f) {
            final float mScaleCenterX = this.mScaleCenterX;
            final float mScaleCenterY = this.mScaleCenterY;
            gl10.glTranslatef(mScaleCenterX, mScaleCenterY, 0.0f);
            gl10.glScalef(mScaleX, mScaleY, 1.0f);
            gl10.glTranslatef(-mScaleCenterX, -mScaleCenterY, 0.0f);
        }
    }
    
    protected void applyTranslation(final GL10 gl10) {
        gl10.glTranslatef(this.mX, this.mY, 0.0f);
    }
    
    @Override
    public void clearShapeModifiers() {
        this.mShapeModifiers.clear();
    }
    
    protected abstract void drawVertices(final GL10 p0, final Camera p1);
    
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
    
    protected abstract boolean isCulled(final Camera p0);
    
    @Override
    public boolean isCullingEnabled() {
        return this.mCullingEnabled;
    }
    
    @Override
    public boolean isScaled() {
        return this.mScaleX != 1.0f || this.mScaleY != 1.0f;
    }
    
    @Override
    public boolean isUpdatePhysics() {
        return this.mUpdatePhysics;
    }
    
    protected void onApplyTransformations(final GL10 gl10) {
        this.applyTranslation(gl10);
        this.applyRotation(gl10);
        this.applyScale(gl10);
    }
    
    protected abstract void onApplyVertices(final GL10 p0);
    
    @Override
    public boolean onAreaTouched(final TouchEvent touchEvent, final float n, final float n2) {
        return false;
    }
    
    protected void onInitDraw(final GL10 gl10) {
        GLHelper.setColor(gl10, this.mRed, this.mGreen, this.mBlue, this.mAlpha);
        GLHelper.enableVertexArray(gl10);
        GLHelper.blendFunction(gl10, this.mSourceBlendFunction, this.mDestinationBlendFunction);
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        if (!this.mCullingEnabled || !this.isCulled(camera)) {
            this.onInitDraw(gl10);
            gl10.glPushMatrix();
            this.onApplyVertices(gl10);
            this.onApplyTransformations(gl10);
            this.drawVertices(gl10, camera);
            gl10.glPopMatrix();
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        if (this.mUpdatePhysics) {
            final float mAccelerationX = this.mAccelerationX;
            final float mAccelerationY = this.mAccelerationY;
            if (mAccelerationX != 0.0f || mAccelerationY != 0.0f) {
                this.mVelocityX += mAccelerationX * n;
                this.mVelocityY += mAccelerationY * n;
            }
            final float mAngularVelocity = this.mAngularVelocity;
            if (mAngularVelocity != 0.0f) {
                this.mRotation += mAngularVelocity * n;
            }
            final float mVelocityX = this.mVelocityX;
            final float mVelocityY = this.mVelocityY;
            if (mVelocityX != 0.0f || mVelocityY != 0.0f) {
                this.mX += mVelocityX * n;
                this.mY += mVelocityY * n;
                this.onPositionChanged();
            }
        }
        this.mShapeModifiers.onUpdate(n);
    }
    
    protected void onPositionChanged() {
    }
    
    @Override
    public boolean removeShapeModifier(final IModifier<IShape> modifier) {
        return this.mShapeModifiers.remove(modifier);
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
    public void setAcceleration(final float n) {
        this.mAccelerationX = n;
        this.mAccelerationY = n;
    }
    
    @Override
    public void setAcceleration(final float mAccelerationX, final float mAccelerationY) {
        this.mAccelerationX = mAccelerationX;
        this.mAccelerationY = mAccelerationY;
    }
    
    @Override
    public void setAccelerationX(final float mAccelerationX) {
        this.mAccelerationX = mAccelerationX;
    }
    
    @Override
    public void setAccelerationY(final float mAccelerationY) {
        this.mAccelerationY = mAccelerationY;
    }
    
    @Override
    public void setAlpha(final float mAlpha) {
        this.mAlpha = mAlpha;
    }
    
    @Override
    public void setAngularVelocity(final float mAngularVelocity) {
        this.mAngularVelocity = mAngularVelocity;
    }
    
    @Override
    public void setBasePosition() {
        this.mX = this.mBaseX;
        this.mY = this.mBaseY;
        this.onPositionChanged();
    }
    
    @Override
    public void setBlendFunction(final int mSourceBlendFunction, final int mDestinationBlendFunction) {
        this.mSourceBlendFunction = mSourceBlendFunction;
        this.mDestinationBlendFunction = mDestinationBlendFunction;
    }
    
    @Override
    public void setColor(final float mRed, final float mGreen, final float mBlue) {
        this.mRed = mRed;
        this.mGreen = mGreen;
        this.mBlue = mBlue;
    }
    
    @Override
    public void setColor(final float mRed, final float mGreen, final float mBlue, final float mAlpha) {
        this.mRed = mRed;
        this.mGreen = mGreen;
        this.mBlue = mBlue;
        this.mAlpha = mAlpha;
    }
    
    @Override
    public void setCullingEnabled(final boolean mCullingEnabled) {
        this.mCullingEnabled = mCullingEnabled;
    }
    
    @Override
    public void setPosition(final float mx, final float my) {
        this.mX = mx;
        this.mY = my;
        this.onPositionChanged();
    }
    
    @Override
    public void setPosition(final IShape shape) {
        this.setPosition(shape.getX(), shape.getY());
    }
    
    @Override
    public void setRotation(final float mRotation) {
        this.mRotation = mRotation;
    }
    
    @Override
    public void setRotationCenter(final float mRotationCenterX, final float mRotationCenterY) {
        this.mRotationCenterX = mRotationCenterX;
        this.mRotationCenterY = mRotationCenterY;
    }
    
    @Override
    public void setRotationCenterX(final float mRotationCenterX) {
        this.mRotationCenterX = mRotationCenterX;
    }
    
    @Override
    public void setRotationCenterY(final float mRotationCenterY) {
        this.mRotationCenterY = mRotationCenterY;
    }
    
    @Override
    public void setScale(final float n) {
        this.mScaleX = n;
        this.mScaleY = n;
    }
    
    @Override
    public void setScale(final float mScaleX, final float mScaleY) {
        this.mScaleX = mScaleX;
        this.mScaleY = mScaleY;
    }
    
    @Override
    public void setScaleCenter(final float mScaleCenterX, final float mScaleCenterY) {
        this.mScaleCenterX = mScaleCenterX;
        this.mScaleCenterY = mScaleCenterY;
    }
    
    @Override
    public void setScaleCenterX(final float mScaleCenterX) {
        this.mScaleCenterX = mScaleCenterX;
    }
    
    @Override
    public void setScaleCenterY(final float mScaleCenterY) {
        this.mScaleCenterY = mScaleCenterY;
    }
    
    @Override
    public void setScaleX(final float mScaleX) {
        this.mScaleX = mScaleX;
    }
    
    @Override
    public void setScaleY(final float mScaleY) {
        this.mScaleY = mScaleY;
    }
    
    @Override
    public void setUpdatePhysics(final boolean mUpdatePhysics) {
        this.mUpdatePhysics = mUpdatePhysics;
    }
    
    @Override
    public void setVelocity(final float n) {
        this.mVelocityX = n;
        this.mVelocityY = n;
    }
    
    @Override
    public void setVelocity(final float mVelocityX, final float mVelocityY) {
        this.mVelocityX = mVelocityX;
        this.mVelocityY = mVelocityY;
    }
    
    @Override
    public void setVelocityX(final float mVelocityX) {
        this.mVelocityX = mVelocityX;
    }
    
    @Override
    public void setVelocityY(final float mVelocityY) {
        this.mVelocityY = mVelocityY;
    }
}
