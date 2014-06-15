package org.anddev.andengine.entity.scene.background;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;

public class ColorBackground
  extends BaseBackground
{
  private float mAlpha = 1.0F;
  private float mBlue = 0.0F;
  private boolean mColorEnabled = true;
  private float mGreen = 0.0F;
  private float mRed = 0.0F;
  
  protected ColorBackground() {}
  
  public ColorBackground(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this.mRed = paramFloat1;
    this.mGreen = paramFloat2;
    this.mBlue = paramFloat3;
  }
  
  public ColorBackground(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mRed = paramFloat1;
    this.mGreen = paramFloat2;
    this.mBlue = paramFloat3;
    this.mAlpha = paramFloat4;
  }
  
  public boolean isColorEnabled()
  {
    return this.mColorEnabled;
  }
  
  public void onDraw(GL10 paramGL10, Camera paramCamera)
  {
    if (this.mColorEnabled)
    {
      paramGL10.glClearColor(this.mRed, this.mGreen, this.mBlue, this.mAlpha);
      paramGL10.glClear(16384);
    }
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this.mRed = paramFloat1;
    this.mGreen = paramFloat2;
    this.mBlue = paramFloat3;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    setColor(paramFloat1, paramFloat2, paramFloat3);
    this.mAlpha = paramFloat4;
  }
  
  public void setColor(int paramInt1, int paramInt2, int paramInt3)
    throws IllegalArgumentException
  {
    setColor(paramInt1 / 255.0F, paramInt2 / 255.0F, paramInt3 / 255.0F);
  }
  
  public void setColor(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    setColor(paramInt1 / 255.0F, paramInt2 / 255.0F, paramInt3 / 255.0F, paramInt4 / 255.0F);
  }
  
  public void setColorEnabled(boolean paramBoolean)
  {
    this.mColorEnabled = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.ColorBackground
 * JD-Core Version:    0.7.0.1
 */