/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.engine.options.resolutionpolicy.BaseResolutionPolicy;
import org.anddev.andengine.opengl.view.RenderSurfaceView;

public class FixedResolutionPolicy
extends BaseResolutionPolicy {
    private final int mHeight;
    private final int mWidth;

    public FixedResolutionPolicy(int n, int n2) {
        this.mWidth = n;
        this.mHeight = n2;
    }

    @Override
    public void onMeasure(RenderSurfaceView renderSurfaceView, int n2, int n2) {
        renderSurfaceView.setMeasuredDimensionProxy(this.mWidth, this.mHeight);
    }
}

