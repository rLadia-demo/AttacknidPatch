/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.primitive;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.LineCollisionChecker;
import org.anddev.andengine.collision.ShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.GLShape;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.LineVertexBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public class Line
extends GLShape {
    private static final float LINEWIDTH_DEFAULT = 1.0f;
    private final LineVertexBuffer mLineVertexBuffer;
    private float mLineWidth;
    protected float mX2;
    protected float mY2;

    public Line(float f, float f2, float f3, float f4) {
        this(f, f2, f3, f4, 1.0f);
    }

    public Line(float f, float f2, float f3, float f4, float f5) {
        super(f, f2);
        this.mX2 = f3;
        this.mY2 = f4;
        this.mLineWidth = f5;
        this.mLineVertexBuffer = new LineVertexBuffer(35044);
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mLineVertexBuffer);
        this.updateVertexBuffer();
        float f6 = this.getWidth();
        float f7 = this.getHeight();
        this.mRotationCenterX = f6 * 0.5f;
        this.mRotationCenterY = f7 * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
    }

    @Override
    public boolean collidesWith(IShape iShape) {
        if (!(iShape instanceof Line)) return false;
        Line line = (Line)iShape;
        return LineCollisionChecker.checkLineCollision(this.mX, this.mY, this.mX2, this.mY2, line.mX, line.mY, line.mX2, line.mY2);
    }

    @Deprecated
    @Override
    public boolean contains(float f2, float f2) {
        return false;
    }

    @Deprecated
    @Override
    public float[] convertLocalToSceneCoordinates(float f2, float f2) {
        return null;
    }

    @Deprecated
    @Override
    public float[] convertSceneToLocalCoordinates(float f2, float f2) {
        return null;
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        gL10.glDrawArrays(1, 0, 2);
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

    @Override
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
    protected boolean isCulled(Camera camera) {
        return false;
    }

    @Override
    protected void onInitDraw(GL10 gL10) {
        super.onInitDraw(gL10);
        GLHelper.disableTextures(gL10);
        GLHelper.disableTexCoordArray(gL10);
        GLHelper.lineWidth(gL10, this.mLineWidth);
    }

    @Override
    protected void onUpdateVertexBuffer() {
        this.mLineVertexBuffer.update(0.0f, 0.0f, this.mX2 - this.mX, this.mY2 - this.mY);
    }

    public void setLineWidth(float f) {
        this.mLineWidth = f;
    }

    @Deprecated
    @Override
    public void setPosition(float f, float f2) {
        float f3 = this.mX - f;
        float f4 = this.mY - f2;
        super.setPosition(f, f2);
        this.mX2 = f3 + this.mX2;
        this.mY2 = f4 + this.mY2;
    }

    public void setPosition(float f, float f2, float f3, float f4) {
        this.mX2 = f3;
        this.mY2 = f4;
        super.setPosition(f, f2);
        this.updateVertexBuffer();
    }
}

