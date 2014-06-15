package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.input.touch.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.scene.*;

public abstract class BaseMenuItemDecorator implements IMenuItem
{
    private final IMenuItem mMenuItem;
    
    public BaseMenuItemDecorator(final IMenuItem mMenuItem) {
        super();
        this.mMenuItem = mMenuItem;
    }
    
    @Override
    public void accelerate(final float n, final float n2) {
        this.mMenuItem.accelerate(n, n2);
    }
    
    @Override
    public void addShapeModifier(final IModifier<IShape> modifier) {
        this.mMenuItem.addShapeModifier(modifier);
    }
    
    @Override
    public void clearShapeModifiers() {
        this.mMenuItem.clearShapeModifiers();
    }
    
    @Override
    public boolean collidesWith(final IShape shape) {
        return this.mMenuItem.collidesWith(shape);
    }
    
    @Override
    public boolean contains(final float n, final float n2) {
        return ((Scene.ITouchArea)this.mMenuItem).contains(n, n2);
    }
    
    @Override
    public float[] convertLocalToSceneCoordinates(final float n, final float n2) {
        return ((Scene.ITouchArea)this.mMenuItem).convertLocalToSceneCoordinates(n, n2);
    }
    
    @Override
    public float[] convertSceneToLocalCoordinates(final float n, final float n2) {
        return ((Scene.ITouchArea)this.mMenuItem).convertSceneToLocalCoordinates(n, n2);
    }
    
    @Override
    public float getAccelerationX() {
        return this.mMenuItem.getAccelerationX();
    }
    
    @Override
    public float getAccelerationY() {
        return this.mMenuItem.getAccelerationY();
    }
    
    @Override
    public float getAlpha() {
        return this.mMenuItem.getAlpha();
    }
    
    @Override
    public float getAngularVelocity() {
        return this.mMenuItem.getAngularVelocity();
    }
    
    @Override
    public float getBaseHeight() {
        return this.mMenuItem.getBaseHeight();
    }
    
    @Override
    public float getBaseWidth() {
        return this.mMenuItem.getBaseWidth();
    }
    
    @Override
    public float getBaseX() {
        return this.mMenuItem.getBaseX();
    }
    
    @Override
    public float getBaseY() {
        return this.mMenuItem.getBaseY();
    }
    
    @Override
    public float getBlue() {
        return this.mMenuItem.getBlue();
    }
    
    @Override
    public float getGreen() {
        return this.mMenuItem.getGreen();
    }
    
    @Override
    public float getHeight() {
        return this.mMenuItem.getHeight();
    }
    
    @Override
    public float getHeightScaled() {
        return this.mMenuItem.getHeightScaled();
    }
    
    @Override
    public int getID() {
        return this.mMenuItem.getID();
    }
    
    @Override
    public float getRed() {
        return this.mMenuItem.getRed();
    }
    
    @Override
    public float getRotation() {
        return this.mMenuItem.getRotation();
    }
    
    @Override
    public float getRotationCenterX() {
        return this.mMenuItem.getRotationCenterX();
    }
    
    @Override
    public float getRotationCenterY() {
        return this.mMenuItem.getRotationCenterY();
    }
    
    @Override
    public float getScaleCenterX() {
        return this.mMenuItem.getScaleCenterX();
    }
    
    @Override
    public float getScaleCenterY() {
        return this.mMenuItem.getScaleCenterY();
    }
    
    @Override
    public float getScaleX() {
        return this.mMenuItem.getScaleX();
    }
    
    @Override
    public float getScaleY() {
        return this.mMenuItem.getScaleY();
    }
    
    @Override
    public float[] getSceneCenterCoordinates() {
        return this.mMenuItem.getSceneCenterCoordinates();
    }
    
    @Override
    public float getVelocityX() {
        return this.mMenuItem.getVelocityX();
    }
    
    @Override
    public float getVelocityY() {
        return this.mMenuItem.getVelocityY();
    }
    
    @Override
    public float getWidth() {
        return this.mMenuItem.getWidth();
    }
    
    @Override
    public float getWidthScaled() {
        return this.mMenuItem.getWidthScaled();
    }
    
    @Override
    public float getX() {
        return this.mMenuItem.getX();
    }
    
    @Override
    public float getY() {
        return this.mMenuItem.getY();
    }
    
    @Override
    public int getZIndex() {
        return this.mMenuItem.getZIndex();
    }
    
    @Override
    public boolean isCullingEnabled() {
        return this.mMenuItem.isCullingEnabled();
    }
    
    @Override
    public boolean isScaled() {
        return this.mMenuItem.isScaled();
    }
    
    @Override
    public boolean isUpdatePhysics() {
        return this.mMenuItem.isUpdatePhysics();
    }
    
    @Override
    public boolean onAreaTouched(final TouchEvent touchEvent, final float n, final float n2) {
        return ((Scene.ITouchArea)this.mMenuItem).onAreaTouched(touchEvent, n, n2);
    }
    
    @Override
    public void onDraw(final GL10 gl10, final Camera camera) {
        this.mMenuItem.onDraw(gl10, camera);
    }
    
    protected abstract void onMenuItemReset(final IMenuItem p0);
    
    protected abstract void onMenuItemSelected(final IMenuItem p0);
    
    protected abstract void onMenuItemUnselected(final IMenuItem p0);
    
    @Override
    public final void onSelected() {
        this.mMenuItem.onSelected();
        this.onMenuItemSelected(this.mMenuItem);
    }
    
    @Override
    public final void onUnselected() {
        this.mMenuItem.onUnselected();
        this.onMenuItemUnselected(this.mMenuItem);
    }
    
    @Override
    public void onUpdate(final float n) {
        this.mMenuItem.onUpdate(n);
    }
    
    @Override
    public boolean removeShapeModifier(final IModifier<IShape> modifier) {
        return this.mMenuItem.removeShapeModifier(modifier);
    }
    
    @Override
    public void reset() {
        this.mMenuItem.reset();
        this.onMenuItemReset(this.mMenuItem);
    }
    
    @Override
    public void setAcceleration(final float acceleration) {
        this.mMenuItem.setAcceleration(acceleration);
    }
    
    @Override
    public void setAcceleration(final float n, final float n2) {
        this.mMenuItem.setAcceleration(n, n2);
    }
    
    @Override
    public void setAccelerationX(final float accelerationX) {
        this.mMenuItem.setAccelerationX(accelerationX);
    }
    
    @Override
    public void setAccelerationY(final float accelerationY) {
        this.mMenuItem.setAccelerationY(accelerationY);
    }
    
    @Override
    public void setAlpha(final float alpha) {
        this.mMenuItem.setAlpha(alpha);
    }
    
    @Override
    public void setAngularVelocity(final float angularVelocity) {
        this.mMenuItem.setAngularVelocity(angularVelocity);
    }
    
    @Override
    public void setBasePosition() {
        this.mMenuItem.setBasePosition();
    }
    
    @Override
    public void setBlendFunction(final int n, final int n2) {
        this.mMenuItem.setBlendFunction(n, n2);
    }
    
    @Override
    public void setColor(final float n, final float n2, final float n3) {
        this.mMenuItem.setColor(n, n2, n3);
    }
    
    @Override
    public void setColor(final float n, final float n2, final float n3, final float n4) {
        this.mMenuItem.setColor(n, n2, n3, n4);
    }
    
    @Override
    public void setCullingEnabled(final boolean cullingEnabled) {
        this.mMenuItem.setCullingEnabled(cullingEnabled);
    }
    
    @Override
    public void setPosition(final float n, final float n2) {
        this.mMenuItem.setPosition(n, n2);
    }
    
    @Override
    public void setPosition(final IShape position) {
        this.mMenuItem.setPosition(position);
    }
    
    @Override
    public void setRotation(final float rotation) {
        this.mMenuItem.setRotation(rotation);
    }
    
    @Override
    public void setRotationCenter(final float n, final float n2) {
        this.mMenuItem.setRotationCenter(n, n2);
    }
    
    @Override
    public void setRotationCenterX(final float rotationCenterX) {
        this.mMenuItem.setRotationCenterX(rotationCenterX);
    }
    
    @Override
    public void setRotationCenterY(final float rotationCenterY) {
        this.mMenuItem.setRotationCenterY(rotationCenterY);
    }
    
    @Override
    public void setScale(final float scale) {
        this.mMenuItem.setScale(scale);
    }
    
    @Override
    public void setScale(final float n, final float n2) {
        this.mMenuItem.setScale(n, n2);
    }
    
    @Override
    public void setScaleCenter(final float n, final float n2) {
        this.mMenuItem.setScaleCenter(n, n2);
    }
    
    @Override
    public void setScaleCenterX(final float scaleCenterX) {
        this.mMenuItem.setScaleCenterX(scaleCenterX);
    }
    
    @Override
    public void setScaleCenterY(final float scaleCenterY) {
        this.mMenuItem.setScaleCenterY(scaleCenterY);
    }
    
    @Override
    public void setScaleX(final float scaleX) {
        this.mMenuItem.setScaleX(scaleX);
    }
    
    @Override
    public void setScaleY(final float scaleY) {
        this.mMenuItem.setScaleY(scaleY);
    }
    
    @Override
    public void setUpdatePhysics(final boolean updatePhysics) {
        this.mMenuItem.setUpdatePhysics(updatePhysics);
    }
    
    @Override
    public void setVelocity(final float velocity) {
        this.mMenuItem.setVelocity(velocity);
    }
    
    @Override
    public void setVelocity(final float n, final float n2) {
        this.mMenuItem.setVelocity(n, n2);
    }
    
    @Override
    public void setVelocityX(final float velocityX) {
        this.mMenuItem.setVelocityX(velocityX);
    }
    
    @Override
    public void setVelocityY(final float velocityY) {
        this.mMenuItem.setVelocityY(velocityY);
    }
    
    @Override
    public void setZIndex(final int zIndex) {
        this.mMenuItem.setZIndex(zIndex);
    }
}
