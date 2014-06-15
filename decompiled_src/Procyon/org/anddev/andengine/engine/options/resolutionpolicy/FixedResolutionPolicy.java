package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.opengl.view.*;

public class FixedResolutionPolicy extends BaseResolutionPolicy
{
    private final int mHeight;
    private final int mWidth;
    
    public FixedResolutionPolicy(final int mWidth, final int mHeight) {
        super();
        this.mWidth = mWidth;
        this.mHeight = mHeight;
    }
    
    @Override
    public void onMeasure(final RenderSurfaceView renderSurfaceView, final int n, final int n2) {
        renderSurfaceView.setMeasuredDimensionProxy(this.mWidth, this.mHeight);
    }
}
