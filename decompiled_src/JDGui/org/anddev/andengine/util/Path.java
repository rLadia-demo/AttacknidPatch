package org.anddev.andengine.util;

import android.util.FloatMath;

public class Path
{
  private final float[] mCoordinatesX;
  private final float[] mCoordinatesY;
  private int mIndex;
  private float mLength;
  private boolean mLengthChanged = false;
  
  public Path(int paramInt)
  {
    this.mCoordinatesX = new float[paramInt];
    this.mCoordinatesY = new float[paramInt];
    this.mIndex = 0;
    this.mLengthChanged = false;
  }
  
  public Path(Path paramPath)
  {
    int i = paramPath.getSize();
    this.mCoordinatesX = new float[i];
    this.mCoordinatesY = new float[i];
    System.arraycopy(paramPath.mCoordinatesX, 0, this.mCoordinatesX, 0, i);
    System.arraycopy(paramPath.mCoordinatesY, 0, this.mCoordinatesY, 0, i);
    this.mIndex = paramPath.mIndex;
    this.mLengthChanged = paramPath.mLengthChanged;
    this.mLength = paramPath.mLength;
  }
  
  public Path(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
    throws IllegalArgumentException
  {
    if (paramArrayOfFloat1.length != paramArrayOfFloat2.length) {
      throw new IllegalArgumentException("Coordinate-Arrays must have the same length.");
    }
    this.mCoordinatesX = paramArrayOfFloat1;
    this.mCoordinatesY = paramArrayOfFloat2;
    this.mIndex = paramArrayOfFloat1.length;
    this.mLengthChanged = true;
  }
  
  private void updateLength()
  {
    float f = 0.0F;
    for (int i = -2 + this.mIndex;; i--)
    {
      if (i < 0)
      {
        this.mLength = f;
        return;
      }
      f += getSegmentLength(i);
    }
  }
  
  public Path clone()
  {
    return new Path(this);
  }
  
  public float[] getCoordinatesX()
  {
    return this.mCoordinatesX;
  }
  
  public float[] getCoordinatesY()
  {
    return this.mCoordinatesY;
  }
  
  public float getLength()
  {
    if (this.mLengthChanged) {
      updateLength();
    }
    return this.mLength;
  }
  
  public float getSegmentLength(int paramInt)
  {
    float[] arrayOfFloat1 = this.mCoordinatesX;
    float[] arrayOfFloat2 = this.mCoordinatesY;
    int i = paramInt + 1;
    float f1 = arrayOfFloat1[paramInt] - arrayOfFloat1[i];
    float f2 = arrayOfFloat2[paramInt] - arrayOfFloat2[i];
    return FloatMath.sqrt(f1 * f1 + f2 * f2);
  }
  
  public int getSize()
  {
    return this.mCoordinatesX.length;
  }
  
  public Path to(float paramFloat1, float paramFloat2)
  {
    this.mCoordinatesX[this.mIndex] = paramFloat1;
    this.mCoordinatesY[this.mIndex] = paramFloat2;
    this.mIndex = (1 + this.mIndex);
    this.mLengthChanged = true;
    return this;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.Path
 * JD-Core Version:    0.7.0.1
 */