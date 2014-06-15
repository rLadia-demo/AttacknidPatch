package net.rbgrn.opengl;

import android.opengl.*;
import javax.microedition.khronos.egl.*;

class DefaultWindowSurfaceFactory implements GLSurfaceView$EGLWindowSurfaceFactory
{
    public EGLSurface createWindowSurface(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLConfig eglConfig, final Object o) {
        return egl10.eglCreateWindowSurface(eglDisplay, eglConfig, o, (int[])null);
    }
    
    public void destroySurface(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLSurface eglSurface) {
        egl10.eglDestroySurface(eglDisplay, eglSurface);
    }
}
