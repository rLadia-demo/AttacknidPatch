/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.opengl.GLSurfaceView
 *  android.opengl.GLSurfaceView$EGLConfigChooser
 *  javax.microedition.khronos.egl.EGL10
 *  javax.microedition.khronos.egl.EGLConfig
 *  javax.microedition.khronos.egl.EGLDisplay
 */
package net.rbgrn.opengl;

import android.opengl.GLSurfaceView;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

abstract class BaseConfigChooser
implements GLSurfaceView.EGLConfigChooser {
    protected int[] mConfigSpec;

    public BaseConfigChooser(int[] arrn) {
        this.mConfigSpec = arrn;
    }

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

    public static class ComponentSizeChooser
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

        public EGLConfig chooseConfig(EGL10 eGL10, EGLDisplay eGLDisplay, EGLConfig[] arreGLConfig) {
            EGLConfig eGLConfig = null;
            int n = 1000;
            int n2 = arreGLConfig.length;
            int n3 = 0;
            while (n3 < n2) {
                EGLConfig eGLConfig2 = arreGLConfig[n3];
                int n4 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12325, 0);
                int n5 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12326, 0);
                if (n4 >= this.mDepthSize && n5 >= this.mStencilSize) {
                    int n6;
                    int n7;
                    int n8 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12324, 0);
                    int n9 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12323, 0);
                    int n10 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12322, 0);
                    if ((n7 = Math.abs(n8 - this.mRedSize) + Math.abs(n9 - this.mGreenSize) + Math.abs(n10 - this.mBlueSize) + Math.abs((n6 = this.findConfigAttrib(eGL10, eGLDisplay, eGLConfig2, 12321, 0)) - this.mAlphaSize)) < n) {
                        n = n7;
                        eGLConfig = eGLConfig2;
                    }
                }
                ++n3;
            }
            return eGLConfig;
        }
    }

    public static class SimpleEGLConfigChooser
    extends ComponentSizeChooser {
        /*
         * Enabled aggressive block sorting
         */
        public SimpleEGLConfigChooser(boolean bl) {
            int n = bl ? 16 : 0;
            super(4, 4, 4, 0, n, 0);
            this.mRedSize = 5;
            this.mGreenSize = 6;
            this.mBlueSize = 5;
        }
    }

}

