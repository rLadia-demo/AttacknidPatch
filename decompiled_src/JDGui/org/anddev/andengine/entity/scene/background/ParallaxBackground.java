package org.anddev.andengine.entity.scene.background;

import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.Shape;

public class ParallaxBackground
  extends ColorBackground
{
  private final ArrayList<ParallaxEntity> mParallaxEntities = new ArrayList();
  private int mParallaxEntityCount;
  protected float mParallaxValue;
  
  public ParallaxBackground(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    super(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public void addParallaxEntity(ParallaxEntity paramParallaxEntity)
  {
    this.mParallaxEntities.add(paramParallaxEntity);
    this.mParallaxEntityCount = (1 + this.mParallaxEntityCount);
  }
  
  public void onDraw(GL10 paramGL10, Camera paramCamera)
  {
    super.onDraw(paramGL10, paramCamera);
    float f = this.mParallaxValue;
    ArrayList localArrayList = this.mParallaxEntities;
    for (int i = 0;; i++)
    {
      if (i >= this.mParallaxEntityCount) {
        return;
      }
      ((ParallaxEntity)localArrayList.get(i)).onDraw(paramGL10, f, paramCamera);
    }
  }
  
  public boolean removeParallaxEntity(ParallaxEntity paramParallaxEntity)
  {
    this.mParallaxEntityCount = (-1 + this.mParallaxEntityCount);
    boolean bool = this.mParallaxEntities.remove(paramParallaxEntity);
    if (!bool) {
      this.mParallaxEntityCount = (1 + this.mParallaxEntityCount);
    }
    return bool;
  }
  
  public void setParallaxValue(float paramFloat)
  {
    this.mParallaxValue = paramFloat;
  }
  
  public static class ParallaxEntity
  {
    final float mParallaxFactor;
    final Shape mShape;
    
    public ParallaxEntity(float paramFloat, Shape paramShape)
    {
      this.mParallaxFactor = paramFloat;
      this.mShape = paramShape;
    }
    
    public void onDraw(GL10 paramGL10, float paramFloat, Camera paramCamera)
    {
      paramGL10.glPushMatrix();
      float f1 = paramCamera.getWidth();
      float f2 = this.mShape.getWidthScaled();
      for (float f3 = paramFloat * this.mParallaxFactor % f2;; f3 -= f2) {
        if (f3 <= 0.0F)
        {
          paramGL10.glTranslatef(f3, 0.0F, 0.0F);
          float f4 = f3;
          do
          {
            this.mShape.onDraw(paramGL10, paramCamera);
            paramGL10.glTranslatef(f2, 0.0F, 0.0F);
            f4 += f2;
          } while (f4 < f1);
          paramGL10.glPopMatrix();
          return;
        }
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.ParallaxBackground
 * JD-Core Version:    0.7.0.1
 */