/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.hardware.Camera
 *  android.hardware.Camera$Parameters
 *  android.view.SurfaceHolder
 *  android.view.SurfaceHolder$Callback
 *  android.view.SurfaceView
 */
package org.anddev.andengine.extension.augmentedreality;

import android.content.Context;
import android.hardware.Camera;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.io.IOException;
import org.anddev.andengine.util.Debug;

class CameraPreviewSurfaceView
extends SurfaceView
implements SurfaceHolder.Callback {
    private Camera mCamera;
    private final SurfaceHolder mSurfaceHolder;

    public CameraPreviewSurfaceView(Context context) {
        super(context);
        this.mSurfaceHolder = this.getHolder();
        this.mSurfaceHolder.addCallback((SurfaceHolder.Callback)this);
        this.mSurfaceHolder.setType(3);
    }

    public void surfaceChanged(SurfaceHolder surfaceHolder2, int surfaceHolder2, int n, int n2) {
        Camera.Parameters parameters = this.mCamera.getParameters();
        parameters.setPreviewSize(n, n2);
        this.mCamera.setParameters(parameters);
        this.mCamera.startPreview();
    }

    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.mCamera = Camera.open();
        try {
            this.mCamera.setPreviewDisplay(surfaceHolder);
            return;
        }
        catch (IOException var2_2) {
            Debug.e("Error in Camera.setPreviewDisplay", var2_2);
            return;
        }
    }

    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.mCamera.stopPreview();
        this.mCamera.release();
        this.mCamera = null;
    }
}

