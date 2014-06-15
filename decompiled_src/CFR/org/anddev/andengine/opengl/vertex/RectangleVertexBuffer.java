/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public class RectangleVertexBuffer
extends VertexBuffer {
    private static final int FLOAT_TO_RAW_INT_BITS_ZERO = 0;
    public static final int VERTICES_PER_RECTANGLE = 4;

    static {
        RectangleVertexBuffer.FLOAT_TO_RAW_INT_BITS_ZERO = Float.floatToRawIntBits(0.0f);
    }

    public RectangleVertexBuffer(int n) {
        super(8, n);
    }

    public void update(float f, float f2) {
        synchronized (this) {
            int n = RectangleVertexBuffer.FLOAT_TO_RAW_INT_BITS_ZERO;
            int n2 = RectangleVertexBuffer.FLOAT_TO_RAW_INT_BITS_ZERO;
            int n3 = Float.floatToRawIntBits(f);
            int n4 = Float.floatToRawIntBits(f2);
            int[] arrn = this.mBufferData;
            arrn[0] = n;
            arrn[1] = n2;
            arrn[2] = n;
            arrn[3] = n4;
            arrn[4] = n3;
            arrn[5] = n2;
            arrn[6] = n3;
            arrn[7] = n4;
            FastFloatBuffer fastFloatBuffer = this.getFloatBuffer();
            fastFloatBuffer.position(0);
            fastFloatBuffer.put(arrn);
            fastFloatBuffer.position(0);
            super.setHardwareBufferNeedsUpdate();
            return;
        }
    }
}

