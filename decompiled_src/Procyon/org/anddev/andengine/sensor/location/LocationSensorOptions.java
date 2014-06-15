package org.anddev.andengine.sensor.location;

import android.location.*;

public class LocationSensorOptions extends Criteria
{
    private static final long MINIMUMTRIGGERDISTANCE_DEFAULT = 10L;
    private static final long MINIMUMTRIGGERTIME_DEFAULT = 1000L;
    private boolean mEnabledOnly;
    private long mMinimumTriggerDistance;
    private long mMinimumTriggerTime;
    
    public LocationSensorOptions() {
        super();
        this.mEnabledOnly = true;
        this.mMinimumTriggerTime = 1000L;
        this.mMinimumTriggerDistance = 10L;
    }
    
    public LocationSensorOptions(final int accuracy, final boolean altitudeRequired, final boolean bearingRequired, final boolean costAllowed, final int powerRequirement, final boolean speedRequired, final boolean mEnabledOnly, final long mMinimumTriggerTime, final long mMinimumTriggerDistance) {
        super();
        this.mEnabledOnly = true;
        this.mMinimumTriggerTime = 1000L;
        this.mMinimumTriggerDistance = 10L;
        this.mEnabledOnly = mEnabledOnly;
        this.mMinimumTriggerTime = mMinimumTriggerTime;
        this.mMinimumTriggerDistance = mMinimumTriggerDistance;
        this.setAccuracy(accuracy);
        this.setAltitudeRequired(altitudeRequired);
        this.setBearingRequired(bearingRequired);
        this.setCostAllowed(costAllowed);
        this.setPowerRequirement(powerRequirement);
        this.setSpeedRequired(speedRequired);
    }
    
    public long getMinimumTriggerDistance() {
        return this.mMinimumTriggerDistance;
    }
    
    public long getMinimumTriggerTime() {
        return this.mMinimumTriggerTime;
    }
    
    public boolean isEnabledOnly() {
        return this.mEnabledOnly;
    }
    
    public void setEnabledOnly(final boolean mEnabledOnly) {
        this.mEnabledOnly = mEnabledOnly;
    }
    
    public void setMinimumTriggerDistance(final long mMinimumTriggerDistance) {
        this.mMinimumTriggerDistance = mMinimumTriggerDistance;
    }
    
    public void setMinimumTriggerTime(final long mMinimumTriggerTime) {
        this.mMinimumTriggerTime = mMinimumTriggerTime;
    }
}
