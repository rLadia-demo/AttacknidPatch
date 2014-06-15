package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.opengl.view.*;
import android.view.*;

public class RelativeResolutionPolicy extends BaseResolutionPolicy
{
    private final float mHeightScale;
    private final float mWidthScale;
    
    public RelativeResolutionPolicy(final float n) {
        this(n, n);
    }
    
    public RelativeResolutionPolicy(final float mWidthScale, final float mHeightScale) {
        super();
        this.mWidthScale = mWidthScale;
        this.mHeightScale = mHeightScale;
    }
    
    @Override
    public void onMeasure(final RenderSurfaceView renderSurfaceView, final int n, final int n2) {
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        renderSurfaceView.setMeasuredDimensionProxy((int)(View$MeasureSpec.getSize(n) * this.mWidthScale), (int)(View$MeasureSpec.getSize(n2) * this.mHeightScale));
    }
}
