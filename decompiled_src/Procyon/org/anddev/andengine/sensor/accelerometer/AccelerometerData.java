package org.anddev.andengine.sensor.accelerometer;

import org.anddev.andengine.sensor.*;
import java.util.*;

public class AccelerometerData extends BaseSensorData
{
    public AccelerometerData() {
        super(3);
    }
    
    public float getX() {
        return this.mValues[0];
    }
    
    public float getY() {
        return this.mValues[1];
    }
    
    public float getZ() {
        return this.mValues[2];
    }
    
    public void setX(final float n) {
        this.mValues[0] = n;
    }
    
    public void setY(final float n) {
        this.mValues[1] = n;
    }
    
    public void setZ(final float n) {
        this.mValues[2] = n;
    }
    
    @Override
    public String toString() {
        return "Accelerometer: " + Arrays.toString(this.mValues);
    }
}
