package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.util.*;

public class RectangleVertexBuffer extends VertexBuffer
{
    private static final int FLOAT_TO_RAW_INT_BITS_ZERO = 0;
    public static final int VERTICES_PER_RECTANGLE = 4;
    
    static {
        FLOAT_TO_RAW_INT_BITS_ZERO = Float.floatToRawIntBits(0.0f);
    }
    
    public RectangleVertexBuffer(final int n) {
        super(8, n);
    }
    
    public void update(final float n, final float n2) {
        synchronized (this) {
            final int float_TO_RAW_INT_BITS_ZERO = RectangleVertexBuffer.FLOAT_TO_RAW_INT_BITS_ZERO;
            final int float_TO_RAW_INT_BITS_ZERO2 = RectangleVertexBuffer.FLOAT_TO_RAW_INT_BITS_ZERO;
            final int floatToRawIntBits = Float.floatToRawIntBits(n);
            final int floatToRawIntBits2 = Float.floatToRawIntBits(n2);
            final int[] mBufferData = this.mBufferData;
            mBufferData[0] = float_TO_RAW_INT_BITS_ZERO;
            mBufferData[1] = float_TO_RAW_INT_BITS_ZERO2;
            mBufferData[2] = float_TO_RAW_INT_BITS_ZERO;
            mBufferData[3] = floatToRawIntBits2;
            mBufferData[4] = floatToRawIntBits;
            mBufferData[5] = float_TO_RAW_INT_BITS_ZERO2;
            mBufferData[6] = floatToRawIntBits;
            mBufferData[7] = floatToRawIntBits2;
            final FastFloatBuffer floatBuffer = this.getFloatBuffer();
            floatBuffer.position(0);
            floatBuffer.put(mBufferData);
            floatBuffer.position(0);
            super.setHardwareBufferNeedsUpdate();
        }
    }
}
