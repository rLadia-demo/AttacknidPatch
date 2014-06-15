package org.anddev.andengine.opengl.util;

import java.lang.ref.SoftReference;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class FastFloatBuffer
{
  private static SoftReference<int[]> sWeakIntArray = new SoftReference(new int[0]);
  public final ByteBuffer mByteBuffer;
  private final FloatBuffer mFloatBuffer;
  private final IntBuffer mIntBuffer;
  
  public FastFloatBuffer(int paramInt)
  {
    this.mByteBuffer = ByteBuffer.allocateDirect(paramInt * 4).order(ByteOrder.nativeOrder());
    this.mFloatBuffer = this.mByteBuffer.asFloatBuffer();
    this.mIntBuffer = this.mByteBuffer.asIntBuffer();
  }
  
  public static int[] convert(float... paramVarArgs)
  {
    int i = paramVarArgs.length;
    int[] arrayOfInt = new int[i];
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return arrayOfInt;
      }
      arrayOfInt[j] = Float.floatToRawIntBits(paramVarArgs[j]);
    }
  }
  
  public int capacity()
  {
    return this.mFloatBuffer.capacity();
  }
  
  public void clear()
  {
    this.mByteBuffer.clear();
    this.mFloatBuffer.clear();
    this.mIntBuffer.clear();
  }
  
  public void flip()
  {
    this.mByteBuffer.flip();
    this.mFloatBuffer.flip();
    this.mIntBuffer.flip();
  }
  
  public int limit()
  {
    return this.mFloatBuffer.limit();
  }
  
  public int position()
  {
    return this.mFloatBuffer.position();
  }
  
  public void position(int paramInt)
  {
    this.mByteBuffer.position(paramInt * 4);
    this.mFloatBuffer.position(paramInt);
    this.mIntBuffer.position(paramInt);
  }
  
  public void put(float paramFloat)
  {
    ByteBuffer localByteBuffer = this.mByteBuffer;
    IntBuffer localIntBuffer = this.mIntBuffer;
    localByteBuffer.position(4 + localByteBuffer.position());
    this.mFloatBuffer.put(paramFloat);
    localIntBuffer.position(1 + localIntBuffer.position());
  }
  
  public void put(FastFloatBuffer paramFastFloatBuffer)
  {
    ByteBuffer localByteBuffer = this.mByteBuffer;
    localByteBuffer.put(paramFastFloatBuffer.mByteBuffer);
    this.mFloatBuffer.position(localByteBuffer.position() >> 2);
    this.mIntBuffer.position(localByteBuffer.position() >> 2);
  }
  
  public void put(float[] paramArrayOfFloat)
  {
    int i = paramArrayOfFloat.length;
    int[] arrayOfInt = (int[])sWeakIntArray.get();
    if ((arrayOfInt == null) || (arrayOfInt.length < i))
    {
      arrayOfInt = new int[i];
      sWeakIntArray = new SoftReference(arrayOfInt);
    }
    for (int j = 0;; j++)
    {
      if (j >= i)
      {
        ByteBuffer localByteBuffer = this.mByteBuffer;
        localByteBuffer.position(localByteBuffer.position() + i * 4);
        FloatBuffer localFloatBuffer = this.mFloatBuffer;
        localFloatBuffer.position(i + localFloatBuffer.position());
        this.mIntBuffer.put(arrayOfInt, 0, i);
        return;
      }
      arrayOfInt[j] = Float.floatToRawIntBits(paramArrayOfFloat[j]);
    }
  }
  
  public void put(int[] paramArrayOfInt)
  {
    ByteBuffer localByteBuffer = this.mByteBuffer;
    localByteBuffer.position(localByteBuffer.position() + 4 * paramArrayOfInt.length);
    FloatBuffer localFloatBuffer = this.mFloatBuffer;
    localFloatBuffer.position(localFloatBuffer.position() + paramArrayOfInt.length);
    this.mIntBuffer.put(paramArrayOfInt, 0, paramArrayOfInt.length);
  }
  
  public int remaining()
  {
    return this.mFloatBuffer.remaining();
  }
  
  public FloatBuffer slice()
  {
    return this.mFloatBuffer.slice();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.util.FastFloatBuffer
 * JD-Core Version:    0.7.0.1
 */