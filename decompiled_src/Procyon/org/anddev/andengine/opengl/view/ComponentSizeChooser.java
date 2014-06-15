package org.anddev.andengine.opengl.view;

import javax.microedition.khronos.egl.*;

public class ComponentSizeChooser extends BaseConfigChooser
{
    protected int mAlphaSize;
    protected int mBlueSize;
    protected int mDepthSize;
    protected int mGreenSize;
    protected int mRedSize;
    protected int mStencilSize;
    private final int[] mValue;
    
    public ComponentSizeChooser(final int mRedSize, final int mGreenSize, final int mBlueSize, final int mAlphaSize, final int mDepthSize, final int mStencilSize) {
        super(new int[] { 12324, mRedSize, 12323, mGreenSize, 12322, mBlueSize, 12321, mAlphaSize, 12325, mDepthSize, 12326, mStencilSize, 12344 });
        this.mValue = new int[1];
        this.mRedSize = mRedSize;
        this.mGreenSize = mGreenSize;
        this.mBlueSize = mBlueSize;
        this.mAlphaSize = mAlphaSize;
        this.mDepthSize = mDepthSize;
        this.mStencilSize = mStencilSize;
    }
    
    private int findConfigAttrib(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLConfig eglConfig, final int n, int n2) {
        if (egl10.eglGetConfigAttrib(eglDisplay, eglConfig, n, this.mValue)) {
            n2 = this.mValue[0];
        }
        return n2;
    }
    
    public EGLConfig chooseConfig(final EGL10 egl10, final EGLDisplay eglDisplay, final EGLConfig[] array) {
        EGLConfig eglConfig = null;
        int n = 1000;
        for (final EGLConfig eglConfig2 : array) {
            final int n2 = Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12324, 0) - this.mRedSize) + Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12323, 0) - this.mGreenSize) + Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12322, 0) - this.mBlueSize) + Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12321, 0) - this.mAlphaSize) + Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12325, 0) - this.mDepthSize) + Math.abs(this.findConfigAttrib(egl10, eglDisplay, eglConfig2, 12326, 0) - this.mStencilSize);
            if (n2 < n) {
                n = n2;
                eglConfig = eglConfig2;
            }
        }
        return eglConfig;
    }
}
