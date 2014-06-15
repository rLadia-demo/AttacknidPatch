/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor.accelerometer;

import java.util.Arrays;
import org.anddev.andengine.sensor.BaseSensorData;

public class AccelerometerData
extends BaseSensorData {
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

    public void setX(float f) {
        this.mValues[0] = f;
    }

    public void setY(float f) {
        this.mValues[1] = f;
    }

    public void setZ(float f) {
        this.mValues[2] = f;
    }

    @Override
    public String toString() {
        return "Accelerometer: " + Arrays.toString(this.mValues);
    }
}

