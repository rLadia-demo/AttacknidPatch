/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.opengl.GLSurfaceView
 *  android.opengl.GLSurfaceView$EGLConfigChooser
 *  android.opengl.GLSurfaceView$EGLContextFactory
 *  android.opengl.GLSurfaceView$EGLWindowSurfaceFactory
 *  android.opengl.GLSurfaceView$GLWrapper
 *  android.view.SurfaceHolder
 */
package net.rbgrn.opengl;

import android.opengl.GLSurfaceView;
import android.view.SurfaceHolder;
import java.util.ArrayList;
import net.rbgrn.opengl.EglHelper;
import org.anddev.andengine.opengl.view.GLSurfaceView;

class GLThread
extends Thread {
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean LOG_THREADS;
    public boolean mDone;
    private final GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
    private final GLSurfaceView.EGLContextFactory mEGLContextFactory;
    private final GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private EglHelper mEglHelper;
    private GLThread mEglOwner;
    private final ArrayList<Runnable> mEventQueue;
    private boolean mEventsWaiting;
    private final GLSurfaceView.GLWrapper mGLWrapper;
    private boolean mHasSurface;
    private boolean mHaveEgl;
    private int mHeight;
    public SurfaceHolder mHolder;
    private boolean mPaused;
    private int mRenderMode;
    private final GLSurfaceView.Renderer mRenderer;
    private boolean mRequestRender;
    private boolean mSizeChanged;
    private boolean mWaitingForSurface;
    private int mWidth;
    private final GLThreadManager sGLThreadManager;

    GLThread(GLSurfaceView.Renderer renderer, GLSurfaceView.EGLConfigChooser eGLConfigChooser, GLSurfaceView.EGLContextFactory eGLContextFactory, GLSurfaceView.EGLWindowSurfaceFactory eGLWindowSurfaceFactory, GLSurfaceView.GLWrapper gLWrapper) {
        this.sGLThreadManager = new GLThreadManager(null);
        this.mSizeChanged = true;
        this.mEventQueue = new ArrayList<Runnable>();
        this.mDone = false;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mRequestRender = true;
        this.mRenderMode = 1;
        this.mRenderer = renderer;
        this.mEGLConfigChooser = eGLConfigChooser;
        this.mEGLContextFactory = eGLContextFactory;
        this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
        this.mGLWrapper = gLWrapper;
    }

    static /* synthetic */ void access$1(GLThread gLThread, GLThread gLThread2) {
        gLThread.mEglOwner = gLThread2;
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
     * Exception decompiling
     */
    private void guardedRun() throws InterruptedException {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: Tried to end blocks [21[DOLOOP]], but top level block is 6[TRYBLOCK]
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.processEndingBlocks(Op04StructuredStatement.java:406)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.buildNestedBlocks(Op04StructuredStatement.java:458)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.createInitialStructuredBlock(Op03SimpleStatement.java:2648)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:670)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
        // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
        // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
        // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
        // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
        // org.benf.cfr.reader.Main.doJar(Main.java:116)
        // org.benf.cfr.reader.Main.main(Main.java:167)
        throw new IllegalStateException("Decompilation failed");
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    private boolean isDone() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            return this.mDone;
        }
    }

    private void stopEglLocked() {
        if (!this.mHaveEgl) return;
        this.mHaveEgl = false;
        this.mEglHelper.destroySurface();
        this.mEglHelper.finish();
        this.sGLThreadManager.releaseEglSurface(this);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public int getRenderMode() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            return this.mRenderMode;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void onPause() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mPaused = true;
            this.sGLThreadManager.notifyAll();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void onResume() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mPaused = false;
            this.mRequestRender = true;
            this.sGLThreadManager.notifyAll();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void onWindowResize(int n, int n2) {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mWidth = n;
            this.mHeight = n2;
            this.mSizeChanged = true;
            this.sGLThreadManager.notifyAll();
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
            GLThreadManager gLThreadManager = this.sGLThreadManager;
            synchronized (gLThreadManager) {
                this.mEventsWaiting = true;
                this.sGLThreadManager.notifyAll();
                return;
            }
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void requestExitAndWait() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mDone = true;
            this.sGLThreadManager.notifyAll();
        }
        try {
            this.join();
            return;
        }
        catch (InterruptedException var3_2) {
            Thread.currentThread().interrupt();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void requestRender() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mRequestRender = true;
            this.sGLThreadManager.notifyAll();
            return;
        }
    }

    @Override
    public void run() {
        this.setName("GLThread " + this.getId());
        try {
            this.guardedRun();
            return;
        }
        catch (InterruptedException var2_1) {
            return;
        }
        finally {
            this.sGLThreadManager.threadExiting(this);
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
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mRenderMode = n;
            if (n != 1) return;
            this.sGLThreadManager.notifyAll();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.mHolder = surfaceHolder;
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mHasSurface = true;
            this.sGLThreadManager.notifyAll();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void surfaceDestroyed() {
        GLThreadManager gLThreadManager = this.sGLThreadManager;
        synchronized (gLThreadManager) {
            this.mHasSurface = false;
            this.sGLThreadManager.notifyAll();
            while (!this.mWaitingForSurface) {
                if (!this.isAlive()) return;
                if (this.mDone) return;
                try {
                    this.sGLThreadManager.wait();
                }
                catch (InterruptedException var3_2) {
                    Thread.currentThread().interrupt();
                }
            }
            return;
        }
    }

    class GLThreadManager {
        private GLThreadManager() {
        }

        /* synthetic */ GLThreadManager(GLThread gLThread, GLThreadManager gLThreadManager) {
            this();
        }

        public void releaseEglSurface(GLThread gLThread) {
            synchronized (this) {
                if (this$0.mEglOwner == gLThread) {
                    GLThread.access$1(this$0, null);
                }
                this.notifyAll();
                return;
            }
        }

        public void threadExiting(GLThread gLThread) {
            synchronized (this) {
                gLThread.mDone = true;
                if (this$0.mEglOwner == gLThread) {
                    GLThread.access$1(this$0, null);
                }
                this.notifyAll();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public boolean tryAcquireEglSurface(GLThread gLThread) {
            synchronized (this) {
                if (this$0.mEglOwner != gLThread) {
                    if (this$0.mEglOwner != null) return false;
                }
                GLThread.access$1(this$0, gLThread);
                this.notifyAll();
                return true;
            }
        }
    }

}

