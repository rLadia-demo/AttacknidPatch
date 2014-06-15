package org.anddev.andengine.extension.augmentedreality;

import org.anddev.andengine.ui.activity.*;
import android.os.*;
import android.content.*;
import android.view.*;
import org.anddev.andengine.opengl.view.*;

public abstract class BaseAugmentedRealityGameActivity extends BaseGameActivity
{
    private CameraPreviewSurfaceView mCameraPreviewSurfaceView;
    
    @Override
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.addContentView((View)(this.mCameraPreviewSurfaceView = new CameraPreviewSurfaceView((Context)this)), new ViewGroup$LayoutParams(-2, -2));
        this.mRenderSurfaceView.bringToFront();
    }
    
    @Override
    protected void onPause() {
        super.onPause();
    }
    
    @Override
    protected void onSetContentView() {
        (this.mRenderSurfaceView = new RenderSurfaceView((Context)this, this.mEngine)).setEGLConfigChooser(new ComponentSizeChooser(4, 4, 4, 4, 16, 0));
        this.mRenderSurfaceView.getHolder().setFormat(-3);
        this.mRenderSurfaceView.applyRenderer();
        this.setContentView((View)this.mRenderSurfaceView, this.createSurfaceViewLayoutParams());
    }
}
