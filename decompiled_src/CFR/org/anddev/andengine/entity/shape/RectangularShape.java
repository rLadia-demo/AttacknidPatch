/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.RectangularShapeCollisionChecker;
import org.anddev.andengine.collision.ShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.GLShape;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public abstract class RectangularShape
extends GLShape {
    protected float mBaseHeight;
    protected float mBaseWidth;
    protected float mHeight;
    private final VertexBuffer mVertexBuffer;
    protected float mWidth;

    public RectangularShape(float f, float f2, float f3, float f4, VertexBuffer vertexBuffer) {
        super(f, f2);
        this.mBaseWidth = f3;
        this.mBaseHeight = f4;
        this.mWidth = f3;
        this.mHeight = f4;
        this.mVertexBuffer = vertexBuffer;
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mVertexBuffer);
        this.mRotationCenterX = f3 * 0.5f;
        this.mRotationCenterY = f4 * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }

    @Override
    public boolean collidesWith(IShape iShape) {
        if (!(iShape instanceof RectangularShape)) return false;
        return RectangularShapeCollisionChecker.checkCollision(this, (RectangularShape)iShape);
    }

    @Override
    public boolean contains(float f, float f2) {
        return RectangularShapeCollisionChecker.checkContains(this, f, f2);
    }

    @Override
    public float[] convertLocalToSceneCoordinates(float f, float f2) {
        float[] arrf = ShapeCollisionChecker.convertLocalToSceneCoordinates(this, f, f2);
        arrf[0] = arrf[0] + this.mX;
        arrf[1] = arrf[1] + this.mY;
        return arrf;
    }

    @Override
    public float[] convertSceneToLocalCoordinates(float f, float f2) {
        float[] arrf = ShapeCollisionChecker.convertSceneToLocalCoordinates(this, f, f2);
        arrf[0] = arrf[0] - this.mX;
        arrf[1] = arrf[1] - this.mY;
        return arrf;
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        gL10.glDrawArrays(5, 0, 4);
    }

    @Override
    public float getBaseHeight() {
        return this.mBaseHeight;
    }

    @Override
    public float getBaseWidth() {
        return this.mBaseWidth;
    }

    @Override
    public float getHeight() {
        return this.mHeight;
    }

    @Override
    public float[] getSceneCenterCoordinates() {
        return this.convertLocalToSceneCoordinates(0.5f * this.mWidth, 0.5f * this.mHeight);
    }

    @Override
    public VertexBuffer getVertexBuffer() {
        return this.mVertexBuffer;
    }

    @Override
    public float getWidth() {
        return this.mWidth;
    }

    @Override
    protected boolean isCulled(Camera camera) {
        float f = this.mX;
        float f2 = this.mY;
        if (f > camera.getMaxX() || f2 > camera.getMaxY() || f + this.getWidth() < camera.getMinX() || f2 + this.getHeight() < camera.getMinY()) return true;
        return false;
    }

    @Override
    public void reset() {
        super.reset();
        this.setBaseSize();
        float f = this.getBaseWidth();
        float f2 = this.getBaseHeight();
        this.mRotationCenterX = f * 0.5f;
        this.mRotationCenterY = f2 * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }

    public void setBaseSize() {
        if (this.mWidth == this.mBaseWidth || this.mHeight == this.mBaseHeight) return;
        this.mWidth = this.mBaseWidth;
        this.mHeight = this.mBaseHeight;
        this.onPositionChanged();
        this.updateVertexBuffer();
    }

    public void setHeight(float f) {
        this.mHeight = f;
        this.updateVertexBuffer();
    }

    public void setSize(float f, float f2) {
        this.mWidth = f;
        this.mHeight = f2;
        this.updateVertexBuffer();
    }

    public void setWidth(float f) {
        this.mWidth = f;
        this.updateVertexBuffer();
    }
}

