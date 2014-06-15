/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.util;

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class FastFloatBuffer {
    private static SoftReference<int[]> sWeakIntArray = new SoftReference<int[]>(new int[0]);
    public final ByteBuffer mByteBuffer;
    private final FloatBuffer mFloatBuffer;
    private final IntBuffer mIntBuffer;

    public FastFloatBuffer(int n) {
        this.mByteBuffer = ByteBuffer.allocateDirect(n * 4).order(ByteOrder.nativeOrder());
        this.mFloatBuffer = this.mByteBuffer.asFloatBuffer();
        this.mIntBuffer = this.mByteBuffer.asIntBuffer();
    }

    public static /* varargs */ int[] convert(float ... arrf) {
        int n = arrf.length;
        int[] arrn = new int[n];
        int n2 = 0;
        while (n2 < n) {
            arrn[n2] = Float.floatToRawIntBits(arrf[n2]);
            ++n2;
        }
        return arrn;
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

    public void position(int n) {
        this.mByteBuffer.position(n * 4);
        this.mFloatBuffer.position(n);
        this.mIntBuffer.position(n);
    }

    public void put(float f) {
        ByteBuffer byteBuffer = this.mByteBuffer;
        IntBuffer intBuffer = this.mIntBuffer;
        byteBuffer.position(4 + byteBuffer.position());
        this.mFloatBuffer.put(f);
        intBuffer.position(1 + intBuffer.position());
    }

    public void put(FastFloatBuffer fastFloatBuffer) {
        ByteBuffer byteBuffer = this.mByteBuffer;
        byteBuffer.put(fastFloatBuffer.mByteBuffer);
        this.mFloatBuffer.position(byteBuffer.position() >> 2);
        this.mIntBuffer.position(byteBuffer.position() >> 2);
    }

    public void put(float[] arrf) {
        int n = arrf.length;
        int[] arrn = FastFloatBuffer.sWeakIntArray.get();
        if (arrn == null || arrn.length < n) {
            arrn = new int[n];
            FastFloatBuffer.sWeakIntArray = new SoftReference<int[]>(arrn);
        }
        int n2 = 0;
        do {
            if (n2 >= n) {
                ByteBuffer byteBuffer = this.mByteBuffer;
                byteBuffer.position(byteBuffer.position() + n * 4);
                FloatBuffer floatBuffer = this.mFloatBuffer;
                floatBuffer.position(n + floatBuffer.position());
                this.mIntBuffer.put(arrn, 0, n);
                return;
            }
            arrn[n2] = Float.floatToRawIntBits(arrf[n2]);
            ++n2;
        } while (true);
    }

    public void put(int[] arrn) {
        ByteBuffer byteBuffer = this.mByteBuffer;
        byteBuffer.position(byteBuffer.position() + 4 * arrn.length);
        FloatBuffer floatBuffer = this.mFloatBuffer;
        floatBuffer.position(floatBuffer.position() + arrn.length);
        this.mIntBuffer.put(arrn, 0, arrn.length);
    }

    public int remaining() {
        return this.mFloatBuffer.remaining();
    }

    public FloatBuffer slice() {
        return this.mFloatBuffer.slice();
    }
}

