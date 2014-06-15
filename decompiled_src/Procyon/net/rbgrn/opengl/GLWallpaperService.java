package net.rbgrn.opengl;

import android.service.wallpaper.*;
import android.opengl.*;
import android.view.*;
import android.util.*;
import org.anddev.andengine.opengl.view.*;

public class GLWallpaperService extends WallpaperService
{
    private static final String TAG = "GLWallpaperService";
    
    public void onCreate() {
        super.onCreate();
    }
    
    public WallpaperService$Engine onCreateEngine() {
        return new GLEngine();
    }
    
    public void onDestroy() {
        super.onDestroy();
    }
    
    public class GLEngine extends WallpaperService$Engine
    {
        public static final int RENDERMODE_CONTINUOUSLY = 1;
        public static final int RENDERMODE_WHEN_DIRTY;
        private int mDebugFlags;
        private GLSurfaceView$EGLConfigChooser mEGLConfigChooser;
        private GLSurfaceView$EGLContextFactory mEGLContextFactory;
        private GLSurfaceView$EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
        private GLThread mGLThread;
        private GLSurfaceView$GLWrapper mGLWrapper;
        
        public GLEngine() {
            super((WallpaperService)GLWallpaperService.this);
        }
        
        private void checkRenderThreadState() {
            if (this.mGLThread != null) {
                throw new IllegalStateException("setRenderer has already been called for this instance.");
            }
        }
        
        public int getDebugFlags() {
            return this.mDebugFlags;
        }
        
        public int getRenderMode() {
            return this.mGLThread.getRenderMode();
        }
        
        public void onCreate(final SurfaceHolder surfaceHolder) {
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
        
        public void onSurfaceChanged(final SurfaceHolder surfaceHolder, final int n, final int n2, final int n3) {
            this.mGLThread.onWindowResize(n2, n3);
            super.onSurfaceChanged(surfaceHolder, n, n2, n3);
        }
        
        public void onSurfaceCreated(final SurfaceHolder surfaceHolder) {
            Log.d("GLWallpaperService", "onSurfaceCreated()");
            this.mGLThread.surfaceCreated(surfaceHolder);
            super.onSurfaceCreated(surfaceHolder);
        }
        
        public void onSurfaceDestroyed(final SurfaceHolder surfaceHolder) {
            Log.d("GLWallpaperService", "onSurfaceDestroyed()");
            this.mGLThread.surfaceDestroyed();
            super.onSurfaceDestroyed(surfaceHolder);
        }
        
        public void onVisibilityChanged(final boolean b) {
            if (b) {
                this.onResume();
            }
            else {
                this.onPause();
            }
            super.onVisibilityChanged(b);
        }
        
        public void queueEvent(final Runnable runnable) {
            this.mGLThread.queueEvent(runnable);
        }
        
        public void requestRender() {
            this.mGLThread.requestRender();
        }
        
        public void setDebugFlags(final int mDebugFlags) {
            this.mDebugFlags = mDebugFlags;
        }
        
        public void setEGLConfigChooser(final int n, final int n2, final int n3, final int n4, final int n5, final int n6) {
            this.setEGLConfigChooser((GLSurfaceView$EGLConfigChooser)new BaseConfigChooser.ComponentSizeChooser(n, n2, n3, n4, n5, n6));
        }
        
        public void setEGLConfigChooser(final GLSurfaceView$EGLConfigChooser meglConfigChooser) {
            this.checkRenderThreadState();
            this.mEGLConfigChooser = meglConfigChooser;
        }
        
        public void setEGLConfigChooser(final boolean b) {
            this.setEGLConfigChooser((GLSurfaceView$EGLConfigChooser)new BaseConfigChooser.SimpleEGLConfigChooser(b));
        }
        
        public void setEGLContextFactory(final GLSurfaceView$EGLContextFactory meglContextFactory) {
            this.checkRenderThreadState();
            this.mEGLContextFactory = meglContextFactory;
        }
        
        public void setEGLWindowSurfaceFactory(final GLSurfaceView$EGLWindowSurfaceFactory meglWindowSurfaceFactory) {
            this.checkRenderThreadState();
            this.mEGLWindowSurfaceFactory = meglWindowSurfaceFactory;
        }
        
        public void setGLWrapper(final GLSurfaceView$GLWrapper mglWrapper) {
            this.mGLWrapper = mglWrapper;
        }
        
        public void setRenderMode(final int renderMode) {
            this.mGLThread.setRenderMode(renderMode);
        }
        
        public void setRenderer(final GLSurfaceView.Renderer renderer) {
            this.checkRenderThreadState();
            if (this.mEGLConfigChooser == null) {
                this.mEGLConfigChooser = (GLSurfaceView$EGLConfigChooser)new BaseConfigChooser.SimpleEGLConfigChooser(true);
            }
            if (this.mEGLContextFactory == null) {
                this.mEGLContextFactory = (GLSurfaceView$EGLContextFactory)new DefaultContextFactory();
            }
            if (this.mEGLWindowSurfaceFactory == null) {
                this.mEGLWindowSurfaceFactory = (GLSurfaceView$EGLWindowSurfaceFactory)new DefaultWindowSurfaceFactory();
            }
            (this.mGLThread = new GLThread(renderer, this.mEGLConfigChooser, this.mEGLContextFactory, this.mEGLWindowSurfaceFactory, this.mGLWrapper)).start();
        }
    }
}
