package org.anddev.andengine.sensor;

import java.util.Arrays;

public class BaseSensorData
{
  protected int mAccuracy;
  protected final float[] mValues;
  
  public BaseSensorData(int paramInt)
  {
    this.mValues = new float[paramInt];
  }
  
  public int getAccuracy()
  {
    return this.mAccuracy;
  }
  
  public float[] getValues()
  {
    return this.mValues;
  }
  
  public void setAccuracy(int paramInt)
  {
    this.mAccuracy = paramInt;
  }
  
  public void setValues(float[] paramArrayOfFloat)
  {
    float[] arrayOfFloat = this.mValues;
    for (int i = -1 + paramArrayOfFloat.length;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfFloat[i] = paramArrayOfFloat[i];
    }
  }
  
  public String toString()
  {
    return "Values: " + Arrays.toString(this.mValues);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.sensor.BaseSensorData
 * JD-Core Version:    0.7.0.1
 */