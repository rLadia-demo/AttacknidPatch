package net.rbgrn.opengl;

import android.opengl.GLSurfaceView.EGLConfigChooser;
import android.opengl.GLSurfaceView.EGLContextFactory;
import android.opengl.GLSurfaceView.EGLWindowSurfaceFactory;
import android.opengl.GLSurfaceView.GLWrapper;
import android.service.wallpaper.WallpaperService;
import android.service.wallpaper.WallpaperService.Engine;
import android.util.Log;
import android.view.SurfaceHolder;
import org.anddev.andengine.opengl.view.GLSurfaceView.Renderer;

public class GLWallpaperService
  extends WallpaperService
{
  private static final String TAG = "GLWallpaperService";
  
  public void onCreate()
  {
    super.onCreate();
  }
  
  public WallpaperService.Engine onCreateEngine()
  {
    return new GLEngine();
  }
  
  public void onDestroy()
  {
    super.onDestroy();
  }
  
  public class GLEngine
    extends WallpaperService.Engine
  {
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY;
    private int mDebugFlags;
    private GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
    private GLSurfaceView.EGLContextFactory mEGLContextFactory;
    private GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private GLThread mGLThread;
    private GLSurfaceView.GLWrapper mGLWrapper;
    
    public GLEngine()
    {
      super();
    }
    
    private void checkRenderThreadState()
    {
      if (this.mGLThread != null) {
        throw new IllegalStateException("setRenderer has already been called for this instance.");
      }
    }
    
    public int getDebugFlags()
    {
      return this.mDebugFlags;
    }
    
    public int getRenderMode()
    {
      return this.mGLThread.getRenderMode();
    }
    
    public void onCreate(SurfaceHolder paramSurfaceHolder)
    {
      super.onCreate(paramSurfaceHolder);
    }
    
    public void onDestroy()
    {
      super.onDestroy();
    }
    
    public void onPause()
    {
      this.mGLThread.onPause();
    }
    
    public void onResume()
    {
      this.mGLThread.onResume();
    }
    
    public void onSurfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
    {
      this.mGLThread.onWindowResize(paramInt2, paramInt3);
      super.onSurfaceChanged(paramSurfaceHolder, paramInt1, paramInt2, paramInt3);
    }
    
    public void onSurfaceCreated(SurfaceHolder paramSurfaceHolder)
    {
      Log.d("GLWallpaperService", "onSurfaceCreated()");
      this.mGLThread.surfaceCreated(paramSurfaceHolder);
      super.onSurfaceCreated(paramSurfaceHolder);
    }
    
    public void onSurfaceDestroyed(SurfaceHolder paramSurfaceHolder)
    {
      Log.d("GLWallpaperService", "onSurfaceDestroyed()");
      this.mGLThread.surfaceDestroyed();
      super.onSurfaceDestroyed(paramSurfaceHolder);
    }
    
    public void onVisibilityChanged(boolean paramBoolean)
    {
      if (paramBoolean) {
        onResume();
      }
      for (;;)
      {
        super.onVisibilityChanged(paramBoolean);
        return;
        onPause();
      }
    }
    
    public void queueEvent(Runnable paramRunnable)
    {
      this.mGLThread.queueEvent(paramRunnable);
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
      setEGLConfigChooser(new BaseConfigChooser.ComponentSizeChooser(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6));
    }
    
    public void setEGLConfigChooser(GLSurfaceView.EGLConfigChooser paramEGLConfigChooser)
    {
      checkRenderThreadState();
      this.mEGLConfigChooser = paramEGLConfigChooser;
    }
    
    public void setEGLConfigChooser(boolean paramBoolean)
    {
      setEGLConfigChooser(new BaseConfigChooser.SimpleEGLConfigChooser(paramBoolean));
    }
    
    public void setEGLContextFactory(GLSurfaceView.EGLContextFactory paramEGLContextFactory)
    {
      checkRenderThreadState();
      this.mEGLContextFactory = paramEGLContextFactory;
    }
    
    public void setEGLWindowSurfaceFactory(GLSurfaceView.EGLWindowSurfaceFactory paramEGLWindowSurfaceFactory)
    {
      checkRenderThreadState();
      this.mEGLWindowSurfaceFactory = paramEGLWindowSurfaceFactory;
    }
    
    public void setGLWrapper(GLSurfaceView.GLWrapper paramGLWrapper)
    {
      this.mGLWrapper = paramGLWrapper;
    }
    
    public void setRenderMode(int paramInt)
    {
      this.mGLThread.setRenderMode(paramInt);
    }
    
    public void setRenderer(GLSurfaceView.Renderer paramRenderer)
    {
      checkRenderThreadState();
      if (this.mEGLConfigChooser == null) {
        this.mEGLConfigChooser = new BaseConfigChooser.SimpleEGLConfigChooser(true);
      }
      if (this.mEGLContextFactory == null) {
        this.mEGLContextFactory = new DefaultContextFactory();
      }
      if (this.mEGLWindowSurfaceFactory == null) {
        this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
      }
      this.mGLThread = new GLThread(paramRenderer, this.mEGLConfigChooser, this.mEGLContextFactory, this.mEGLWindowSurfaceFactory, this.mGLWrapper);
      this.mGLThread.start();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     net.rbgrn.opengl.GLWallpaperService
 * JD-Core Version:    0.7.0.1
 */