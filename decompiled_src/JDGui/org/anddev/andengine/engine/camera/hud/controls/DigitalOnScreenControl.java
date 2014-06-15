package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class DigitalOnScreenControl
  extends BaseOnScreenControl
{
  public DigitalOnScreenControl(int paramInt1, int paramInt2, Camera paramCamera, TextureRegion paramTextureRegion1, TextureRegion paramTextureRegion2, float paramFloat, BaseOnScreenControl.IOnScreenControlListener paramIOnScreenControlListener)
  {
    super(paramInt1, paramInt2, paramCamera, paramTextureRegion1, paramTextureRegion2, paramFloat, paramIOnScreenControlListener);
  }
  
  protected void onUpdateControlKnob(float paramFloat1, float paramFloat2)
  {
    if ((paramFloat1 == 0.0F) && (paramFloat2 == 0.0F)) {
      super.onUpdateControlKnob(0.0F, 0.0F);
    }
    if (Math.abs(paramFloat1) > Math.abs(paramFloat2)) {
      if (paramFloat1 > 0.0F) {
        super.onUpdateControlKnob(0.5F, 0.0F);
      }
    }
    do
    {
      do
      {
        return;
        if (paramFloat1 < 0.0F)
        {
          super.onUpdateControlKnob(-0.5F, 0.0F);
          return;
        }
      } while (paramFloat1 != 0.0F);
      super.onUpdateControlKnob(0.0F, 0.0F);
      return;
      if (paramFloat2 > 0.0F)
      {
        super.onUpdateControlKnob(0.0F, 0.5F);
        return;
      }
      if (paramFloat2 < 0.0F)
      {
        super.onUpdateControlKnob(0.0F, -0.5F);
        return;
      }
    } while (paramFloat2 != 0.0F);
    super.onUpdateControlKnob(0.0F, 0.0F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.hud.controls.DigitalOnScreenControl
 * JD-Core Version:    0.7.0.1
 */