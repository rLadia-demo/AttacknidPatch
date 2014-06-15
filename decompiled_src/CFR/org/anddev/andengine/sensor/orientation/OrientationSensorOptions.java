/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor.orientation;

import org.anddev.andengine.sensor.SensorDelay;

public class OrientationSensorOptions {
    final SensorDelay mSensorDelay;

    public OrientationSensorOptions(SensorDelay sensorDelay) {
        this.mSensorDelay = sensorDelay;
    }

    public SensorDelay getSensorDelay() {
        return this.mSensorDelay;
    }
}

