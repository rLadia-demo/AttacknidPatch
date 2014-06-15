/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.egl.EGL10
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.egl.EGLDisplay
 */
package org.anddev.andengine.opengl.view;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;
import org.anddev.andengine.opengl.view.EGLConfigChooser;

abstract class BaseConfigChooser
implements EGLConfigChooser {
    protected final int[] mConfigSpec;

    public BaseConfigChooser(int[] arrn) {
        this.mConfigSpec = arrn;
    }

    @Override
    public EGLConfig chooseConfig(EGL10 eGL10, EGLDisplay eGLDisplay) {
        int[] arrn = new int[1];
        eGL10.eglChooseConfig(eGLDisplay, this.mConfigSpec, (EGLConfig[])null, 0, arrn);
        int n = arrn[0];
        if (n <= 0) {
            throw new IllegalArgumentException("No configs match configSpec");
        }
        EGLConfig[] arreGLConfig = new EGLConfig[n];
        eGL10.eglChooseConfig(eGLDisplay, this.mConfigSpec, arreGLConfig, n, arrn);
        EGLConfig eGLConfig = this.chooseConfig(eGL10, eGLDisplay, arreGLConfig);
        if (eGLConfig != null) return eGLConfig;
        throw new IllegalArgumentException("No config chosen");
    }

    abstract EGLConfig chooseConfig(EGL10 var1, EGLDisplay var2, EGLConfig[] var3);
}

