package org.anddev.andengine.sensor.orientation;

import org.anddev.andengine.sensor.*;
import java.util.*;

public class OrientationData extends BaseSensorData
{
    public OrientationData() {
        super(3);
    }
    
    public float getPitch() {
        return super.mValues[1];
    }
    
    public float getRoll() {
        return super.mValues[2];
    }
    
    public float getYaw() {
        return super.mValues[0];
    }
    
    @Override
    public String toString() {
        return "Orientation: " + Arrays.toString(this.mValues);
    }
}
