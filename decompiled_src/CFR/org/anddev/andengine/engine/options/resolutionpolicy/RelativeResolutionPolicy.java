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

public class RelativeResolutionPolicy
extends BaseResolutionPolicy {
    private final float mHeightScale;
    private final float mWidthScale;

    public RelativeResolutionPolicy(float f) {
        this(f, f);
    }

    public RelativeResolutionPolicy(float f, float f2) {
        this.mWidthScale = f;
        this.mHeightScale = f2;
    }

    @Override
    public void onMeasure(RenderSurfaceView renderSurfaceView, int n, int n2) {
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        renderSurfaceView.setMeasuredDimensionProxy((int)((float)View.MeasureSpec.getSize((int)n) * this.mWidthScale), (int)((float)View.MeasureSpec.getSize((int)n2) * this.mHeightScale));
    }
}

