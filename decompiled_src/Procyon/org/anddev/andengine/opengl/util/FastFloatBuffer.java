package org.anddev.andengine.opengl.util;

import java.lang.ref.*;
import java.nio.*;

public class FastFloatBuffer
{
    private static SoftReference<int[]> sWeakIntArray;
    public final ByteBuffer mByteBuffer;
    private final FloatBuffer mFloatBuffer;
    private final IntBuffer mIntBuffer;
    
    static {
        FastFloatBuffer.sWeakIntArray = new SoftReference<int[]>(new int[0]);
    }
    
    public FastFloatBuffer(final int n) {
        super();
        this.mByteBuffer = ByteBuffer.allocateDirect(n * 4).order(ByteOrder.nativeOrder());
        this.mFloatBuffer = this.mByteBuffer.asFloatBuffer();
        this.mIntBuffer = this.mByteBuffer.asIntBuffer();
    }
    
    public static int[] convert(final float... array) {
        final int length = array.length;
        final int[] array2 = new int[length];
        for (int i = 0; i < length; ++i) {
            array2[i] = Float.floatToRawIntBits(array[i]);
        }
        return array2;
    }
    
    public int capacity() {
        return this.mFloatBuffer.capacity();
    }
    
    public void clear() {
        this.mByteBuffer.clear();
        this.mFloatBuffer.clear();
        this.mIntBuffer.clear();
    }
    
    public void flip() {
        this.mByteBuffer.flip();
        this.mFloatBuffer.flip();
        this.mIntBuffer.flip();
    }
    
    public int limit() {
        return this.mFloatBuffer.limit();
    }
    
    public int position() {
        return this.mFloatBuffer.position();
    }
    
    public void position(final int n) {
        this.mByteBuffer.position(n * 4);
        this.mFloatBuffer.position(n);
        this.mIntBuffer.position(n);
    }
    
    public void put(final float n) {
        final ByteBuffer mByteBuffer = this.mByteBuffer;
        final IntBuffer mIntBuffer = this.mIntBuffer;
        mByteBuffer.position(4 + mByteBuffer.position());
        this.mFloatBuffer.put(n);
        mIntBuffer.position(1 + mIntBuffer.position());
    }
    
    public void put(final FastFloatBuffer fastFloatBuffer) {
        final ByteBuffer mByteBuffer = this.mByteBuffer;
        mByteBuffer.put(fastFloatBuffer.mByteBuffer);
        this.mFloatBuffer.position(mByteBuffer.position() >> 2);
        this.mIntBuffer.position(mByteBuffer.position() >> 2);
    }
    
    public void put(final float[] array) {
        final int length = array.length;
        int[] array2 = FastFloatBuffer.sWeakIntArray.get();
        if (array2 == null || array2.length < length) {
            array2 = new int[length];
            FastFloatBuffer.sWeakIntArray = new SoftReference<int[]>(array2);
        }
        for (int i = 0; i < length; ++i) {
            array2[i] = Float.floatToRawIntBits(array[i]);
        }
        final ByteBuffer mByteBuffer = this.mByteBuffer;
        mByteBuffer.position(mByteBuffer.position() + length * 4);
        final FloatBuffer mFloatBuffer = this.mFloatBuffer;
        mFloatBuffer.position(length + mFloatBuffer.position());
        this.mIntBuffer.put(array2, 0, length);
    }
    
    public void put(final int[] array) {
        final ByteBuffer mByteBuffer = this.mByteBuffer;
        mByteBuffer.position(mByteBuffer.position() + 4 * array.length);
        final FloatBuffer mFloatBuffer = this.mFloatBuffer;
        mFloatBuffer.position(mFloatBuffer.position() + array.length);
        this.mIntBuffer.put(array, 0, array.length);
    }
    
    public int remaining() {
        return this.mFloatBuffer.remaining();
    }
    
    public FloatBuffer slice() {
        return this.mFloatBuffer.slice();
    }
}
