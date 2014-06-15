/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.util.AttributeSet
 *  android.view.View
 *  android.view.View$OnTouchListener
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.RenderOptions;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.view.GLSurfaceView;
import org.anddev.andengine.util.Debug;

public class RenderSurfaceView
extends GLSurfaceView {
    private Renderer mRenderer;

    public RenderSurfaceView(Context context) {
        super(context);
    }

    public RenderSurfaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    protected void onMeasure(int n, int n2) {
        this.mRenderer.mEngine.getEngineOptions().getResolutionPolicy().onMeasure(this, n, n2);
    }

    public void setMeasuredDimensionProxy(int n, int n2) {
        this.setMeasuredDimension(n, n2);
    }

    public void setRenderer(Engine engine) {
        this.setOnTouchListener((View.OnTouchListener)engine);
        this.mRenderer = new Renderer(engine);
        this.setRenderer((GLSurfaceView.Renderer)this.mRenderer);
    }

    public static class Renderer
    implements GLSurfaceView.Renderer {
        private final Engine mEngine;

        public Renderer(Engine engine) {
            this.mEngine = engine;
        }

        @Override
        public void onDrawFrame(GL10 gL10) {
            try {
                this.mEngine.onDrawFrame(gL10);
                return;
            }
            catch (InterruptedException var2_2) {
                Debug.e("GLThread interrupted!", var2_2);
                return;
            }
        }

        @Override
        public void onSurfaceChanged(GL10 gL10, int n, int n2) {
            Debug.d("onSurfaceChanged: pWidth=" + n + "  pHeight=" + n2);
            this.mEngine.setSurfaceSize(n, n2);
            gL10.glViewport(0, 0, n, n2);
            gL10.glLoadIdentity();
        }

        @Override
        public void onSurfaceCreated(GL10 gL10, EGLConfig eGLConfig) {
            Debug.d("onSurfaceCreated");
            GLHelper.reset(gL10);
            GLHelper.setPerspectiveCorrectionHintFastest(gL10);
            GLHelper.setShadeModelFlat(gL10);
            GLHelper.disableLightning(gL10);
            GLHelper.disableDither(gL10);
            GLHelper.disableDepthTest(gL10);
            GLHelper.disableMultisample(gL10);
            GLHelper.enableBlend(gL10);
            GLHelper.enableTextures(gL10);
            GLHelper.enableTexCoordArray(gL10);
            GLHelper.enableVertexArray(gL10);
            GLHelper.enableCulling(gL10);
            gL10.glFrontFace(2305);
            gL10.glCullFace(1029);
            GLHelper.enableExtensions(gL10, this.mEngine.getEngineOptions().getRenderOptions());
        }
    }

}

