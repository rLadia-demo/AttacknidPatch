package org.anddev.andengine.entity.primitive;

import org.anddev.andengine.opengl.buffer.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.collision.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.opengl.vertex.*;
import org.anddev.andengine.opengl.util.*;

public class Line extends GLShape
{
    private static final float LINEWIDTH_DEFAULT = 1.0f;
    private final LineVertexBuffer mLineVertexBuffer;
    private float mLineWidth;
    protected float mX2;
    protected float mY2;
    
    public Line(final float n, final float n2, final float n3, final float n4) {
        this(n, n2, n3, n4, 1.0f);
    }
    
    public Line(final float n, final float n2, final float mx2, final float my2, final float mLineWidth) {
        super(n, n2);
        this.mX2 = mx2;
        this.mY2 = my2;
        this.mLineWidth = mLineWidth;
        this.mLineVertexBuffer = new LineVertexBuffer(35044);
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mLineVertexBuffer);
        this.updateVertexBuffer();
        final float width = this.getWidth();
        final float height = this.getHeight();
        this.mRotationCenterX = width * 0.5f;
        this.mRotationCenterY = height * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }
    
    @Override
    public boolean collidesWith(final IShape shape) {
        if (shape instanceof Line) {
            final Line line = (Line)shape;
            return LineCollisionChecker.checkLineCollision(this.mX, this.mY, this.mX2, this.mY2, line.mX, line.mY, line.mX2, line.mY2);
        }
        return false;
    }
    
    @Deprecated
    @Override
    public boolean contains(final float n, final float n2) {
        return false;
    }
    
    @Deprecated
    @Override
    public float[] convertLocalToSceneCoordinates(final float n, final float n2) {
        return null;
    }
    
    @Deprecated
    @Override
    public float[] convertSceneToLocalCoordinates(final float n, final float n2) {
        return null;
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        gl10.glDrawArrays(1, 0, 2);
    }
    
    @Override
    public float getBaseHeight() {
        return this.mY2 - this.mY;
    }
    
    @Override
    public float getBaseWidth() {
        return this.mX2 - this.mX;
    }
    
    @Override
    public float getHeight() {
        return this.mY2 - this.mY;
    }
    
    public float getLineWidth() {
        return this.mLineWidth;
    }
    
    @Override
    public float[] getSceneCenterCoordinates() {
        return ShapeCollisionChecker.convertLocalToSceneCoordinates(this, 0.5f * (this.mX + this.mX2), 0.5f * (this.mY + this.mY2));
    }
    
    public LineVertexBuffer getVertexBuffer() {
        return this.mLineVertexBuffer;
    }
    
    @Override
    public float getWidth() {
        return this.mX2 - this.mX;
    }
    
    @Deprecated
    @Override
    public float getX() {
        return super.getX();
    }
    
    public float getX1() {
        return super.getX();
    }
    
    public float getX2() {
        return this.mX2;
    }
    
    @Deprecated
    @Override
    public float getY() {
        return super.getY();
    }
    
    public float getY1() {
        return super.getY();
    }
    
    public float getY2() {
        return this.mY2;
    }
    
    @Override
    protected boolean isCulled(final Camera camera) {
        return false;
    }
    
    @Override
    protected void onInitDraw(final GL10 gl10) {
        super.onInitDraw(gl10);
        GLHelper.disableTextures(gl10);
        GLHelper.disableTexCoordArray(gl10);
        GLHelper.lineWidth(gl10, this.mLineWidth);
    }
    
    @Override
    protected void onUpdateVertexBuffer() {
        this.mLineVertexBuffer.update(0.0f, 0.0f, this.mX2 - this.mX, this.mY2 - this.mY);
    }
    
    public void setLineWidth(final float mLineWidth) {
        this.mLineWidth = mLineWidth;
    }
    
    @Deprecated
    @Override
    public void setPosition(final float n, final float n2) {
        final float n3 = this.mX - n;
        final float n4 = this.mY - n2;
        super.setPosition(n, n2);
        this.mX2 += n3;
        this.mY2 += n4;
    }
    
    public void setPosition(final float n, final float n2, final float mx2, final float my2) {
        this.mX2 = mx2;
        this.mY2 = my2;
        super.setPosition(n, n2);
        this.updateVertexBuffer();
    }
}
