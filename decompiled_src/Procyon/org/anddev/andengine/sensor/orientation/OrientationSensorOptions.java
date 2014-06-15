package org.anddev.andengine.sensor.orientation;

import org.anddev.andengine.sensor.*;

public class OrientationSensorOptions
{
    final SensorDelay mSensorDelay;
    
    public OrientationSensorOptions(final SensorDelay mSensorDelay) {
        super();
        this.mSensorDelay = mSensorDelay;
    }
    
    public SensorDelay getSensorDelay() {
        return this.mSensorDelay;
    }
}
