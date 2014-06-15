/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.opengl.GLSurfaceView
 *  android.opengl.GLSurfaceView$EGLConfigChooser
 *  android.opengl.GLSurfaceView$EGLContextFactory
 *  android.opengl.GLSurfaceView$EGLWindowSurfaceFactory
 *  android.opengl.GLSurfaceView$GLWrapper
 *  android.service.wallpaper.WallpaperService
 *  android.service.wallpaper.WallpaperService$Engine
 *  android.util.Log
 *  android.view.SurfaceHolder
 */
package net.rbgrn.opengl;

import android.opengl.GLSurfaceView;
import android.service.wallpaper.WallpaperService;
import android.util.Log;
import android.view.SurfaceHolder;
import net.rbgrn.opengl.BaseConfigChooser;
import net.rbgrn.opengl.DefaultContextFactory;
import net.rbgrn.opengl.DefaultWindowSurfaceFactory;
import net.rbgrn.opengl.GLThread;
import org.anddev.andengine.opengl.view.GLSurfaceView;

public class GLWallpaperService
extends WallpaperService {
    private static final String TAG = "GLWallpaperService";

    public void onCreate() {
        super.onCreate();
    }

    public WallpaperService.Engine onCreateEngine() {
        return new GLEngine();
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public class GLEngine
    extends WallpaperService.Engine {
        public static final int RENDERMODE_CONTINUOUSLY = 1;
        public static final int RENDERMODE_WHEN_DIRTY;
        private int mDebugFlags;
        private GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
        private GLSurfaceView.EGLContextFactory mEGLContextFactory;
        private GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
        private GLThread mGLThread;
        private GLSurfaceView.GLWrapper mGLWrapper;

        public GLEngine() {
            super((WallpaperService)GLWallpaperService.this);
        }

        private void checkRenderThreadState() {
            if (this.mGLThread == null) return;
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }

        public int getDebugFlags() {
            return this.mDebugFlags;
        }

        public int getRenderMode() {
            return this.mGLThread.getRenderMode();
        }

        public void onCreate(SurfaceHolder surfaceHolder) {
            super.onCreate(surfaceHolder);
        }

        public void onDestroy() {
            super.onDestroy();
        }

        public void onPause() {
            this.mGLThread.onPause();
        }

        public void onResume() {
            this.mGLThread.onResume();
        }

        public void onSurfaceChanged(SurfaceHolder surfaceHolder, int n, int n2, int n3) {
            this.mGLThread.onWindowResize(n2, n3);
            super.onSurfaceChanged(surfaceHolder, n, n2, n3);
        }

        public void onSurfaceCreated(SurfaceHolder surfaceHolder) {
            Log.d((String)"GLWallpaperService", (String)"onSurfaceCreated()");
            this.mGLThread.surfaceCreated(surfaceHolder);
            super.onSurfaceCreated(surfaceHolder);
        }

        public void onSurfaceDestroyed(SurfaceHolder surfaceHolder) {
            Log.d((String)"GLWallpaperService", (String)"onSurfaceDestroyed()");
            this.mGLThread.surfaceDestroyed();
            super.onSurfaceDestroyed(surfaceHolder);
        }

        /*
         * Enabled aggressive block sorting
         */
        public void onVisibilityChanged(boolean bl) {
            if (bl) {
                this.onResume();
            } else {
                this.onPause();
            }
            super.onVisibilityChanged(bl);
        }

        public void queueEvent(Runnable runnable) {
            this.mGLThread.queueEvent(runnable);
        }

        public void requestRender() {
            this.mGLThread.requestRender();
        }

        public void setDebugFlags(int n) {
            this.mDebugFlags = n;
        }

        public void setEGLConfigChooser(int n, int n2, int n3, int n4, int n5, int n6) {
            this.setEGLConfigChooser((GLSurfaceView.EGLConfigChooser)new BaseConfigChooser.ComponentSizeChooser(n, n2, n3, n4, n5, n6));
        }

        public void setEGLConfigChooser(GLSurfaceView.EGLConfigChooser eGLConfigChooser) {
            this.checkRenderThreadState();
            this.mEGLConfigChooser = eGLConfigChooser;
        }

        public void setEGLConfigChooser(boolean bl) {
            this.setEGLConfigChooser((GLSurfaceView.EGLConfigChooser)new BaseConfigChooser.SimpleEGLConfigChooser(bl));
        }

        public void setEGLContextFactory(GLSurfaceView.EGLContextFactory eGLContextFactory) {
            this.checkRenderThreadState();
            this.mEGLContextFactory = eGLContextFactory;
        }

        public void setEGLWindowSurfaceFactory(GLSurfaceView.EGLWindowSurfaceFactory eGLWindowSurfaceFactory) {
            this.checkRenderThreadState();
            this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
        }

        public void setGLWrapper(GLSurfaceView.GLWrapper gLWrapper) {
            this.mGLWrapper = gLWrapper;
        }

        public void setRenderMode(int n) {
            this.mGLThread.setRenderMode(n);
        }

        public void setRenderer(GLSurfaceView.Renderer renderer) {
            this.checkRenderThreadState();
            if (this.mEGLConfigChooser == null) {
                this.mEGLConfigChooser = new BaseConfigChooser.SimpleEGLConfigChooser(true);
            }
            if (this.mEGLContextFactory == null) {
                this.mEGLContextFactory = new DefaultContextFactory();
            }
            if (this.mEGLWindowSurfaceFactory == null) {
                this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
            }
            this.mGLThread = new GLThread(renderer, this.mEGLConfigChooser, this.mEGLContextFactory, this.mEGLWindowSurfaceFactory, this.mGLWrapper);
            this.mGLThread.start();
        }
    }

}

