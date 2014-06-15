package org.anddev.andengine.opengl.buffer;

import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.opengl.util.*;

public abstract class BufferObject
{
    private static final int[] HARDWAREBUFFERID_FETCHER;
    protected final int[] mBufferData;
    private final int mDrawType;
    private final FastFloatBuffer mFloatBuffer;
    private int mHardwareBufferID;
    private boolean mHardwareBufferNeedsUpdate;
    private boolean mLoadedToHardware;
    
    static {
        HARDWAREBUFFERID_FETCHER = new int[1];
    }
    
    public BufferObject(final int n, final int mDrawType) {
        super();
        this.mHardwareBufferID = -1;
        this.mHardwareBufferNeedsUpdate = true;
        this.mDrawType = mDrawType;
        this.mBufferData = new int[n];
        this.mFloatBuffer = new FastFloatBuffer(n);
    }
    
    private void deleteBufferOnHardware(final GL11 gl11) {
        GLHelper.deleteBuffer(gl11, this.mHardwareBufferID);
    }
    
    private int generateHardwareBufferID(final GL11 gl11) {
        gl11.glGenBuffers(1, BufferObject.HARDWAREBUFFERID_FETCHER, 0);
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
    
    public void loadToHardware(final GL11 gl11) {
        this.mHardwareBufferID = this.generateHardwareBufferID(gl11);
        this.mLoadedToHardware = true;
    }
    
    public void selectOnHardware(final GL11 gl11) {
        final int mHardwareBufferID = this.mHardwareBufferID;
        if (mHardwareBufferID != -1) {
            GLHelper.bindBuffer(gl11, mHardwareBufferID);
            if (this.mHardwareBufferNeedsUpdate) {
                this.mHardwareBufferNeedsUpdate = false;
                synchronized (this) {
                    GLHelper.bufferData(gl11, this.mFloatBuffer.mByteBuffer, this.mDrawType);
                }
            }
        }
    }
    
    public void setHardwareBufferNeedsUpdate() {
        this.mHardwareBufferNeedsUpdate = true;
    }
    
    void setLoadedToHardware(final boolean mLoadedToHardware) {
        this.mLoadedToHardware = mLoadedToHardware;
    }
    
    public void unloadFromHardware(final GL11 gl11) {
        this.deleteBufferOnHardware(gl11);
        this.mHardwareBufferID = -1;
        this.mLoadedToHardware = false;
    }
}
