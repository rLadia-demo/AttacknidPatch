package org.anddev.andengine.opengl.view;

import android.content.Context;
import android.util.AttributeSet;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.Debug;

public class RenderSurfaceView
  extends GLSurfaceView
{
  private Renderer mRenderer;
  
  public RenderSurfaceView(Context paramContext)
  {
    super(paramContext);
  }
  
  public RenderSurfaceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    this.mRenderer.mEngine.getEngineOptions().getResolutionPolicy().onMeasure(this, paramInt1, paramInt2);
  }
  
  public void setMeasuredDimensionProxy(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(paramInt1, paramInt2);
  }
  
  public void setRenderer(Engine paramEngine)
  {
    setOnTouchListener(paramEngine);
    this.mRenderer = new Renderer(paramEngine);
    setRenderer(this.mRenderer);
  }
  
  public static class Renderer
    implements GLSurfaceView.Renderer
  {
    private final Engine mEngine;
    
    public Renderer(Engine paramEngine)
    {
      this.mEngine = paramEngine;
    }
    
    public void onDrawFrame(GL10 paramGL10)
    {
      try
      {
        this.mEngine.onDrawFrame(paramGL10);
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        Debug.e("GLThread interrupted!", localInterruptedException);
      }
    }
    
    public void onSurfaceChanged(GL10 paramGL10, int paramInt1, int paramInt2)
    {
      Debug.d("onSurfaceChanged: pWidth=" + paramInt1 + "  pHeight=" + paramInt2);
      this.mEngine.setSurfaceSize(paramInt1, paramInt2);
      paramGL10.glViewport(0, 0, paramInt1, paramInt2);
      paramGL10.glLoadIdentity();
    }
    
    public void onSurfaceCreated(GL10 paramGL10, EGLConfig paramEGLConfig)
    {
      Debug.d("onSurfaceCreated");
      GLHelper.reset(paramGL10);
      GLHelper.setPerspectiveCorrectionHintFastest(paramGL10);
      GLHelper.setShadeModelFlat(paramGL10);
      GLHelper.disableLightning(paramGL10);
      GLHelper.disableDither(paramGL10);
      GLHelper.disableDepthTest(paramGL10);
      GLHelper.disableMultisample(paramGL10);
      GLHelper.enableBlend(paramGL10);
      GLHelper.enableTextures(paramGL10);
      GLHelper.enableTexCoordArray(paramGL10);
      GLHelper.enableVertexArray(paramGL10);
      GLHelper.enableCulling(paramGL10);
      paramGL10.glFrontFace(2305);
      paramGL10.glCullFace(1029);
      GLHelper.enableExtensions(paramGL10, this.mEngine.getEngineOptions().getRenderOptions());
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.view.RenderSurfaceView
 * JD-Core Version:    0.7.0.1
 */