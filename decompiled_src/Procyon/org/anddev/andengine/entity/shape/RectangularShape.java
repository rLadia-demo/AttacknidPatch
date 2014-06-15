package org.anddev.andengine.entity.shape;

import org.anddev.andengine.opengl.vertex.*;
import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.collision.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public abstract class RectangularShape extends GLShape
{
    protected float mBaseHeight;
    protected float mBaseWidth;
    protected float mHeight;
    private final VertexBuffer mVertexBuffer;
    protected float mWidth;
    
    public RectangularShape(final float n, final float n2, final float n3, final float n4, final VertexBuffer mVertexBuffer) {
        super(n, n2);
        this.mBaseWidth = n3;
        this.mBaseHeight = n4;
        this.mWidth = n3;
        this.mHeight = n4;
        this.mVertexBuffer = mVertexBuffer;
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mVertexBuffer);
        this.mRotationCenterX = n3 * 0.5f;
        this.mRotationCenterY = n4 * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }
    
    @Override
    public boolean collidesWith(final IShape shape) {
        return shape instanceof RectangularShape && RectangularShapeCollisionChecker.checkCollision(this, (RectangularShape)shape);
    }
    
    @Override
    public boolean contains(final float n, final float n2) {
        return RectangularShapeCollisionChecker.checkContains(this, n, n2);
    }
    
    @Override
    public float[] convertLocalToSceneCoordinates(final float n, final float n2) {
        final float[] convertLocalToSceneCoordinates = ShapeCollisionChecker.convertLocalToSceneCoordinates(this, n, n2);
        convertLocalToSceneCoordinates[0] += this.mX;
        convertLocalToSceneCoordinates[1] += this.mY;
        return convertLocalToSceneCoordinates;
    }
    
    @Override
    public float[] convertSceneToLocalCoordinates(final float n, final float n2) {
        final float[] convertSceneToLocalCoordinates = ShapeCollisionChecker.convertSceneToLocalCoordinates(this, n, n2);
        convertSceneToLocalCoordinates[0] -= this.mX;
        convertSceneToLocalCoordinates[1] -= this.mY;
        return convertSceneToLocalCoordinates;
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        gl10.glDrawArrays(5, 0, 4);
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
    
    public VertexBuffer getVertexBuffer() {
        return this.mVertexBuffer;
    }
    
    @Override
    public float getWidth() {
        return this.mWidth;
    }
    
    @Override
    protected boolean isCulled(final Camera camera) {
        final float mx = this.mX;
        final float my = this.mY;
        return mx > camera.getMaxX() || my > camera.getMaxY() || mx + this.getWidth() < camera.getMinX() || my + this.getHeight() < camera.getMinY();
    }
    
    @Override
    public void reset() {
        super.reset();
        this.setBaseSize();
        final float baseWidth = this.getBaseWidth();
        final float baseHeight = this.getBaseHeight();
        this.mRotationCenterX = baseWidth * 0.5f;
        this.mRotationCenterY = baseHeight * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }
    
    public void setBaseSize() {
        if (this.mWidth != this.mBaseWidth && this.mHeight != this.mBaseHeight) {
            this.mWidth = this.mBaseWidth;
            this.mHeight = this.mBaseHeight;
            this.onPositionChanged();
            this.updateVertexBuffer();
        }
    }
    
    public void setHeight(final float mHeight) {
        this.mHeight = mHeight;
        this.updateVertexBuffer();
    }
    
    public void setSize(final float mWidth, final float mHeight) {
        this.mWidth = mWidth;
        this.mHeight = mHeight;
        this.updateVertexBuffer();
    }
    
    public void setWidth(final float mWidth) {
        this.mWidth = mWidth;
        this.updateVertexBuffer();
    }
}
