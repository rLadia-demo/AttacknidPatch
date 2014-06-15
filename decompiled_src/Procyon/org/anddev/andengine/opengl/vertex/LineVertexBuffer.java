package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.util.*;

public class LineVertexBuffer extends VertexBuffer
{
    public static final int VERTICES_PER_LINE = 2;
    
    public LineVertexBuffer(final int n) {
        super(4, n);
    }
    
    public void update(final float n, final float n2, final float n3, final float n4) {
        synchronized (this) {
            final int[] mBufferData = this.mBufferData;
            mBufferData[0] = Float.floatToRawIntBits(n);
            mBufferData[1] = Float.floatToRawIntBits(n2);
            mBufferData[2] = Float.floatToRawIntBits(n3);
            mBufferData[3] = Float.floatToRawIntBits(n4);
            final FastFloatBuffer floatBuffer = this.getFloatBuffer();
            floatBuffer.position(0);
            floatBuffer.put(mBufferData);
            floatBuffer.position(0);
            super.setHardwareBufferNeedsUpdate();
        }
    }
}
