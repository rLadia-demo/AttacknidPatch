package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.region.buffer.*;
import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.opengl.util.*;
import javax.microedition.khronos.opengles.*;

public abstract class BaseTextureRegion
{
    protected int mHeight;
    protected final Texture mTexture;
    protected int mTexturePositionX;
    protected int mTexturePositionY;
    protected final BaseTextureRegionBuffer mTextureRegionBuffer;
    protected int mWidth;
    
    public BaseTextureRegion(final Texture mTexture, final int mTexturePositionX, final int mTexturePositionY, final int mWidth, final int mHeight) {
        super();
        this.mTexture = mTexture;
        this.mTexturePositionX = mTexturePositionX;
        this.mTexturePositionY = mTexturePositionY;
        this.mWidth = mWidth;
        this.mHeight = mHeight;
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
    
    public void onApply(final GL10 gl10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            final GL11 gl2 = (GL11)gl10;
            this.mTextureRegionBuffer.selectOnHardware(gl2);
            GLHelper.bindTexture(gl10, this.mTexture.getHardwareTextureID());
            GLHelper.texCoordZeroPointer(gl2);
            return;
        }
        GLHelper.bindTexture(gl10, this.mTexture.getHardwareTextureID());
        GLHelper.texCoordPointer(gl10, this.mTextureRegionBuffer.getFloatBuffer());
    }
    
    protected abstract BaseTextureRegionBuffer onCreateTextureRegionBuffer();
    
    public void setFlippedHorizontal(final boolean flippedHorizontal) {
        this.mTextureRegionBuffer.setFlippedHorizontal(flippedHorizontal);
    }
    
    public void setFlippedVertical(final boolean flippedVertical) {
        this.mTextureRegionBuffer.setFlippedVertical(flippedVertical);
    }
    
    public void setHeight(final int mHeight) {
        this.mHeight = mHeight;
        this.updateTextureRegionBuffer();
    }
    
    public void setTexturePosition(final int mTexturePositionX, final int mTexturePositionY) {
        this.mTexturePositionX = mTexturePositionX;
        this.mTexturePositionY = mTexturePositionY;
        this.updateTextureRegionBuffer();
    }
    
    public void setWidth(final int mWidth) {
        this.mWidth = mWidth;
        this.updateTextureRegionBuffer();
    }
    
    protected void updateTextureRegionBuffer() {
        this.mTextureRegionBuffer.update();
    }
}
