/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.View
 *  android.view.View$MeasureSpec
 */
package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.View;
import org.anddev.andengine.engine.options.resolutionpolicy.BaseResolutionPolicy;
import org.anddev.andengine.opengl.view.RenderSurfaceView;

public class FillResolutionPolicy
extends BaseResolutionPolicy {
    @Override
    public void onMeasure(RenderSurfaceView renderSurfaceView, int n, int n2) {
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        renderSurfaceView.setMeasuredDimensionProxy(View.MeasureSpec.getSize((int)n), View.MeasureSpec.getSize((int)n2));
    }
}

