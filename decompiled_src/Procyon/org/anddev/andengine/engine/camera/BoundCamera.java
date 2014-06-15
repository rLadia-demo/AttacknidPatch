package org.anddev.andengine.engine.camera;

public class BoundCamera extends Camera
{
    private float mBoundsCenterX;
    private float mBoundsCenterY;
    protected boolean mBoundsEnabled;
    private float mBoundsHeight;
    private float mBoundsMaxX;
    private float mBoundsMaxY;
    private float mBoundsMinX;
    private float mBoundsMinY;
    private float mBoundsWidth;
    
    public BoundCamera(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    public BoundCamera(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final float n8) {
        super(n, n2, n3, n4);
        this.setBounds(n5, n6, n7, n8);
        this.mBoundsEnabled = true;
    }
    
    private float determineBoundedX() {
        float n;
        if (this.mBoundsWidth < this.getWidth()) {
            n = this.mBoundsCenterX;
        }
        else {
            n = this.getCenterX();
            final float n2 = this.mBoundsMinX - this.getMinX();
            int n3;
            if (n2 > 0.0f) {
                n3 = 1;
            }
            else {
                n3 = 0;
            }
            final float n4 = this.getMaxX() - this.mBoundsMaxX;
            boolean b;
            if (n4 > 0.0f) {
                b = true;
            }
            else {
                b = false;
            }
            if (n3 != 0) {
                if (b) {
                    return n2 + (n - n4);
                }
                return n + n2;
            }
            else if (b) {
                return n - n4;
            }
        }
        return n;
    }
    
    private float determineBoundedY() {
        float n;
        if (this.mBoundsHeight < this.getHeight()) {
            n = this.mBoundsCenterY;
        }
        else {
            n = this.getCenterY();
            final float n2 = this.mBoundsMinY - this.getMinY();
            int n3;
            if (n2 > 0.0f) {
                n3 = 1;
            }
            else {
                n3 = 0;
            }
            final float n4 = this.getMaxY() - this.mBoundsMaxY;
            boolean b;
            if (n4 > 0.0f) {
                b = true;
            }
            else {
                b = false;
            }
            if (n3 != 0) {
                if (b) {
                    return n2 + (n - n4);
                }
                return n + n2;
            }
            else if (b) {
                return n - n4;
            }
        }
        return n;
    }
    
    protected void ensureInBounds() {
        super.setCenter(this.determineBoundedX(), this.determineBoundedY());
    }
    
    public boolean isBoundsEnabled() {
        return this.mBoundsEnabled;
    }
    
    public void setBounds(final float mBoundsMinX, final float mBoundsMaxX, final float mBoundsMinY, final float mBoundsMaxY) {
        this.mBoundsMinX = mBoundsMinX;
        this.mBoundsMaxX = mBoundsMaxX;
        this.mBoundsMinY = mBoundsMinY;
        this.mBoundsMaxY = mBoundsMaxY;
        this.mBoundsWidth = this.mBoundsMaxX - this.mBoundsMinX;
        this.mBoundsHeight = this.mBoundsMaxY - this.mBoundsMinY;
        this.mBoundsCenterX = this.mBoundsMinX + 0.5f * this.mBoundsWidth;
        this.mBoundsCenterY = this.mBoundsMinY + 0.5f * this.mBoundsHeight;
    }
    
    public void setBoundsEnabled(final boolean mBoundsEnabled) {
        this.mBoundsEnabled = mBoundsEnabled;
    }
    
    @Override
    public void setCenter(final float n, final float n2) {
        super.setCenter(n, n2);
        if (this.mBoundsEnabled) {
            this.ensureInBounds();
        }
    }
}
