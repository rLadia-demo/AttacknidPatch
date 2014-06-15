package org.anddev.andengine.opengl.view;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

abstract class BaseConfigChooser
  implements EGLConfigChooser
{
  protected final int[] mConfigSpec;
  
  public BaseConfigChooser(int[] paramArrayOfInt)
  {
    this.mConfigSpec = paramArrayOfInt;
  }
  
  public EGLConfig chooseConfig(EGL10 paramEGL10, EGLDisplay paramEGLDisplay)
  {
    int[] arrayOfInt = new int[1];
    paramEGL10.eglChooseConfig(paramEGLDisplay, this.mConfigSpec, null, 0, arrayOfInt);
    int i = arrayOfInt[0];
    if (i <= 0) {
      throw new IllegalArgumentException("No configs match configSpec");
    }
    EGLConfig[] arrayOfEGLConfig = new EGLConfig[i];
    paramEGL10.eglChooseConfig(paramEGLDisplay, this.mConfigSpec, arrayOfEGLConfig, i, arrayOfInt);
    EGLConfig localEGLConfig = chooseConfig(paramEGL10, paramEGLDisplay, arrayOfEGLConfig);
    if (localEGLConfig == null) {
      throw new IllegalArgumentException("No config chosen");
    }
    return localEGLConfig;
  }
  
  abstract EGLConfig chooseConfig(EGL10 paramEGL10, EGLDisplay paramEGLDisplay, EGLConfig[] paramArrayOfEGLConfig);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.view.BaseConfigChooser
 * JD-Core Version:    0.7.0.1
 */