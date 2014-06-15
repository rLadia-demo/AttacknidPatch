package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.util.*;

public abstract class BaseTextureRegionBuffer extends BufferObject
{
    private boolean mFlippedHorizontal;
    private boolean mFlippedVertical;
    protected final BaseTextureRegion mTextureRegion;
    
    public BaseTextureRegionBuffer(final BaseTextureRegion mTextureRegion, final int n) {
        super(8, n);
        this.mTextureRegion = mTextureRegion;
    }
    
    public BaseTextureRegion getTextureRegion() {
        return this.mTextureRegion;
    }
    
    protected abstract float getX1();
    
    protected abstract float getX2();
    
    protected abstract float getY1();
    
    protected abstract float getY2();
    
    public boolean isFlippedHorizontal() {
        return this.mFlippedHorizontal;
    }
    
    public boolean isFlippedVertical() {
        return this.mFlippedVertical;
    }
    
    public void setFlippedHorizontal(final boolean mFlippedHorizontal) {
        if (this.mFlippedHorizontal != mFlippedHorizontal) {
            this.mFlippedHorizontal = mFlippedHorizontal;
            this.update();
        }
    }
    
    public void setFlippedVertical(final boolean mFlippedVertical) {
        if (this.mFlippedVertical != mFlippedVertical) {
            this.mFlippedVertical = mFlippedVertical;
            this.update();
        }
    }
    
    public void update() {
        while (true) {
            while (true) {
                final int floatToRawIntBits;
                final int floatToRawIntBits2;
                final int floatToRawIntBits3;
                final int floatToRawIntBits4;
                final int[] mBufferData;
                Label_0208: {
                    Label_0157: {
                        synchronized (this) {
                            if (this.mTextureRegion.getTexture() != null) {
                                floatToRawIntBits = Float.floatToRawIntBits(this.getX1());
                                floatToRawIntBits2 = Float.floatToRawIntBits(this.getY1());
                                floatToRawIntBits3 = Float.floatToRawIntBits(this.getX2());
                                floatToRawIntBits4 = Float.floatToRawIntBits(this.getY2());
                                mBufferData = this.mBufferData;
                                if (!this.mFlippedVertical) {
                                    break Label_0208;
                                }
                                if (!this.mFlippedHorizontal) {
                                    break Label_0157;
                                }
                                mBufferData[0] = floatToRawIntBits3;
                                mBufferData[1] = floatToRawIntBits4;
                                mBufferData[2] = floatToRawIntBits3;
                                mBufferData[3] = floatToRawIntBits2;
                                mBufferData[4] = floatToRawIntBits;
                                mBufferData[5] = floatToRawIntBits4;
                                mBufferData[6] = floatToRawIntBits;
                                mBufferData[7] = floatToRawIntBits2;
                                final FastFloatBuffer floatBuffer = this.getFloatBuffer();
                                floatBuffer.position(0);
                                floatBuffer.put(mBufferData);
                                floatBuffer.position(0);
                                super.setHardwareBufferNeedsUpdate();
                            }
                            return;
                        }
                    }
                    mBufferData[0] = floatToRawIntBits;
                    mBufferData[1] = floatToRawIntBits4;
                    mBufferData[2] = floatToRawIntBits;
                    mBufferData[3] = floatToRawIntBits2;
                    mBufferData[4] = floatToRawIntBits3;
                    mBufferData[5] = floatToRawIntBits4;
                    mBufferData[6] = floatToRawIntBits3;
                    mBufferData[7] = floatToRawIntBits2;
                    continue;
                }
                if (this.mFlippedHorizontal) {
                    mBufferData[0] = floatToRawIntBits3;
                    mBufferData[1] = floatToRawIntBits2;
                    mBufferData[2] = floatToRawIntBits3;
                    mBufferData[3] = floatToRawIntBits4;
                    mBufferData[4] = floatToRawIntBits;
                    mBufferData[5] = floatToRawIntBits2;
                    mBufferData[6] = floatToRawIntBits;
                    mBufferData[7] = floatToRawIntBits4;
                    continue;
                }
                mBufferData[0] = floatToRawIntBits;
                mBufferData[1] = floatToRawIntBits2;
                mBufferData[2] = floatToRawIntBits;
                mBufferData[3] = floatToRawIntBits4;
                mBufferData[4] = floatToRawIntBits3;
                mBufferData[5] = floatToRawIntBits2;
                mBufferData[6] = floatToRawIntBits3;
                mBufferData[7] = floatToRawIntBits4;
                continue;
            }
        }
    }
}
