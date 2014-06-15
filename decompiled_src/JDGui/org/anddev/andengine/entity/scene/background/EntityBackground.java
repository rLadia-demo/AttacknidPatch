package org.anddev.andengine.entity.scene.background;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;

public class EntityBackground
  extends ColorBackground
{
  protected IEntity mEntity;
  
  public EntityBackground(float paramFloat1, float paramFloat2, float paramFloat3, IEntity paramIEntity)
  {
    super(paramFloat1, paramFloat2, paramFloat3);
    this.mEntity = paramIEntity;
  }
  
  public EntityBackground(IEntity paramIEntity)
  {
    this.mEntity = paramIEntity;
  }
  
  public void onDraw(GL10 paramGL10, Camera paramCamera)
  {
    super.onDraw(paramGL10, paramCamera);
    this.mEntity.onDraw(paramGL10, paramCamera);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.EntityBackground
 * JD-Core Version:    0.7.0.1
 */