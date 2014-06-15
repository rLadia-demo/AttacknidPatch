package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.opengl.view.*;
import android.view.*;

public class FillResolutionPolicy extends BaseResolutionPolicy
{
    @Override
    public void onMeasure(final RenderSurfaceView renderSurfaceView, final int n, final int n2) {
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        renderSurfaceView.setMeasuredDimensionProxy(View$MeasureSpec.getSize(n), View$MeasureSpec.getSize(n2));
    }
}
