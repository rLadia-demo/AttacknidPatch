/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.util.AttributeSet
 *  android.view.SurfaceHolder
 *  android.view.SurfaceHolder$Callback
 *  android.view.SurfaceView
 *  javax.microedition.khronos.egl.EGL10
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.egl.EGLContext
 *  javax.microedition.khronos.egl.EGLDisplay
 *  javax.microedition.khronos.egl.EGLSurface
 *  javax.microedition.khronos.opengles.GL
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.view.ComponentSizeChooser;
import org.anddev.andengine.opengl.view.EGLConfigChooser;
import org.anddev.andengine.opengl.view.GLWrapper;
import org.anddev.andengine.opengl.view.SimpleEGLConfigChooser;

public class GLSurfaceView
extends SurfaceView
implements SurfaceHolder.Callback {
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
        GLSurfaceView.sEglSemaphore = new Semaphore(1);
    }

    public GLSurfaceView(Context context) {
        super(context);
        this.init();
    }

    public GLSurfaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.init();
    }

    private void init() {
        SurfaceHolder surfaceHolder = this.getHolder();
        surfaceHolder.addCallback((SurfaceHolder.Callback)this);
        surfaceHolder.setType(2);
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
        this.mGLThread = new GLThread(this.mRenderer);
        this.mGLThread.start();
        this.mGLThread.setRenderMode(this.mRenderMode);
        if (this.mHasSurface) {
            this.mGLThread.surfaceCreated();
        }
        if (this.mSurfaceWidth > 0 && this.mSurfaceHeight > 0) {
            this.mGLThread.onWindowResize(this.mSurfaceWidth, this.mSurfaceHeight);
        }
        this.mGLThread.onResume();
    }

    public void queueEvent(Runnable runnable) {
        if (this.mGLThread == null) return;
        this.mGLThread.queueEvent(runnable);
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void setDebugFlags(int n) {
        this.mDebugFlags = n;
    }

    public void setEGLConfigChooser(int n, int n2, int n3, int n4, int n5, int n6) {
        this.setEGLConfigChooser(new ComponentSizeChooser(n, n2, n3, n4, n5, n6));
    }

    public void setEGLConfigChooser(EGLConfigChooser eGLConfigChooser) {
        if (this.mRenderer != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
        this.mEGLConfigChooser = eGLConfigChooser;
    }

    public void setEGLConfigChooser(boolean bl) {
        this.setEGLConfigChooser(new SimpleEGLConfigChooser(bl));
    }

    public void setGLWrapper(GLWrapper gLWrapper) {
        this.mGLWrapper = gLWrapper;
    }

    public void setRenderMode(int n) {
        this.mRenderMode = n;
        if (this.mGLThread == null) return;
        this.mGLThread.setRenderMode(n);
    }

    public void setRenderer(Renderer renderer) {
        if (this.mRenderer != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
        this.mRenderer = renderer;
    }

    public void surfaceChanged(SurfaceHolder surfaceHolder2, int surfaceHolder2, int n, int n2) {
        if (this.mGLThread != null) {
            this.mGLThread.onWindowResize(n, n2);
        }
        this.mSurfaceWidth = n;
        this.mSurfaceHeight = n2;
    }

    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        if (this.mGLThread != null) {
            this.mGLThread.surfaceCreated();
        }
        this.mHasSurface = true;
    }

    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        if (this.mGLThread != null) {
            this.mGLThread.surfaceDestroyed();
        }
        this.mHasSurface = false;
    }

    class EglHelper {
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;

        public GL createSurface(SurfaceHolder surfaceHolder) {
            if (this.mEglSurface != null) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
            }
            this.mEglSurface = this.mEgl.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, (Object)surfaceHolder, (int[])null);
            this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext);
            GL gL = this.mEglContext.getGL();
            if (GLSurfaceView.this.mGLWrapper == null) return gL;
            gL = GLSurfaceView.this.mGLWrapper.wrap(gL);
            return gL;
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
            if (this.mEglDisplay == null) return;
            this.mEgl.eglTerminate(this.mEglDisplay);
            this.mEglDisplay = null;
        }

        public void start() {
            this.mEgl = (EGL10)EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            int[] arrn = new int[2];
            this.mEgl.eglInitialize(this.mEglDisplay, arrn);
            this.mEglConfig = GLSurfaceView.this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
            this.mEglContext = this.mEgl.eglCreateContext(this.mEglDisplay, this.mEglConfig, EGL10.EGL_NO_CONTEXT, (int[])null);
            this.mEglSurface = null;
        }

        public boolean swap() {
            this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
            if (this.mEgl.eglGetError() == 12302) return false;
            return true;
        }
    }

    class GLThread
    extends Thread {
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

        GLThread(Renderer renderer) {
            this.mEventQueue = new ArrayList<Runnable>();
            this.mDone = false;
            this.mWidth = 0;
            this.mHeight = 0;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mRenderer = renderer;
            this.mSizeChanged = true;
            this.setName("GLThread");
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        private Runnable getEvent() {
            synchronized (this) {
                if (this.mEventQueue.size() <= 0) return null;
                return this.mEventQueue.remove(0);
            }
        }

        /*
         * Unable to fully structure code
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         * Converted monitor instructions to comments
         */
        private void guardedRun() throws InterruptedException {
            this.mEglHelper = new EglHelper();
            this.mEglHelper.start();
            var1_1 = null;
            var2_2 = true;
            var3_3 = true;
            block3 : while (!this.mDone) {
                // MONITORENTER : this
                do {
                    if ((var5_4 = this.getEvent()) == null) {
                        var6_5 = this.mPaused;
                        var7_6 = false;
                        if (var6_5) {
                            break;
                        } else {
                            ** GOTO lbl18
                        }
                    }
                    var5_4.run();
                } while (true);
                this.mEglHelper.finish();
                var7_6 = true;
lbl18: // 3 sources:
                do {
                    if (!this.needToWait()) {
                        if (!this.mDone) break;
                        // MONITOREXIT : this
                        break block3;
                    }
                    this.wait();
                } while (true);
                var8_7 = this.mSizeChanged;
                var9_8 = this.mWidth;
                var10_9 = this.mHeight;
                this.mSizeChanged = false;
                this.mRequestRender = false;
                // MONITOREXIT : this
                if (var7_6) {
                    this.mEglHelper.start();
                    var2_2 = true;
                    var8_7 = true;
                }
                if (var8_7) {
                    var1_1 = (GL10)this.mEglHelper.createSurface(GLSurfaceView.this.getHolder());
                    var3_3 = true;
                }
                if (var2_2) {
                    this.mRenderer.onSurfaceCreated(var1_1, this.mEglHelper.mEglConfig);
                    var2_2 = false;
                }
                if (var3_3) {
                    this.mRenderer.onSurfaceChanged(var1_1, var9_8, var10_9);
                    var3_3 = false;
                }
                if (var9_8 <= 0 || var10_9 <= 0) continue;
                this.mRenderer.onDrawFrame(var1_1);
                this.mEglHelper.swap();
            }
            this.mEglHelper.finish();
        }

        /*
         * Enabled aggressive block sorting
         */
        private boolean needToWait() {
            if (this.mDone) {
                return false;
            }
            if (this.mPaused) return true;
            if (!this.mHasSurface) {
                return true;
            }
            if (this.mWidth <= 0) return true;
            if (this.mHeight <= 0) return true;
            if (this.mRequestRender) return false;
            if (this.mRenderMode == 1) return false;
            return true;
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public int getRenderMode() {
            synchronized (this) {
                return this.mRenderMode;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void onPause() {
            synchronized (this) {
                this.mPaused = true;
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void onResume() {
            synchronized (this) {
                this.mPaused = false;
                this.notify();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void onWindowResize(int n, int n2) {
            synchronized (this) {
                this.mWidth = n;
                this.mHeight = n2;
                this.mSizeChanged = true;
                this.notify();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void queueEvent(Runnable runnable) {
            synchronized (this) {
                this.mEventQueue.add(runnable);
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void requestExitAndWait() {
            synchronized (this) {
                this.mDone = true;
                this.notify();
            }
            try {
                this.join();
                return;
            }
            catch (InterruptedException var2_1) {
                Thread.currentThread().interrupt();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void requestRender() {
            synchronized (this) {
                this.mRequestRender = true;
                this.notify();
                return;
            }
        }

        /*
         * Loose catch block
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        @Override
        public void run() {
            try {
                GLSurfaceView.sEglSemaphore.acquire();
                this.guardedRun();
                return;
                catch (InterruptedException interruptedException) {
                    GLSurfaceView.sEglSemaphore.release();
                    return;
                }
                catch (InterruptedException interruptedException2) {
                    GLSurfaceView.sEglSemaphore.release();
                    return;
                }
            }
            finally {
                GLSurfaceView.sEglSemaphore.release();
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void setRenderMode(int n) {
            if (n < 0) throw new IllegalArgumentException("renderMode");
            if (n > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (this) {
                this.mRenderMode = n;
                if (n != 1) return;
                this.notify();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void surfaceCreated() {
            synchronized (this) {
                this.mHasSurface = true;
                this.notify();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void surfaceDestroyed() {
            synchronized (this) {
                this.mHasSurface = false;
                this.notify();
                return;
            }
        }
    }

    public interface Renderer {
        public void onDrawFrame(GL10 var1);

        public void onSurfaceChanged(GL10 var1, int var2, int var3);

        public void onSurfaceCreated(GL10 var1, EGLConfig var2);
    }

}

