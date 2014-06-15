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
import org.anddev.andengine.opengl.view.BaseConfigChooser;

public class ComponentSizeChooser
extends BaseConfigChooser {
    protected int mAlphaSize;
    protected int mBlueSize;
    protected int mDepthSize;
    protected int mGreenSize;
    protected int mRedSize;
    protected int mStencilSize;
    private final int[] mValue = new int[1];

    public ComponentSizeChooser(int n, int n2, int n3, int n4, int n5, int n6) {
        super(new int[]{12324, n, 12323, n2, 12322, n3, 12321, n4, 12325, n5, 12326, n6, 12344});
        this.mRedSize = n;
        this.mGreenSize = n2;
        this.mBlueSize = n3;
        this.mAlphaSize = n4;
        this.mDepthSize = n5;
        this.mStencilSize = n6;
    }

    private int findConfigAttrib(EGL10 eGL10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int n, int n2) {
        if (!eGL10.eglGetConfigAttrib(eGLDisplay, eGLConfig, n, this.mValue)) return n2;
        n2 = this.mValue[0];
        return n2;
    }

    @Override
    public EGLConfig chooseConfig(EGL10 eGL10, EGLDisplay eGLDisplay, EGLConfig[] arreGLConfig) {
        EGLConfig eGLConfig = null;
        int n = 1000;
        int n2 = arreGLConfig.length;
        int n3 = 0;
        while (n3 < n2) {
            int n4;
            int n5;
            EGLConfig eGLConfig2 = arreGLConfig[n3];
            int n6 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12324, 0);
            int n7 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12323, 0);
            int n8 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12322, 0);
            int n9 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12321, 0);
            int n10 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12325, 0);
            if ((n5 = Math.abs(n6 - this.mRedSize) + Math.abs(n7 - this.mGreenSize) + Math.abs(n8 - this.mBlueSize) + Math.abs(n9 - this.mAlphaSize) + Math.abs(n10 - this.mDepthSize) + Math.abs((n4 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12326, 0)) - this.mStencilSize)) < n) {
                n = n5;
                eGLConfig = eGLConfig2;
            }
            ++n3;
        }
        return eGLConfig;
    }
}

