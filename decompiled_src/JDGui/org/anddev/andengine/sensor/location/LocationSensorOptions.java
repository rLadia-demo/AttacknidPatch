package org.anddev.andengine.sensor.location;

import android.location.Criteria;

public class LocationSensorOptions
  extends Criteria
{
  private static final long MINIMUMTRIGGERDISTANCE_DEFAULT = 10L;
  private static final long MINIMUMTRIGGERTIME_DEFAULT = 1000L;
  private boolean mEnabledOnly = true;
  private long mMinimumTriggerDistance = 10L;
  private long mMinimumTriggerTime = 1000L;
  
  public LocationSensorOptions() {}
  
  public LocationSensorOptions(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, int paramInt2, boolean paramBoolean4, boolean paramBoolean5, long paramLong1, long paramLong2)
  {
    this.mEnabledOnly = paramBoolean5;
    this.mMinimumTriggerTime = paramLong1;
    this.mMinimumTriggerDistance = paramLong2;
    setAccuracy(paramInt1);
    setAltitudeRequired(paramBoolean1);
    setBearingRequired(paramBoolean2);
    setCostAllowed(paramBoolean3);
    setPowerRequirement(paramInt2);
    setSpeedRequired(paramBoolean4);
  }
  
  public long getMinimumTriggerDistance()
  {
    return this.mMinimumTriggerDistance;
  }
  
  public long getMinimumTriggerTime()
  {
    return this.mMinimumTriggerTime;
  }
  
  public boolean isEnabledOnly()
  {
    return this.mEnabledOnly;
  }
  
  public void setEnabledOnly(boolean paramBoolean)
  {
    this.mEnabledOnly = paramBoolean;
  }
  
  public void setMinimumTriggerDistance(long paramLong)
  {
    this.mMinimumTriggerDistance = paramLong;
  }
  
  public void setMinimumTriggerTime(long paramLong)
  {
    this.mMinimumTriggerTime = paramLong;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.sensor.location.LocationSensorOptions
 * JD-Core Version:    0.7.0.1
 */