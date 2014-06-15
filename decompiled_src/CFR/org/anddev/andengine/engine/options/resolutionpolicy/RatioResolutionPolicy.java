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

public class RatioResolutionPolicy
extends BaseResolutionPolicy {
    private final float mRatio;

    public RatioResolutionPolicy(float f) {
        this.mRatio = f;
    }

    public RatioResolutionPolicy(float f, float f2) {
        this.mRatio = f / f2;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void onMeasure(RenderSurfaceView renderSurfaceView, int n, int n2) {
        int n3;
        int n4;
        BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(n, n2);
        int n5 = View.MeasureSpec.getSize((int)n);
        int n6 = View.MeasureSpec.getSize((int)n2);
        float f = this.mRatio;
        if ((float)n5 / (float)n6 < f) {
            n4 = n5;
            n3 = Math.round((float)n4 / f);
        } else {
            n3 = n6;
            n4 = Math.round(f * (float)n3);
        }
        renderSurfaceView.setMeasuredDimensionProxy(n4, n3);
    }
}

