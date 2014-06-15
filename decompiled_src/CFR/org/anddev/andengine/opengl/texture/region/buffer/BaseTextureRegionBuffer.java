/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.util.FastFloatBuffer;

public abstract class BaseTextureRegionBuffer
extends BufferObject {
    private boolean mFlippedHorizontal;
    private boolean mFlippedVertical;
    protected final BaseTextureRegion mTextureRegion;

    public BaseTextureRegionBuffer(BaseTextureRegion baseTextureRegion, int n) {
        super(8, n);
        this.mTextureRegion = baseTextureRegion;
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

    public void setFlippedHorizontal(boolean bl) {
        if (this.mFlippedHorizontal == bl) return;
        this.mFlippedHorizontal = bl;
        this.update();
    }

    public void setFlippedVertical(boolean bl) {
        if (this.mFlippedVertical == bl) return;
        this.mFlippedVertical = bl;
        this.update();
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void update() {
        synchronized (this) {
            Texture texture = this.mTextureRegion.getTexture();
            if (texture == null) return;
            int n = Float.floatToRawIntBits(this.getX1());
            int n2 = Float.floatToRawIntBits(this.getY1());
            int n3 = Float.floatToRawIntBits(this.getX2());
            int n4 = Float.floatToRawIntBits(this.getY2());
            int[] arrn = this.mBufferData;
            if (this.mFlippedVertical) {
                if (this.mFlippedHorizontal) {
                    arrn[0] = n3;
                    arrn[1] = n4;
                    arrn[2] = n3;
                    arrn[3] = n2;
                    arrn[4] = n;
                    arrn[5] = n4;
                    arrn[6] = n;
                    arrn[7] = n2;
                } else {
                    arrn[0] = n;
                    arrn[1] = n4;
                    arrn[2] = n;
                    arrn[3] = n2;
                    arrn[4] = n3;
                    arrn[5] = n4;
                    arrn[6] = n3;
                    arrn[7] = n2;
                }
            } else if (this.mFlippedHorizontal) {
                arrn[0] = n3;
                arrn[1] = n2;
                arrn[2] = n3;
                arrn[3] = n4;
                arrn[4] = n;
                arrn[5] = n2;
                arrn[6] = n;
                arrn[7] = n4;
            } else {
                arrn[0] = n;
                arrn[1] = n2;
                arrn[2] = n;
                arrn[3] = n4;
                arrn[4] = n3;
                arrn[5] = n2;
                arrn[6] = n3;
                arrn[7] = n4;
            }
            FastFloatBuffer fastFloatBuffer = this.getFloatBuffer();
            fastFloatBuffer.position(0);
            fastFloatBuffer.put(arrn);
            fastFloatBuffer.position(0);
            super.setHardwareBufferNeedsUpdate();
            return;
        }
    }
}

