package org.anddev.andengine.sensor.accelerometer;

import java.util.Arrays;
import org.anddev.andengine.sensor.BaseSensorData;

public class AccelerometerData
  extends BaseSensorData
{
  public AccelerometerData()
  {
    super(3);
  }
  
  public float getX()
  {
    return this.mValues[0];
  }
  
  public float getY()
  {
    return this.mValues[1];
  }
  
  public float getZ()
  {
    return this.mValues[2];
  }
  
  public void setX(float paramFloat)
  {
    this.mValues[0] = paramFloat;
  }
  
  public void setY(float paramFloat)
  {
    this.mValues[1] = paramFloat;
  }
  
  public void setZ(float paramFloat)
  {
    this.mValues[2] = paramFloat;
  }
  
  public String toString()
  {
    return "Accelerometer: " + Arrays.toString(this.mValues);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.sensor.accelerometer.AccelerometerData
 * JD-Core Version:    0.7.0.1
 */