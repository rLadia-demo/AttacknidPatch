package net.rbgrn.opengl;

import android.opengl.GLSurfaceView.EGLConfigChooser;
import android.opengl.GLSurfaceView.EGLContextFactory;
import android.opengl.GLSurfaceView.EGLWindowSurfaceFactory;
import android.opengl.GLSurfaceView.GLWrapper;
import android.view.SurfaceHolder;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;

class EglHelper
{
  private final GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
  private final GLSurfaceView.EGLContextFactory mEGLContextFactory;
  private final GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
  private EGL10 mEgl;
  EGLConfig mEglConfig;
  private EGLContext mEglContext;
  private EGLDisplay mEglDisplay;
  private EGLSurface mEglSurface;
  private final GLSurfaceView.GLWrapper mGLWrapper;
  
  public EglHelper(GLSurfaceView.EGLConfigChooser paramEGLConfigChooser, GLSurfaceView.EGLContextFactory paramEGLContextFactory, GLSurfaceView.EGLWindowSurfaceFactory paramEGLWindowSurfaceFactory, GLSurfaceView.GLWrapper paramGLWrapper)
  {
    this.mEGLConfigChooser = paramEGLConfigChooser;
    this.mEGLContextFactory = paramEGLContextFactory;
    this.mEGLWindowSurfaceFactory = paramEGLWindowSurfaceFactory;
    this.mGLWrapper = paramGLWrapper;
  }
  
  public GL createSurface(SurfaceHolder paramSurfaceHolder)
  {
    if ((this.mEglSurface != null) && (this.mEglSurface != EGL10.EGL_NO_SURFACE))
    {
      this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
      this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
    }
    this.mEglSurface = this.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, paramSurfaceHolder);
    if ((this.mEglSurface == null) || (this.mEglSurface == EGL10.EGL_NO_SURFACE)) {
      throw new RuntimeException("createWindowSurface failed");
    }
    if (!this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
      throw new RuntimeException("eglMakeCurrent failed.");
    }
    GL localGL = this.mEglContext.getGL();
    if (this.mGLWrapper != null) {
      localGL = this.mGLWrapper.wrap(localGL);
    }
    return localGL;
  }
  
  public void destroySurface()
  {
    if ((this.mEglSurface != null) && (this.mEglSurface != EGL10.EGL_NO_SURFACE))
    {
      this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
      this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
      this.mEglSurface = null;
    }
  }
  
  public void finish()
  {
    if (this.mEglContext != null)
    {
      this.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
      this.mEglContext = null;
    }
    if (this.mEglDisplay != null)
    {
      this.mEgl.eglTerminate(this.mEglDisplay);
      this.mEglDisplay = null;
    }
  }
  
  public void start()
  {
    this.mEgl = ((EGL10)EGLContext.getEGL());
    this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
    int[] arrayOfInt = new int[2];
    this.mEgl.eglInitialize(this.mEglDisplay, arrayOfInt);
    this.mEglConfig = this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
    this.mEglContext = this.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
    if ((this.mEglContext == null) || (this.mEglContext == EGL10.EGL_NO_CONTEXT)) {
      throw new RuntimeException("createContext failed");
    }
    this.mEglSurface = null;
  }
  
  public boolean swap()
  {
    this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
    return this.mEgl.eglGetError() != 12302;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     net.rbgrn.opengl.EglHelper
 * JD-Core Version:    0.7.0.1
 */