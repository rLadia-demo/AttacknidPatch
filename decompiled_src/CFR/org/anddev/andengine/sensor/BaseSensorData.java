/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor;

import java.util.Arrays;

public class BaseSensorData {
    protected int mAccuracy;
    protected final float[] mValues = new float[n];

    public BaseSensorData(int n) {
    }

    public int getAccuracy() {
        return this.mAccuracy;
    }

    public float[] getValues() {
        return this.mValues;
    }

    public void setAccuracy(int n) {
        this.mAccuracy = n;
    }

    public void setValues(float[] arrf) {
        float[] arrf2 = this.mValues;
        int n = -1 + arrf.length;
        while (n >= 0) {
            arrf2[n] = arrf[n];
            --n;
        }
        return;
    }

    public String toString() {
        return "Values: " + Arrays.toString(this.mValues);
    }
}

