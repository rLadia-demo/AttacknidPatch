/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor.accelerometer;

import org.anddev.andengine.sensor.SensorDelay;

public class AccelerometerSensorOptions {
    final SensorDelay mSensorDelay;

    public AccelerometerSensorOptions(SensorDelay sensorDelay) {
        this.mSensorDelay = sensorDelay;
    }

    public SensorDelay getSensorDelay() {
        return this.mSensorDelay;
    }
}

