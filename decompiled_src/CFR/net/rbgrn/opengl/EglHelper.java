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
 *  javax.microedition.khronos.egl.EGL10
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.egl.EGLContext
 *  javax.microedition.khronos.egl.EGLDisplay
 *  javax.microedition.khronos.egl.EGLSurface
 *  javax.microedition.khronos.opengles.GL
 */
package net.rbgrn.opengl;

import android.opengl.GLSurfaceView;
import android.view.SurfaceHolder;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;

class EglHelper {
    private final GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
    private final GLSurfaceView.EGLContextFactory mEGLContextFactory;
    private final GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private EGL10 mEgl;
    EGLConfig mEglConfig;
    private EGLContext mEglContext;
    private EGLDisplay mEglDisplay;
    private EGLSurface mEglSurface;
    private final GLSurfaceView.GLWrapper mGLWrapper;

    public EglHelper(GLSurfaceView.EGLConfigChooser eGLConfigChooser, GLSurfaceView.EGLContextFactory eGLContextFactory, GLSurfaceView.EGLWindowSurfaceFactory eGLWindowSurfaceFactory, GLSurfaceView.GLWrapper gLWrapper) {
        this.mEGLConfigChooser = eGLConfigChooser;
        this.mEGLContextFactory = eGLContextFactory;
        this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
        this.mGLWrapper = gLWrapper;
    }

    public GL createSurface(SurfaceHolder surfaceHolder) {
        if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
            this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
        }
        this.mEglSurface = this.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, (Object)surfaceHolder);
        if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
            throw new RuntimeException("createWindowSurface failed");
        }
        if (!this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
            throw new RuntimeException("eglMakeCurrent failed.");
        }
        GL gL = this.mEglContext.getGL();
        if (this.mGLWrapper == null) return gL;
        gL = this.mGLWrapper.wrap(gL);
        return gL;
    }

    public void destroySurface() {
        if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) return;
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
        this.mEglSurface = null;
    }

    public void finish() {
        if (this.mEglContext != null) {
            this.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
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
        this.mEglConfig = this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
        this.mEglContext = this.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
        if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
            throw new RuntimeException("createContext failed");
        }
        this.mEglSurface = null;
    }

    public boolean swap() {
        this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
        if (this.mEgl.eglGetError() == 12302) return false;
        return true;
    }
}

