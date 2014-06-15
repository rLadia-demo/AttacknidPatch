/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene.menu.item.decorator;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class BaseMenuItemDecorator
implements IMenuItem {
    private final IMenuItem mMenuItem;

    public BaseMenuItemDecorator(IMenuItem iMenuItem) {
        this.mMenuItem = iMenuItem;
    }

    @Override
    public void accelerate(float f, float f2) {
        this.mMenuItem.accelerate(f, f2);
    }

    @Override
    public void addShapeModifier(IModifier<IShape> iModifier) {
        this.mMenuItem.addShapeModifier(iModifier);
    }

    @Override
    public void clearShapeModifiers() {
        this.mMenuItem.clearShapeModifiers();
    }

    @Override
    public boolean collidesWith(IShape iShape) {
        return this.mMenuItem.collidesWith(iShape);
    }

    @Override
    public boolean contains(float f, float f2) {
        return this.mMenuItem.contains(f, f2);
    }

    @Override
    public float[] convertLocalToSceneCoordinates(float f, float f2) {
        return this.mMenuItem.convertLocalToSceneCoordinates(f, f2);
    }

    @Override
    public float[] convertSceneToLocalCoordinates(float f, float f2) {
        return this.mMenuItem.convertSceneToLocalCoordinates(f, f2);
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
    public boolean onAreaTouched(TouchEvent touchEvent, float f, float f2) {
        return this.mMenuItem.onAreaTouched(touchEvent, f, f2);
    }

    @Override
    public void onDraw(GL10 gL10, Camera camera) {
        this.mMenuItem.onDraw(gL10, camera);
    }

    protected abstract void onMenuItemReset(IMenuItem var1);

    protected abstract void onMenuItemSelected(IMenuItem var1);

    protected abstract void onMenuItemUnselected(IMenuItem var1);

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
    public void onUpdate(float f) {
        this.mMenuItem.onUpdate(f);
    }

    @Override
    public boolean removeShapeModifier(IModifier<IShape> iModifier) {
        return this.mMenuItem.removeShapeModifier(iModifier);
    }

    @Override
    public void reset() {
        this.mMenuItem.reset();
        this.onMenuItemReset(this.mMenuItem);
    }

    @Override
    public void setAcceleration(float f) {
        this.mMenuItem.setAcceleration(f);
    }

    @Override
    public void setAcceleration(float f, float f2) {
        this.mMenuItem.setAcceleration(f, f2);
    }

    @Override
    public void setAccelerationX(float f) {
        this.mMenuItem.setAccelerationX(f);
    }

    @Override
    public void setAccelerationY(float f) {
        this.mMenuItem.setAccelerationY(f);
    }

    @Override
    public void setAlpha(float f) {
        this.mMenuItem.setAlpha(f);
    }

    @Override
    public void setAngularVelocity(float f) {
        this.mMenuItem.setAngularVelocity(f);
    }

    @Override
    public void setBasePosition() {
        this.mMenuItem.setBasePosition();
    }

    @Override
    public void setBlendFunction(int n, int n2) {
        this.mMenuItem.setBlendFunction(n, n2);
    }

    @Override
    public void setColor(float f, float f2, float f3) {
        this.mMenuItem.setColor(f, f2, f3);
    }

    @Override
    public void setColor(float f, float f2, float f3, float f4) {
        this.mMenuItem.setColor(f, f2, f3, f4);
    }

    @Override
    public void setCullingEnabled(boolean bl) {
        this.mMenuItem.setCullingEnabled(bl);
    }

    @Override
    public void setPosition(float f, float f2) {
        this.mMenuItem.setPosition(f, f2);
    }

    @Override
    public void setPosition(IShape iShape) {
        this.mMenuItem.setPosition(iShape);
    }

    @Override
    public void setRotation(float f) {
        this.mMenuItem.setRotation(f);
    }

    @Override
    public void setRotationCenter(float f, float f2) {
        this.mMenuItem.setRotationCenter(f, f2);
    }

    @Override
    public void setRotationCenterX(float f) {
        this.mMenuItem.setRotationCenterX(f);
    }

    @Override
    public void setRotationCenterY(float f) {
        this.mMenuItem.setRotationCenterY(f);
    }

    @Override
    public void setScale(float f) {
        this.mMenuItem.setScale(f);
    }

    @Override
    public void setScale(float f, float f2) {
        this.mMenuItem.setScale(f, f2);
    }

    @Override
    public void setScaleCenter(float f, float f2) {
        this.mMenuItem.setScaleCenter(f, f2);
    }

    @Override
    public void setScaleCenterX(float f) {
        this.mMenuItem.setScaleCenterX(f);
    }

    @Override
    public void setScaleCenterY(float f) {
        this.mMenuItem.setScaleCenterY(f);
    }

    @Override
    public void setScaleX(float f) {
        this.mMenuItem.setScaleX(f);
    }

    @Override
    public void setScaleY(float f) {
        this.mMenuItem.setScaleY(f);
    }

    @Override
    public void setUpdatePhysics(boolean bl) {
        this.mMenuItem.setUpdatePhysics(bl);
    }

    @Override
    public void setVelocity(float f) {
        this.mMenuItem.setVelocity(f);
    }

    @Override
    public void setVelocity(float f, float f2) {
        this.mMenuItem.setVelocity(f, f2);
    }

    @Override
    public void setVelocityX(float f) {
        this.mMenuItem.setVelocityX(f);
    }

    @Override
    public void setVelocityY(float f) {
        this.mMenuItem.setVelocityY(f);
    }

    @Override
    public void setZIndex(int n) {
        this.mMenuItem.setZIndex(n);
    }
}

