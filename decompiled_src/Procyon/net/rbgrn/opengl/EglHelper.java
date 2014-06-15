package net.rbgrn.opengl;

import javax.microedition.khronos.egl.*;
import android.opengl.*;
import android.view.*;
import javax.microedition.khronos.opengles.*;

class EglHelper
{
    private final GLSurfaceView$EGLConfigChooser mEGLConfigChooser;
    private final GLSurfaceView$EGLContextFactory mEGLContextFactory;
    private final GLSurfaceView$EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private EGL10 mEgl;
    EGLConfig mEglConfig;
    private EGLContext mEglContext;
    private EGLDisplay mEglDisplay;
    private EGLSurface mEglSurface;
    private final GLSurfaceView$GLWrapper mGLWrapper;
    
    public EglHelper(final GLSurfaceView$EGLConfigChooser meglConfigChooser, final GLSurfaceView$EGLContextFactory meglContextFactory, final GLSurfaceView$EGLWindowSurfaceFactory meglWindowSurfaceFactory, final GLSurfaceView$GLWrapper mglWrapper) {
        super();
        this.mEGLConfigChooser = meglConfigChooser;
        this.mEGLContextFactory = meglContextFactory;
        this.mEGLWindowSurfaceFactory = meglWindowSurfaceFactory;
        this.mGLWrapper = mglWrapper;
    }
    
    public GL createSurface(final SurfaceHolder surfaceHolder) {
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
        GL gl = this.mEglContext.getGL();
        if (this.mGLWrapper != null) {
            gl = this.mGLWrapper.wrap(gl);
        }
        return gl;
    }
    
    public void destroySurface() {
        if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
            this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
            this.mEglSurface = null;
        }
    }
    
    public void finish() {
        if (this.mEglContext != null) {
            this.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
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
        this.mEglConfig = this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
        this.mEglContext = this.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
        if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
            throw new RuntimeException("createContext failed");
        }
        this.mEglSurface = null;
    }
    
    public boolean swap() {
        this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
        return this.mEgl.eglGetError() != 12302;
    }
}
