package org.anddev.andengine.opengl.view;

import android.content.*;
import android.util.*;
import org.anddev.andengine.engine.*;
import android.view.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.egl.*;
import org.anddev.andengine.opengl.util.*;

public class RenderSurfaceView extends GLSurfaceView
{
    private Renderer mRenderer;
    
    public RenderSurfaceView(final Context context) {
        super(context);
    }
    
    public RenderSurfaceView(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    protected void onMeasure(final int n, final int n2) {
        this.mRenderer.mEngine.getEngineOptions().getResolutionPolicy().onMeasure(this, n, n2);
    }
    
    public void setMeasuredDimensionProxy(final int n, final int n2) {
        this.setMeasuredDimension(n, n2);
    }
    
    public void setRenderer(final Engine onTouchListener) {
        this.setOnTouchListener((View$OnTouchListener)onTouchListener);
        this.setRenderer((GLSurfaceView.Renderer)(this.mRenderer = new Renderer(onTouchListener)));
    }
    
    public static class Renderer implements GLSurfaceView.Renderer
    {
        private final Engine mEngine;
        
        public Renderer(final Engine mEngine) {
            super();
            this.mEngine = mEngine;
        }
        
        @Override
        public void onDrawFrame(final GL10 gl10) {
            try {
                this.mEngine.onDrawFrame(gl10);
            }
            catch (InterruptedException ex) {
                Debug.e("GLThread interrupted!", ex);
            }
        }
        
        @Override
        public void onSurfaceChanged(final GL10 gl10, final int n, final int n2) {
            Debug.d("onSurfaceChanged: pWidth=" + n + "  pHeight=" + n2);
            this.mEngine.setSurfaceSize(n, n2);
            gl10.glViewport(0, 0, n, n2);
            gl10.glLoadIdentity();
        }
        
        @Override
        public void onSurfaceCreated(final GL10 gl10, final EGLConfig eglConfig) {
            Debug.d("onSurfaceCreated");
            GLHelper.reset(gl10);
            GLHelper.setPerspectiveCorrectionHintFastest(gl10);
            GLHelper.setShadeModelFlat(gl10);
            GLHelper.disableLightning(gl10);
            GLHelper.disableDither(gl10);
            GLHelper.disableDepthTest(gl10);
            GLHelper.disableMultisample(gl10);
            GLHelper.enableBlend(gl10);
            GLHelper.enableTextures(gl10);
            GLHelper.enableTexCoordArray(gl10);
            GLHelper.enableVertexArray(gl10);
            GLHelper.enableCulling(gl10);
            gl10.glFrontFace(2305);
            gl10.glCullFace(1029);
            GLHelper.enableExtensions(gl10, this.mEngine.getEngineOptions().getRenderOptions());
        }
    }
}
