package net.rbgrn.opengl;

import android.opengl.*;
import javax.microedition.khronos.egl.*;

class DefaultContextFactory implements GLSurfaceView$EGLContextFactory
{
    public EGLContext createContext(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLConfig eglConfig) {
        return egl10.eglCreateContext(eglDisplay, eglConfig, EGL10.EGL_NO_CONTEXT, (int[])null);
    }
    
    public void destroyContext(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLContext eglContext) {
        egl10.eglDestroyContext(eglDisplay, eglContext);
    }
}
