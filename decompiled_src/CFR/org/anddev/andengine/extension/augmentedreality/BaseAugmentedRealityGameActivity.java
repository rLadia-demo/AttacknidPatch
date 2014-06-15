/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.os.Bundle
 *  android.view.SurfaceHolder
 *  android.view.View
 *  android.view.ViewGroup
 *  android.view.ViewGroup$LayoutParams
 */
package org.anddev.andengine.extension.augmentedreality;

import android.content.Context;
import android.os.Bundle;
import android.view.SurfaceHolder;
import android.view.View;
import android.view.ViewGroup;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.extension.augmentedreality.CameraPreviewSurfaceView;
import org.anddev.andengine.opengl.view.ComponentSizeChooser;
import org.anddev.andengine.opengl.view.EGLConfigChooser;
import org.anddev.andengine.opengl.view.RenderSurfaceView;
import org.anddev.andengine.ui.activity.BaseGameActivity;

public abstract class BaseAugmentedRealityGameActivity
extends BaseGameActivity {
    private CameraPreviewSurfaceView mCameraPreviewSurfaceView;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mCameraPreviewSurfaceView = new CameraPreviewSurfaceView((Context)this);
        this.addContentView((View)this.mCameraPreviewSurfaceView, new ViewGroup.LayoutParams(-2, -2));
        this.mRenderSurfaceView.bringToFront();
    }

    protected void onPause() {
        super.onPause();
    }

    protected void onSetContentView() {
        this.mRenderSurfaceView = new RenderSurfaceView((Context)this, this.mEngine);
        this.mRenderSurfaceView.setEGLConfigChooser((EGLConfigChooser)new ComponentSizeChooser(4, 4, 4, 4, 16, 0));
        this.mRenderSurfaceView.getHolder().setFormat(-3);
        this.mRenderSurfaceView.applyRenderer();
        this.setContentView((View)this.mRenderSurfaceView, this.createSurfaceViewLayoutParams());
    }
}

