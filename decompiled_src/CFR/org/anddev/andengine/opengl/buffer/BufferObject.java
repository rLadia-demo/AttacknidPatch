/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.opengl.buffer;

import java.nio.ByteBuffer;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;

public abstract class BufferObject {
    private static final int[] HARDWAREBUFFERID_FETCHER = new int[1];
    protected final int[] mBufferData;
    private final int mDrawType;
    private final FastFloatBuffer mFloatBuffer;
    private int mHardwareBufferID = -1;
    private boolean mHardwareBufferNeedsUpdate = true;
    private boolean mLoadedToHardware;

    public BufferObject(int n, int n2) {
        this.mDrawType = n2;
        this.mBufferData = new int[n];
        this.mFloatBuffer = new FastFloatBuffer(n);
    }

    private void deleteBufferOnHardware(GL11 gL11) {
        GLHelper.deleteBuffer(gL11, this.mHardwareBufferID);
    }

    private int generateHardwareBufferID(GL11 gL11) {
        gL11.glGenBuffers(1, BufferObject.HARDWAREBUFFERID_FETCHER, 0);
        return BufferObject.HARDWAREBUFFERID_FETCHER[0];
    }

    public FastFloatBuffer getFloatBuffer() {
        return this.mFloatBuffer;
    }

    public int getHardwareBufferID() {
        return this.mHardwareBufferID;
    }

    public boolean isLoadedToHardware() {
        return this.mLoadedToHardware;
    }

    public void loadToHardware(GL11 gL11) {
        this.mHardwareBufferID = this.generateHardwareBufferID(gL11);
        this.mLoadedToHardware = true;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void selectOnHardware(GL11 gL11) {
        int n = this.mHardwareBufferID;
        if (n == -1) {
            return;
        }
        GLHelper.bindBuffer(gL11, n);
        if (!this.mHardwareBufferNeedsUpdate) return;
        this.mHardwareBufferNeedsUpdate = false;
        synchronized (this) {
            GLHelper.bufferData(gL11, this.mFloatBuffer.mByteBuffer, this.mDrawType);
            return;
        }
    }

    public void setHardwareBufferNeedsUpdate() {
        this.mHardwareBufferNeedsUpdate = true;
    }

    void setLoadedToHardware(boolean bl) {
        this.mLoadedToHardware = bl;
    }

    public void unloadFromHardware(GL11 gL11) {
        this.deleteBufferOnHardware(gL11);
        this.mHardwareBufferID = -1;
        this.mLoadedToHardware = false;
    }
}

