/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.location.Criteria
 */
package org.anddev.andengine.sensor.location;

import android.location.Criteria;

public class LocationSensorOptions
extends Criteria {
    private static final long MINIMUMTRIGGERDISTANCE_DEFAULT = 10;
    private static final long MINIMUMTRIGGERTIME_DEFAULT = 1000;
    private boolean mEnabledOnly = true;
    private long mMinimumTriggerDistance = 10;
    private long mMinimumTriggerTime = 1000;

    public LocationSensorOptions() {
    }

    public LocationSensorOptions(int n, boolean bl, boolean bl2, boolean bl3, int n2, boolean bl4, boolean bl5, long l, long l2) {
        this.mEnabledOnly = bl5;
        this.mMinimumTriggerTime = l;
        this.mMinimumTriggerDistance = l2;
        this.setAccuracy(n);
        this.setAltitudeRequired(bl);
        this.setBearingRequired(bl2);
        this.setCostAllowed(bl3);
        this.setPowerRequirement(n2);
        this.setSpeedRequired(bl4);
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

    public void setEnabledOnly(boolean bl) {
        this.mEnabledOnly = bl;
    }

    public void setMinimumTriggerDistance(long l) {
        this.mMinimumTriggerDistance = l;
    }

    public void setMinimumTriggerTime(long l) {
        this.mMinimumTriggerTime = l;
    }
}

