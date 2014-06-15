package org.anddev.andengine.extension.augmentedreality;

import android.view.*;
import android.content.*;
import android.hardware.*;
import org.anddev.andengine.util.*;
import java.io.*;

class CameraPreviewSurfaceView extends SurfaceView implements SurfaceHolder$Callback
{
    private Camera mCamera;
    private final SurfaceHolder mSurfaceHolder;
    
    public CameraPreviewSurfaceView(final Context context) {
        super(context);
        (this.mSurfaceHolder = this.getHolder()).addCallback((SurfaceHolder$Callback)this);
        this.mSurfaceHolder.setType(3);
    }
    
    public void surfaceChanged(final SurfaceHolder surfaceHolder, final int n, final int n2, final int n3) {
        final Camera$Parameters parameters = this.mCamera.getParameters();
        parameters.setPreviewSize(n2, n3);
        this.mCamera.setParameters(parameters);
        this.mCamera.startPreview();
    }
    
    public void surfaceCreated(final SurfaceHolder previewDisplay) {
        this.mCamera = Camera.open();
        try {
            this.mCamera.setPreviewDisplay(previewDisplay);
        }
        catch (IOException ex) {
            Debug.e("Error in Camera.setPreviewDisplay", ex);
        }
    }
    
    public void surfaceDestroyed(final SurfaceHolder surfaceHolder) {
        this.mCamera.stopPreview();
        this.mCamera.release();
        this.mCamera = null;
    }
}
