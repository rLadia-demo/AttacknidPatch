package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.util.FastFloatBuffer;

public class RectangleVertexBuffer
  extends VertexBuffer
{
  private static final int FLOAT_TO_RAW_INT_BITS_ZERO = Float.floatToRawIntBits(0.0F);
  public static final int VERTICES_PER_RECTANGLE = 4;
  
  public RectangleVertexBuffer(int paramInt)
  {
    super(8, paramInt);
  }
  
  public void update(float paramFloat1, float paramFloat2)
  {
    try
    {
      int i = FLOAT_TO_RAW_INT_BITS_ZERO;
      int j = FLOAT_TO_RAW_INT_BITS_ZERO;
      int k = Float.floatToRawIntBits(paramFloat1);
      int m = Float.floatToRawIntBits(paramFloat2);
      int[] arrayOfInt = this.mBufferData;
      arrayOfInt[0] = i;
      arrayOfInt[1] = j;
      arrayOfInt[2] = i;
      arrayOfInt[3] = m;
      arrayOfInt[4] = k;
      arrayOfInt[5] = j;
      arrayOfInt[6] = k;
      arrayOfInt[7] = m;
      FastFloatBuffer localFastFloatBuffer = getFloatBuffer();
      localFastFloatBuffer.position(0);
      localFastFloatBuffer.put(arrayOfInt);
      localFastFloatBuffer.position(0);
      super.setHardwareBufferNeedsUpdate();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.vertex.RectangleVertexBuffer
 * JD-Core Version:    0.7.0.1
 */