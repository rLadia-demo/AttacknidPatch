package org.anddev.andengine.opengl.view;

import javax.microedition.khronos.egl.*;

public interface EGLConfigChooser
{
    EGLConfig chooseConfig(EGL10 p0, EGLDisplay p1);
}
