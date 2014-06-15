package org.anddev.andengine.opengl.view;

import java.util.concurrent.*;
import android.content.*;
import android.util.*;
import android.view.*;
import javax.microedition.khronos.egl.*;
import java.util.*;
import javax.microedition.khronos.opengles.*;

public class GLSurfaceView extends SurfaceView implements SurfaceHolder$Callback
{
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY;
    private static final Semaphore sEglSemaphore;
    private int mDebugFlags;
    private EGLConfigChooser mEGLConfigChooser;
    private GLThread mGLThread;
    private GLWrapper mGLWrapper;
    private boolean mHasSurface;
    private int mRenderMode;
    private Renderer mRenderer;
    private int mSurfaceHeight;
    private int mSurfaceWidth;
    
    static {
        sEglSemaphore = new Semaphore(1);
    }
    
    public GLSurfaceView(final Context context) {
        super(context);
        this.init();
    }
    
    public GLSurfaceView(final Context context, final AttributeSet set) {
        super(context, set);
        this.init();
    }
    
    private void init() {
        final SurfaceHolder holder = this.getHolder();
        holder.addCallback((SurfaceHolder$Callback)this);
        holder.setType(2);
        this.mRenderMode = 1;
    }
    
    public int getDebugFlags() {
        return this.mDebugFlags;
    }
    
    public int getRenderMode() {
        return this.mRenderMode;
    }
    
    public void onPause() {
        this.mGLThread.onPause();
        this.mGLThread.requestExitAndWait();
        this.mGLThread = null;
    }
    
    public void onResume() {
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        (this.mGLThread = new GLThread(this.mRenderer)).start();
        this.mGLThread.setRenderMode(this.mRenderMode);
        if (this.mHasSurface) {
            this.mGLThread.surfaceCreated();
        }
        if (this.mSurfaceWidth > 0 && this.mSurfaceHeight > 0) {
            this.mGLThread.onWindowResize(this.mSurfaceWidth, this.mSurfaceHeight);
        }
        this.mGLThread.onResume();
    }
    
    public void queueEvent(final Runnable runnable) {
        if (this.mGLThread != null) {
            this.mGLThread.queueEvent(runnable);
        }
    }
    
    public void requestRender() {
        this.mGLThread.requestRender();
    }
    
    public void setDebugFlags(final int mDebugFlags) {
        this.mDebugFlags = mDebugFlags;
    }
    
    public void setEGLConfigChooser(final int n, final int n2, final int n3, final int n4, final int n5, final int n6) {
        this.setEGLConfigChooser(new ComponentSizeChooser(n, n2, n3, n4, n5, n6));
    }
    
    public void setEGLConfigChooser(final EGLConfigChooser meglConfigChooser) {
        if (this.mRenderer != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
        this.mEGLConfigChooser = meglConfigChooser;
    }
    
    public void setEGLConfigChooser(final boolean b) {
        this.setEGLConfigChooser(new SimpleEGLConfigChooser(b));
    }
    
    public void setGLWrapper(final GLWrapper mglWrapper) {
        this.mGLWrapper = mglWrapper;
    }
    
    public void setRenderMode(final int n) {
        this.mRenderMode = n;
        if (this.mGLThread != null) {
            this.mGLThread.setRenderMode(n);
        }
    }
    
    public void setRenderer(final Renderer mRenderer) {
        if (this.mRenderer != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
        this.mRenderer = mRenderer;
    }
    
    public void surfaceChanged(final SurfaceHolder surfaceHolder, final int n, final int mSurfaceWidth, final int mSurfaceHeight) {
        if (this.mGLThread != null) {
            this.mGLThread.onWindowResize(mSurfaceWidth, mSurfaceHeight);
        }
        this.mSurfaceWidth = mSurfaceWidth;
        this.mSurfaceHeight = mSurfaceHeight;
    }
    
    public void surfaceCreated(final SurfaceHolder surfaceHolder) {
        if (this.mGLThread != null) {
            this.mGLThread.surfaceCreated();
        }
        this.mHasSurface = true;
    }
    
    public void surfaceDestroyed(final SurfaceHolder surfaceHolder) {
        if (this.mGLThread != null) {
            this.mGLThread.surfaceDestroyed();
        }
        this.mHasSurface = false;
    }
    
    class EglHelper
    {
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;
        
        public GL createSurface(final SurfaceHolder surfaceHolder) {
            if (this.mEglSurface != null) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
            }
            this.mEglSurface = this.mEgl.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, (Object)surfaceHolder, (int[])null);
            this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext);
            GL gl = this.mEglContext.getGL();
            if (GLSurfaceView.this.mGLWrapper != null) {
                gl = GLSurfaceView.this.mGLWrapper.wrap(gl);
            }
            return gl;
        }
        
        public void finish() {
            if (this.mEglSurface != null) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
                this.mEglSurface = null;
            }
            if (this.mEglContext != null) {
                this.mEgl.eglDestroyContext(this.mEglDisplay, this.mEglContext);
                this.mEglContext = null;
            }
            if (this.mEglDisplay != null) {
                this.mEgl.eglTerminate(this.mEglDisplay);
                this.mEglDisplay = null;
            }
        }
        
        public void start() {
            this.mEgl = (EGL10)EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            this.mEgl.eglInitialize(this.mEglDisplay, new int[2]);
            this.mEglConfig = GLSurfaceView.this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
            this.mEglContext = this.mEgl.eglCreateContext(this.mEglDisplay, this.mEglConfig, EGL10.EGL_NO_CONTEXT, (int[])null);
            this.mEglSurface = null;
        }
        
        public boolean swap() {
            this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
            return this.mEgl.eglGetError() != 12302;
        }
    }
    
    class GLThread extends Thread
    {
        private boolean mDone;
        private EglHelper mEglHelper;
        private final ArrayList<Runnable> mEventQueue;
        private boolean mHasSurface;
        private int mHeight;
        private boolean mPaused;
        private int mRenderMode;
        private final Renderer mRenderer;
        private boolean mRequestRender;
        private boolean mSizeChanged;
        private int mWidth;
        
        GLThread(final Renderer mRenderer) {
            super();
            this.mEventQueue = new ArrayList<Runnable>();
            this.mDone = false;
            this.mWidth = 0;
            this.mHeight = 0;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mRenderer = mRenderer;
            this.mSizeChanged = true;
            this.setName("GLThread");
        }
        
        private Runnable getEvent() {
            synchronized (this) {
                if (this.mEventQueue.size() > 0) {
                    return this.mEventQueue.remove(0);
                }
                return null;
            }
        }
        
        private void guardedRun() throws InterruptedException {
            (this.mEglHelper = new EglHelper()).start();
            GL10 gl10 = null;
            int n = 1;
            int n2 = 1;
        Label_0035:
            while (!this.mDone) {
                // monitorenter(this)
                boolean b = false;
            Label_0080_Outer:
                while (true) {
                    while (true) {
                        Label_0116: {
                            Runnable event;
                            try {
                                event = this.getEvent();
                                if (event == null) {
                                    final boolean mPaused = this.mPaused;
                                    b = false;
                                    if (mPaused) {
                                        this.mEglHelper.finish();
                                        b = true;
                                    }
                                    if (this.needToWait()) {
                                        break Label_0116;
                                    }
                                    if (this.mDone) {
                                        break Label_0035;
                                    }
                                    break;
                                }
                            }
                            finally {
                            }
                            // monitorexit(this)
                            event.run();
                            continue Label_0080_Outer;
                        }
                        this.wait();
                        continue;
                    }
                }
                boolean mSizeChanged = this.mSizeChanged;
                final int mWidth = this.mWidth;
                final int mHeight = this.mHeight;
                this.mSizeChanged = false;
                this.mRequestRender = false;
                // monitorexit(this)
                if (b) {
                    this.mEglHelper.start();
                    n = 1;
                    mSizeChanged = true;
                }
                if (mSizeChanged) {
                    gl10 = (GL10)this.mEglHelper.createSurface(GLSurfaceView.this.getHolder());
                    n2 = 1;
                }
                if (n != 0) {
                    this.mRenderer.onSurfaceCreated(gl10, this.mEglHelper.mEglConfig);
                    n = 0;
                }
                if (n2 != 0) {
                    this.mRenderer.onSurfaceChanged(gl10, mWidth, mHeight);
                    n2 = 0;
                }
                if (mWidth > 0 && mHeight > 0) {
                    this.mRenderer.onDrawFrame(gl10);
                    this.mEglHelper.swap();
                }
            }
            this.mEglHelper.finish();
        }
        
        private boolean needToWait() {
            if (!this.mDone) {
                if (this.mPaused || !this.mHasSurface) {
                    return true;
                }
                if (this.mWidth <= 0 || this.mHeight <= 0 || (!this.mRequestRender && this.mRenderMode != 1)) {
                    return true;
                }
            }
            return false;
        }
        
        public int getRenderMode() {
            synchronized (this) {
                return this.mRenderMode;
            }
        }
        
        public void onPause() {
            synchronized (this) {
                this.mPaused = true;
            }
        }
        
        public void onResume() {
            synchronized (this) {
                this.mPaused = false;
                this.notify();
            }
        }
        
        public void onWindowResize(final int mWidth, final int mHeight) {
            synchronized (this) {
                this.mWidth = mWidth;
                this.mHeight = mHeight;
                this.mSizeChanged = true;
                this.notify();
            }
        }
        
        public void queueEvent(final Runnable runnable) {
            synchronized (this) {
                this.mEventQueue.add(runnable);
            }
        }
        
        public void requestExitAndWait() {
            synchronized (this) {
                this.mDone = true;
                this.notify();
                // monitorexit(this)
                final GLThread glThread = this;
                glThread.join();
                return;
            }
            try {
                final GLThread glThread = this;
                glThread.join();
            }
            catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
            }
        }
        
        public void requestRender() {
            synchronized (this) {
                this.mRequestRender = true;
                this.notify();
            }
        }
        
        @Override
        public void run() {
            try {
                try {
                    GLSurfaceView.sEglSemaphore.acquire();
                    final GLThread glThread = this;
                    glThread.guardedRun();
                    return;
                }
                catch (InterruptedException ex) {
                    return;
                }
                try {
                    final GLThread glThread = this;
                    glThread.guardedRun();
                }
                catch (InterruptedException ex2) {}
            }
            finally {
                GLSurfaceView.sEglSemaphore.release();
            }
        }
        
        public void setRenderMode(final int mRenderMode) {
            if (mRenderMode < 0 || mRenderMode > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (this) {
                this.mRenderMode = mRenderMode;
                if (mRenderMode == 1) {
                    this.notify();
                }
            }
        }
        
        public void surfaceCreated() {
            synchronized (this) {
                this.mHasSurface = true;
                this.notify();
            }
        }
        
        public void surfaceDestroyed() {
            synchronized (this) {
                this.mHasSurface = false;
                this.notify();
            }
        }
    }
    
    public interface Renderer
    {
        void onDrawFrame(GL10 p0);
        
        void onSurfaceChanged(GL10 p0, int p1, int p2);
        
        void onSurfaceCreated(GL10 p0, EGLConfig p1);
    }
}
