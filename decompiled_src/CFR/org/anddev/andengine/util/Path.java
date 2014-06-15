/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util;

import android.util.FloatMath;

public class Path {
    private final float[] mCoordinatesX;
    private final float[] mCoordinatesY;
    private int mIndex;
    private float mLength;
    private boolean mLengthChanged = false;

    public Path(int n) {
        this.mCoordinatesX = new float[n];
        this.mCoordinatesY = new float[n];
        this.mIndex = 0;
        this.mLengthChanged = false;
    }

    public Path(Path path) {
        int n = path.getSize();
        this.mCoordinatesX = new float[n];
        this.mCoordinatesY = new float[n];
        System.arraycopy(path.mCoordinatesX, 0, this.mCoordinatesX, 0, n);
        System.arraycopy(path.mCoordinatesY, 0, this.mCoordinatesY, 0, n);
        this.mIndex = path.mIndex;
        this.mLengthChanged = path.mLengthChanged;
        this.mLength = path.mLength;
    }

    public Path(float[] arrf, float[] arrf2) throws IllegalArgumentException {
        if (arrf.length != arrf2.length) {
            throw new IllegalArgumentException("Coordinate-Arrays must have the same length.");
        }
        this.mCoordinatesX = arrf;
        this.mCoordinatesY = arrf2;
        this.mIndex = arrf.length;
        this.mLengthChanged = true;
    }

    private void updateLength() {
        float f = 0.0f;
        int n = -2 + this.mIndex;
        do {
            if (n < 0) {
                this.mLength = f;
                return;
            }
            f+=this.getSegmentLength(n);
            --n;
        } while (true);
    }

    public Path clone() {
        return new Path(this);
    }

    public float[] getCoordinatesX() {
        return this.mCoordinatesX;
    }

    public float[] getCoordinatesY() {
        return this.mCoordinatesY;
    }

    public float getLength() {
        if (!this.mLengthChanged) return this.mLength;
        this.updateLength();
        return this.mLength;
    }

    public float getSegmentLength(int n) {
        float[] arrf = this.mCoordinatesX;
        float[] arrf2 = this.mCoordinatesY;
        int n2 = n + 1;
        float f = arrf[n] - arrf[n2];
        float f2 = arrf2[n] - arrf2[n2];
        return FloatMath.sqrt((float)(f * f + f2 * f2));
    }

    public int getSize() {
        return this.mCoordinatesX.length;
    }

    public Path to(float f, float f2) {
        this.mCoordinatesX[this.mIndex] = f;
        this.mCoordinatesY[this.mIndex] = f2;
        this.mIndex = 1 + this.mIndex;
        this.mLengthChanged = true;
        return this;
    }
}

