/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.opengl.GLSurfaceView
 *  android.opengl.GLSurfaceView$EGLWindowSurfaceFactory
 *  javax.microedition.khronos.egl.EGL10
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.egl.EGLDisplay
 *  javax.microedition.khronos.egl.EGLSurface
 */
package net.rbgrn.opengl;

import android.opengl.GLSurfaceView;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;

class DefaultWindowSurfaceFactory
implements GLSurfaceView.EGLWindowSurfaceFactory {
    DefaultWindowSurfaceFactory() {
    }

    public EGLSurface createWindowSurface(EGL10 eGL10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object object) {
        return eGL10.eglCreateWindowSurface(eGLDisplay, eGLConfig, object, (int[])null);
    }

    public void destroySurface(EGL10 eGL10, EGLDisplay eGLDisplay, EGLSurface eGLSurface) {
        eGL10.eglDestroySurface(eGLDisplay, eGLSurface);
    }
}

