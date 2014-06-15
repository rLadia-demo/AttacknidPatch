package org.anddev.andengine.ui.activity;

import org.anddev.andengine.opengl.view.*;

public abstract class LayoutGameActivity extends BaseGameActivity
{
    protected abstract int getLayoutID();
    
    protected abstract int getRenderSurfaceViewID();
    
    @Override
    protected void onSetContentView() {
        super.setContentView(this.getLayoutID());
        (this.mRenderSurfaceView = (RenderSurfaceView)this.findViewById(this.getRenderSurfaceViewID())).setEGLConfigChooser(false);
        this.mRenderSurfaceView.setRenderer(this.mEngine);
    }
}
