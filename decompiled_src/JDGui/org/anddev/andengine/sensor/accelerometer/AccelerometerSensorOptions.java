package org.anddev.andengine.sensor.accelerometer;

import org.anddev.andengine.sensor.SensorDelay;

public class AccelerometerSensorOptions
{
  final SensorDelay mSensorDelay;
  
  public AccelerometerSensorOptions(SensorDelay paramSensorDelay)
  {
    this.mSensorDelay = paramSensorDelay;
  }
  
  public SensorDelay getSensorDelay()
  {
    return this.mSensorDelay;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.sensor.accelerometer.AccelerometerSensorOptions
 * JD-Core Version:    0.7.0.1
 */