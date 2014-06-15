/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.View
 */
package org.anddev.andengine.ui.activity;

import android.view.View;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.opengl.view.RenderSurfaceView;
import org.anddev.andengine.ui.activity.BaseGameActivity;

public abstract class LayoutGameActivity
extends BaseGameActivity {
    protected abstract int getLayoutID();

    protected abstract int getRenderSurfaceViewID();

    protected void onSetContentView() {
        super.setContentView(this.getLayoutID());
        this.mRenderSurfaceView = (RenderSurfaceView)this.findViewById(this.getRenderSurfaceViewID());
        this.mRenderSurfaceView.setEGLConfigChooser(false);
        this.mRenderSurfaceView.setRenderer(this.mEngine);
    }
}

