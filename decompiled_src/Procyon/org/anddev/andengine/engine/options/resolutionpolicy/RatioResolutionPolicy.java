package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.opengl.view.*;
import android.view.*;

public class RatioResolutionPolicy extends BaseResolutionPolicy
{
    private final float mRatio;
    
    public RatioResolutionPolicy(final float mRatio) {
        super();
        this.mRatio = mRatio;
    }
    
    public RatioResolutionPolicy(final float n, final float n2) {
        super();
        this.mRatio = n / n2;
    }
    
    @Override
    public void onMeasure(final RenderSurfaceView renderSurfaceView, final int n, final int n2) {
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        final int size = View$MeasureSpec.getSize(n);
        final int size2 = View$MeasureSpec.getSize(n2);
        final float mRatio = this.mRatio;
        int round;
        int round2;
        if (size / size2 < mRatio) {
            round = size;
            round2 = Math.round(round / mRatio);
        }
        else {
            round2 = size2;
            round = Math.round(mRatio * round2);
        }
        renderSurfaceView.setMeasuredDimensionProxy(round, round2);
    }
}
