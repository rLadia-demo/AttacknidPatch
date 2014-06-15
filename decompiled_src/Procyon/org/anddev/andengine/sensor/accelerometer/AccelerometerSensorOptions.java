package org.anddev.andengine.sensor.accelerometer;

import org.anddev.andengine.sensor.*;

public class AccelerometerSensorOptions
{
    final SensorDelay mSensorDelay;
    
    public AccelerometerSensorOptions(final SensorDelay mSensorDelay) {
        super();
        this.mSensorDelay = mSensorDelay;
    }
    
    public SensorDelay getSensorDelay() {
        return this.mSensorDelay;
    }
}
