package org.anddev.andengine.opengl.view;

import javax.microedition.khronos.egl.*;

abstract class BaseConfigChooser implements EGLConfigChooser
{
    protected final int[] mConfigSpec;
    
    public BaseConfigChooser(final int[] mConfigSpec) {
        super();
        this.mConfigSpec = mConfigSpec;
    }
    
    @Override
    public EGLConfig chooseConfig(final EGL10 egl10, final EGLDisplay eglDisplay) {
        final int[] array = { 0 };
        egl10.eglChooseConfig(eglDisplay, this.mConfigSpec, (EGLConfig[])null, 0, array);
        final int n = array[0];
        if (n <= 0) {
            throw new IllegalArgumentException("No configs match configSpec");
        }
        final EGLConfig[] array2 = new EGLConfig[n];
        egl10.eglChooseConfig(eglDisplay, this.mConfigSpec, array2, n, array);
        final EGLConfig chooseConfig = this.chooseConfig(egl10, eglDisplay, array2);
        if (chooseConfig == null) {
            throw new IllegalArgumentException("No config chosen");
        }
        return chooseConfig;
    }
    
    abstract EGLConfig chooseConfig(final EGL10 p0, final EGLDisplay p1, final EGLConfig[] p2);
}
