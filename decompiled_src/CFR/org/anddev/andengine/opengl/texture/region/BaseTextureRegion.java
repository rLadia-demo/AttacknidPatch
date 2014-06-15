/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.opengl.texture.region;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;

public abstract class BaseTextureRegion {
    protected int mHeight;
    protected final Texture mTexture;
    protected int mTexturePositionX;
    protected int mTexturePositionY;
    protected final BaseTextureRegionBuffer mTextureRegionBuffer;
    protected int mWidth;

    public BaseTextureRegion(Texture texture, int n, int n2, int n3, int n4) {
        this.mTexture = texture;
        this.mTexturePositionX = n;
        this.mTexturePositionY = n2;
        this.mWidth = n3;
        this.mHeight = n4;
        this.mTextureRegionBuffer = this.onCreateTextureRegionBuffer();
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mTextureRegionBuffer);
        this.initTextureBuffer();
    }

    public int getHeight() {
        return this.mHeight;
    }

    public Texture getTexture() {
        return this.mTexture;
    }

    public BaseTextureRegionBuffer getTextureBuffer() {
        return this.mTextureRegionBuffer;
    }

    public int getTexturePositionX() {
        return this.mTexturePositionX;
    }

    public int getTexturePositionY() {
        return this.mTexturePositionY;
    }

    public int getWidth() {
        return this.mWidth;
    }

    protected void initTextureBuffer() {
        this.updateTextureRegionBuffer();
    }

    public boolean isFlippedHorizontal() {
        return this.mTextureRegionBuffer.isFlippedHorizontal();
    }

    public boolean isFlippedVertical() {
        return this.mTextureRegionBuffer.isFlippedVertical();
    }

    public void onApply(GL10 gL10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            GL11 gL11 = (GL11)gL10;
            this.mTextureRegionBuffer.selectOnHardware(gL11);
            GLHelper.bindTexture(gL10, this.mTexture.getHardwareTextureID());
            GLHelper.texCoordZeroPointer(gL11);
            return;
        }
        GLHelper.bindTexture(gL10, this.mTexture.getHardwareTextureID());
        GLHelper.texCoordPointer(gL10, this.mTextureRegionBuffer.getFloatBuffer());
    }

    protected abstract BaseTextureRegionBuffer onCreateTextureRegionBuffer();

    public void setFlippedHorizontal(boolean bl) {
        this.mTextureRegionBuffer.setFlippedHorizontal(bl);
    }

    public void setFlippedVertical(boolean bl) {
        this.mTextureRegionBuffer.setFlippedVertical(bl);
    }

    public void setHeight(int n) {
        this.mHeight = n;
        this.updateTextureRegionBuffer();
    }

    public void setTexturePosition(int n, int n2) {
        this.mTexturePositionX = n;
        this.mTexturePositionY = n2;
        this.updateTextureRegionBuffer();
    }

    public void setWidth(int n) {
        this.mWidth = n;
        this.updateTextureRegionBuffer();
    }

    protected void updateTextureRegionBuffer() {
        this.mTextureRegionBuffer.update();
    }
}

