package org.anddev.andengine.engine.camera;

public class SmoothCamera extends ZoomCamera
{
    private float mMaxVelocityX;
    private float mMaxVelocityY;
    private float mMaxZoomFactorChange;
    private float mTargetCenterX;
    private float mTargetCenterY;
    private float mTargetZoomFactor;
    
    public SmoothCamera(final float n, final float n2, final float n3, final float n4, final float mMaxVelocityX, final float mMaxVelocityY, final float mMaxZoomFactorChange) {
        super(n, n2, n3, n4);
        this.mMaxVelocityX = mMaxVelocityX;
        this.mMaxVelocityY = mMaxVelocityY;
        this.mMaxZoomFactorChange = mMaxZoomFactorChange;
        this.mTargetCenterX = this.getCenterX();
        this.mTargetCenterY = this.getCenterY();
        this.mTargetZoomFactor = 1.0f;
    }
    
    private float cutToMaxVelocityX(final float n, final float n2) {
        if (n > 0.0f) {
            return Math.min(n, n2 * this.mMaxVelocityX);
        }
        return Math.max(n, n2 * -this.mMaxVelocityX);
    }
    
    private float cutToMaxVelocityY(final float n, final float n2) {
        if (n > 0.0f) {
            return Math.min(n, n2 * this.mMaxVelocityY);
        }
        return Math.max(n, n2 * -this.mMaxVelocityY);
    }
    
    private float cutToMaxZoomFactorChange(final float n, final float n2) {
        if (n > 0.0f) {
            return Math.min(n, n2 * this.mMaxZoomFactorChange);
        }
        return Math.max(n, n2 * -this.mMaxZoomFactorChange);
    }
    
    @Override
    public void onUpdate(final float n) {
        super.onUpdate(n);
        final float centerX = this.getCenterX();
        final float centerY = this.getCenterY();
        final float mTargetCenterX = this.mTargetCenterX;
        final float mTargetCenterY = this.mTargetCenterY;
        if (centerX != mTargetCenterX || centerY != mTargetCenterY) {
            super.setCenter(centerX + this.cutToMaxVelocityX(mTargetCenterX - centerX, n), centerY + this.cutToMaxVelocityY(mTargetCenterY - centerY, n));
        }
        final float zoomFactor = this.getZoomFactor();
        final float mTargetZoomFactor = this.mTargetZoomFactor;
        if (zoomFactor != mTargetZoomFactor) {
            super.setZoomFactor(zoomFactor + this.cutToMaxZoomFactorChange(mTargetZoomFactor - zoomFactor, n));
        }
    }
    
    @Override
    public void setCenter(final float mTargetCenterX, final float mTargetCenterY) {
        this.mTargetCenterX = mTargetCenterX;
        this.mTargetCenterY = mTargetCenterY;
    }
    
    public void setCenterDirect(final float mTargetCenterX, final float mTargetCenterY) {
        super.setCenter(mTargetCenterX, mTargetCenterY);
        this.mTargetCenterX = mTargetCenterX;
        this.mTargetCenterY = mTargetCenterY;
    }
    
    public void setMaxVelocityX(final float mMaxVelocityX) {
        this.mMaxVelocityX = mMaxVelocityX;
    }
    
    public void setMaxVelocityX(final float mMaxVelocityX, final float mMaxVelocityY) {
        this.mMaxVelocityX = mMaxVelocityX;
        this.mMaxVelocityY = mMaxVelocityY;
    }
    
    public void setMaxVelocityY(final float mMaxVelocityY) {
        this.mMaxVelocityY = mMaxVelocityY;
    }
    
    public void setMaxZoomFactorChange(final float mMaxZoomFactorChange) {
        this.mMaxZoomFactorChange = mMaxZoomFactorChange;
    }
    
    @Override
    public void setZoomFactor(final float mTargetZoomFactor) {
        this.mTargetZoomFactor = mTargetZoomFactor;
    }
}
