package org.anddev.andengine.opengl.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLSurfaceView
  extends SurfaceView
  implements SurfaceHolder.Callback
{
  public static final int DEBUG_CHECK_GL_ERROR = 1;
  public static final int DEBUG_LOG_GL_CALLS = 2;
  public static final int RENDERMODE_CONTINUOUSLY = 1;
  public static final int RENDERMODE_WHEN_DIRTY;
  private static final Semaphore sEglSemaphore = new Semaphore(1);
  private int mDebugFlags;
  private EGLConfigChooser mEGLConfigChooser;
  private GLThread mGLThread;
  private GLWrapper mGLWrapper;
  private boolean mHasSurface;
  private int mRenderMode;
  private Renderer mRenderer;
  private int mSurfaceHeight;
  private int mSurfaceWidth;
  
  public GLSurfaceView(Context paramContext)
  {
    super(paramContext);
    init();
  }
  
  public GLSurfaceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  private void init()
  {
    SurfaceHolder localSurfaceHolder = getHolder();
    localSurfaceHolder.addCallback(this);
    localSurfaceHolder.setType(2);
    this.mRenderMode = 1;
  }
  
  public int getDebugFlags()
  {
    return this.mDebugFlags;
  }
  
  public int getRenderMode()
  {
    return this.mRenderMode;
  }
  
  public void onPause()
  {
    this.mGLThread.onPause();
    this.mGLThread.requestExitAndWait();
    this.mGLThread = null;
  }
  
  public void onResume()
  {
    if (this.mEGLConfigChooser == null) {
      this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
    }
    this.mGLThread = new GLThread(this.mRenderer);
    this.mGLThread.start();
    this.mGLThread.setRenderMode(this.mRenderMode);
    if (this.mHasSurface) {
      this.mGLThread.surfaceCreated();
    }
    if ((this.mSurfaceWidth > 0) && (this.mSurfaceHeight > 0)) {
      this.mGLThread.onWindowResize(this.mSurfaceWidth, this.mSurfaceHeight);
    }
    this.mGLThread.onResume();
  }
  
  public void queueEvent(Runnable paramRunnable)
  {
    if (this.mGLThread != null) {
      this.mGLThread.queueEvent(paramRunnable);
    }
  }
  
  public void requestRender()
  {
    this.mGLThread.requestRender();
  }
  
  public void setDebugFlags(int paramInt)
  {
    this.mDebugFlags = paramInt;
  }
  
  public void setEGLConfigChooser(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    setEGLConfigChooser(new ComponentSizeChooser(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6));
  }
  
  public void setEGLConfigChooser(EGLConfigChooser paramEGLConfigChooser)
  {
    if (this.mRenderer != null) {
      throw new IllegalStateException("setRenderer has already been called for this instance.");
    }
    this.mEGLConfigChooser = paramEGLConfigChooser;
  }
  
  public void setEGLConfigChooser(boolean paramBoolean)
  {
    setEGLConfigChooser(new SimpleEGLConfigChooser(paramBoolean));
  }
  
  public void setGLWrapper(GLWrapper paramGLWrapper)
  {
    this.mGLWrapper = paramGLWrapper;
  }
  
  public void setRenderMode(int paramInt)
  {
    this.mRenderMode = paramInt;
    if (this.mGLThread != null) {
      this.mGLThread.setRenderMode(paramInt);
    }
  }
  
  public void setRenderer(Renderer paramRenderer)
  {
    if (this.mRenderer != null) {
      throw new IllegalStateException("setRenderer has already been called for this instance.");
    }
    this.mRenderer = paramRenderer;
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    if (this.mGLThread != null) {
      this.mGLThread.onWindowResize(paramInt2, paramInt3);
    }
    this.mSurfaceWidth = paramInt2;
    this.mSurfaceHeight = paramInt3;
  }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    if (this.mGLThread != null) {
      this.mGLThread.surfaceCreated();
    }
    this.mHasSurface = true;
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    if (this.mGLThread != null) {
      this.mGLThread.surfaceDestroyed();
    }
    this.mHasSurface = false;
  }
  
  class EglHelper
  {
    EGL10 mEgl;
    EGLConfig mEglConfig;
    EGLContext mEglContext;
    EGLDisplay mEglDisplay;
    EGLSurface mEglSurface;
    
    public EglHelper() {}
    
    public GL createSurface(SurfaceHolder paramSurfaceHolder)
    {
      if (this.mEglSurface != null)
      {
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
      }
      this.mEglSurface = this.mEgl.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, paramSurfaceHolder, null);
      this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext);
      GL localGL = this.mEglContext.getGL();
      if (GLSurfaceView.this.mGLWrapper != null) {
        localGL = GLSurfaceView.this.mGLWrapper.wrap(localGL);
      }
      return localGL;
    }
    
    public void finish()
    {
      if (this.mEglSurface != null)
      {
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
        this.mEglSurface = null;
      }
      if (this.mEglContext != null)
      {
        this.mEgl.eglDestroyContext(this.mEglDisplay, this.mEglContext);
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
      this.mEglConfig = GLSurfaceView.this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
      this.mEglContext = this.mEgl.eglCreateContext(this.mEglDisplay, this.mEglConfig, EGL10.EGL_NO_CONTEXT, null);
      this.mEglSurface = null;
    }
    
    public boolean swap()
    {
      this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
      return this.mEgl.eglGetError() != 12302;
    }
  }
  
  class GLThread
    extends Thread
  {
    private boolean mDone = false;
    private GLSurfaceView.EglHelper mEglHelper;
    private final ArrayList<Runnable> mEventQueue = new ArrayList();
    private boolean mHasSurface;
    private int mHeight = 0;
    private boolean mPaused;
    private int mRenderMode = 1;
    private final GLSurfaceView.Renderer mRenderer;
    private boolean mRequestRender = true;
    private boolean mSizeChanged;
    private int mWidth = 0;
    
    GLThread(GLSurfaceView.Renderer paramRenderer)
    {
      this.mRenderer = paramRenderer;
      this.mSizeChanged = true;
      setName("GLThread");
    }
    
    private Runnable getEvent()
    {
      try
      {
        if (this.mEventQueue.size() > 0)
        {
          Runnable localRunnable = (Runnable)this.mEventQueue.remove(0);
          return localRunnable;
        }
        return null;
      }
      finally {}
    }
    
    private void guardedRun()
      throws InterruptedException
    {
      this.mEglHelper = new GLSurfaceView.EglHelper(GLSurfaceView.this);
      this.mEglHelper.start();
      GL10 localGL10 = null;
      int i = 1;
      int j = 1;
      for (;;)
      {
        if (this.mDone)
        {
          this.mEglHelper.finish();
          return;
        }
        int k;
        for (;;)
        {
          Runnable localRunnable;
          try
          {
            localRunnable = getEvent();
            if (localRunnable == null)
            {
              boolean bool1 = this.mPaused;
              k = 0;
              if (bool1)
              {
                this.mEglHelper.finish();
                k = 1;
              }
              if (needToWait()) {
                break label116;
              }
              if (!this.mDone) {
                break label123;
              }
              break;
            }
          }
          finally {}
          localRunnable.run();
          continue;
          label116:
          wait();
        }
        label123:
        boolean bool2 = this.mSizeChanged;
        int m = this.mWidth;
        int n = this.mHeight;
        this.mSizeChanged = false;
        this.mRequestRender = false;
        if (k != 0)
        {
          this.mEglHelper.start();
          i = 1;
          bool2 = true;
        }
        if (bool2)
        {
          localGL10 = (GL10)this.mEglHelper.createSurface(GLSurfaceView.this.getHolder());
          j = 1;
        }
        if (i != 0)
        {
          this.mRenderer.onSurfaceCreated(localGL10, this.mEglHelper.mEglConfig);
          i = 0;
        }
        if (j != 0)
        {
          this.mRenderer.onSurfaceChanged(localGL10, m, n);
          j = 0;
        }
        if ((m > 0) && (n > 0))
        {
          this.mRenderer.onDrawFrame(localGL10);
          this.mEglHelper.swap();
        }
      }
    }
    
    private boolean needToWait()
    {
      if (this.mDone) {}
      do
      {
        return false;
        if ((this.mPaused) || (!this.mHasSurface)) {
          return true;
        }
      } while ((this.mWidth > 0) && (this.mHeight > 0) && ((this.mRequestRender) || (this.mRenderMode == 1)));
      return true;
    }
    
    public int getRenderMode()
    {
      try
      {
        int i = this.mRenderMode;
        return i;
      }
      finally {}
    }
    
    public void onPause()
    {
      try
      {
        this.mPaused = true;
        return;
      }
      finally {}
    }
    
    public void onResume()
    {
      try
      {
        this.mPaused = false;
        notify();
        return;
      }
      finally {}
    }
    
    public void onWindowResize(int paramInt1, int paramInt2)
    {
      try
      {
        this.mWidth = paramInt1;
        this.mHeight = paramInt2;
        this.mSizeChanged = true;
        notify();
        return;
      }
      finally {}
    }
    
    public void queueEvent(Runnable paramRunnable)
    {
      try
      {
        this.mEventQueue.add(paramRunnable);
        return;
      }
      finally {}
    }
    
    /* Error */
    public void requestExitAndWait()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: iconst_1
      //   4: putfield 37	org/anddev/andengine/opengl/view/GLSurfaceView$GLThread:mDone	Z
      //   7: aload_0
      //   8: invokevirtual 140	java/lang/Object:notify	()V
      //   11: aload_0
      //   12: monitorexit
      //   13: aload_0
      //   14: invokevirtual 152	org/anddev/andengine/opengl/view/GLSurfaceView$GLThread:join	()V
      //   17: return
      //   18: astore_1
      //   19: aload_0
      //   20: monitorexit
      //   21: aload_1
      //   22: athrow
      //   23: astore_2
      //   24: invokestatic 156	java/lang/Thread:currentThread	()Ljava/lang/Thread;
      //   27: invokevirtual 159	java/lang/Thread:interrupt	()V
      //   30: return
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	31	0	this	GLThread
      //   18	4	1	localObject	Object
      //   23	1	2	localInterruptedException	InterruptedException
      // Exception table:
      //   from	to	target	type
      //   2	13	18	finally
      //   19	21	18	finally
      //   13	17	23	java/lang/InterruptedException
    }
    
    public void requestRender()
    {
      try
      {
        this.mRequestRender = true;
        notify();
        return;
      }
      finally {}
    }
    
    /* Error */
    public void run()
    {
      // Byte code:
      //   0: invokestatic 164	org/anddev/andengine/opengl/view/GLSurfaceView:access$0	()Ljava/util/concurrent/Semaphore;
      //   3: invokevirtual 169	java/util/concurrent/Semaphore:acquire	()V
      //   6: aload_0
      //   7: invokespecial 171	org/anddev/andengine/opengl/view/GLSurfaceView$GLThread:guardedRun	()V
      //   10: invokestatic 164	org/anddev/andengine/opengl/view/GLSurfaceView:access$0	()Ljava/util/concurrent/Semaphore;
      //   13: invokevirtual 174	java/util/concurrent/Semaphore:release	()V
      //   16: return
      //   17: astore_2
      //   18: invokestatic 164	org/anddev/andengine/opengl/view/GLSurfaceView:access$0	()Ljava/util/concurrent/Semaphore;
      //   21: invokevirtual 174	java/util/concurrent/Semaphore:release	()V
      //   24: return
      //   25: astore_3
      //   26: invokestatic 164	org/anddev/andengine/opengl/view/GLSurfaceView:access$0	()Ljava/util/concurrent/Semaphore;
      //   29: invokevirtual 174	java/util/concurrent/Semaphore:release	()V
      //   32: return
      //   33: astore_1
      //   34: invokestatic 164	org/anddev/andengine/opengl/view/GLSurfaceView:access$0	()Ljava/util/concurrent/Semaphore;
      //   37: invokevirtual 174	java/util/concurrent/Semaphore:release	()V
      //   40: aload_1
      //   41: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	42	0	this	GLThread
      //   33	8	1	localObject	Object
      //   17	1	2	localInterruptedException1	InterruptedException
      //   25	1	3	localInterruptedException2	InterruptedException
      // Exception table:
      //   from	to	target	type
      //   0	6	17	java/lang/InterruptedException
      //   6	10	25	java/lang/InterruptedException
      //   0	6	33	finally
      //   6	10	33	finally
    }
    
    public void setRenderMode(int paramInt)
    {
      if ((paramInt < 0) || (paramInt > 1)) {
        throw new IllegalArgumentException("renderMode");
      }
      try
      {
        this.mRenderMode = paramInt;
        if (paramInt == 1) {
          notify();
        }
        return;
      }
      finally {}
    }
    
    public void surfaceCreated()
    {
      try
      {
        this.mHasSurface = true;
        notify();
        return;
      }
      finally {}
    }
    
    public void surfaceDestroyed()
    {
      try
      {
        this.mHasSurface = false;
        notify();
        return;
      }
      finally {}
    }
  }
  
  public static abstract interface Renderer
  {
    public abstract void onDrawFrame(GL10 paramGL10);
    
    public abstract void onSurfaceChanged(GL10 paramGL10, int paramInt1, int paramInt2);
    
    public abstract void onSurfaceCreated(GL10 paramGL10, EGLConfig paramEGLConfig);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.view.GLSurfaceView
 * JD-Core Version:    0.7.0.1
 */