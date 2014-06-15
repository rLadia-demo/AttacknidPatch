package org.anddev.andengine.util;

import android.util.*;

public class Path
{
    private final float[] mCoordinatesX;
    private final float[] mCoordinatesY;
    private int mIndex;
    private float mLength;
    private boolean mLengthChanged;
    
    public Path(final int n) {
        super();
        this.mLengthChanged = false;
        this.mCoordinatesX = new float[n];
        this.mCoordinatesY = new float[n];
        this.mIndex = 0;
        this.mLengthChanged = false;
    }
    
    public Path(final Path path) {
        super();
        this.mLengthChanged = false;
        final int size = path.getSize();
        this.mCoordinatesX = new float[size];
        this.mCoordinatesY = new float[size];
        System.arraycopy(path.mCoordinatesX, 0, this.mCoordinatesX, 0, size);
        System.arraycopy(path.mCoordinatesY, 0, this.mCoordinatesY, 0, size);
        this.mIndex = path.mIndex;
        this.mLengthChanged = path.mLengthChanged;
        this.mLength = path.mLength;
    }
    
    public Path(final float[] mCoordinatesX, final float[] mCoordinatesY) throws IllegalArgumentException {
        super();
        this.mLengthChanged = false;
        if (mCoordinatesX.length != mCoordinatesY.length) {
            throw new IllegalArgumentException("Coordinate-Arrays must have the same length.");
        }
        this.mCoordinatesX = mCoordinatesX;
        this.mCoordinatesY = mCoordinatesY;
        this.mIndex = mCoordinatesX.length;
        this.mLengthChanged = true;
    }
    
    private void updateLength() {
        float mLength = 0.0f;
        for (int i = -2 + this.mIndex; i >= 0; --i) {
            mLength += this.getSegmentLength(i);
        }
        this.mLength = mLength;
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
        if (this.mLengthChanged) {
            this.updateLength();
        }
        return this.mLength;
    }
    
    public float getSegmentLength(final int n) {
        final float[] mCoordinatesX = this.mCoordinatesX;
        final float[] mCoordinatesY = this.mCoordinatesY;
        final int n2 = n + 1;
        final float n3 = mCoordinatesX[n] - mCoordinatesX[n2];
        final float n4 = mCoordinatesY[n] - mCoordinatesY[n2];
        return FloatMath.sqrt(n3 * n3 + n4 * n4);
    }
    
    public int getSize() {
        return this.mCoordinatesX.length;
    }
    
    public Path to(final float n, final float n2) {
        this.mCoordinatesX[this.mIndex] = n;
        this.mCoordinatesY[this.mIndex] = n2;
        ++this.mIndex;
        this.mLengthChanged = true;
        return this;
    }
}
