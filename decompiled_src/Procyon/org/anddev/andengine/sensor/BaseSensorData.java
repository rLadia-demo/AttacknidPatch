package org.anddev.andengine.sensor;

import java.util.*;

public class BaseSensorData
{
    protected int mAccuracy;
    protected final float[] mValues;
    
    public BaseSensorData(final int n) {
        super();
        this.mValues = new float[n];
    }
    
    public int getAccuracy() {
        return this.mAccuracy;
    }
    
    public float[] getValues() {
        return this.mValues;
    }
    
    public void setAccuracy(final int mAccuracy) {
        this.mAccuracy = mAccuracy;
    }
    
    public void setValues(final float[] array) {
        final float[] mValues = this.mValues;
        for (int i = -1 + array.length; i >= 0; --i) {
            mValues[i] = array[i];
        }
    }
    
    @Override
    public String toString() {
        return "Values: " + Arrays.toString(this.mValues);
    }
}
