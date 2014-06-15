/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor.orientation;

import java.util.Arrays;
import org.anddev.andengine.sensor.BaseSensorData;

public class OrientationData
extends BaseSensorData {
    public OrientationData() {
        super(3);
    }

    public float getPitch() {
        return this.mValues[1];
    }

    public float getRoll() {
        return this.mValues[2];
    }

    public float getYaw() {
        return this.mValues[0];
    }

    @Override
    public String toString() {
        return "Orientation: " + Arrays.toString(this.mValues);
    }
}

