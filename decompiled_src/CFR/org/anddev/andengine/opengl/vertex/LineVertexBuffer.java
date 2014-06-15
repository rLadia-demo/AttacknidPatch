/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public class LineVertexBuffer
extends VertexBuffer {
    public static final int VERTICES_PER_LINE = 2;

    public LineVertexBuffer(int n) {
        super(4, n);
    }

    public void update(float f, float f2, float f3, float f4) {
        synchronized (this) {
            int[] arrn = this.mBufferData;
            arrn[0] = Float.floatToRawIntBits(f);
            arrn[1] = Float.floatToRawIntBits(f2);
            arrn[2] = Float.floatToRawIntBits(f3);
            arrn[3] = Float.floatToRawIntBits(f4);
            FastFloatBuffer fastFloatBuffer = this.getFloatBuffer();
            fastFloatBuffer.position(0);
            fastFloatBuffer.put(arrn);
            fastFloatBuffer.position(0);
            super.setHardwareBufferNeedsUpdate();
            return;
        }
    }
}

