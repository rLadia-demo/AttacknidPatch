package org.anddev.andengine.entity;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;

public abstract class Entity
  implements IEntity
{
  private boolean mIgnoreUpdate;
  private boolean mVisible = true;
  private int mZIndex = 0;
  
  public Entity() {}
  
  public Entity(int paramInt)
  {
    this.mZIndex = paramInt;
  }
  
  public int getZIndex()
  {
    return this.mZIndex;
  }
  
  public boolean isIgnoreUpdate()
  {
    return this.mIgnoreUpdate;
  }
  
  public boolean isVisible()
  {
    return this.mVisible;
  }
  
  public final void onDraw(GL10 paramGL10, Camera paramCamera)
  {
    if (this.mVisible) {
      onManagedDraw(paramGL10, paramCamera);
    }
  }
  
  protected abstract void onManagedDraw(GL10 paramGL10, Camera paramCamera);
  
  protected abstract void onManagedUpdate(float paramFloat);
  
  public final void onUpdate(float paramFloat)
  {
    if (!this.mIgnoreUpdate) {
      onManagedUpdate(paramFloat);
    }
  }
  
  public void reset()
  {
    this.mVisible = true;
    this.mIgnoreUpdate = false;
  }
  
  public void setIgnoreUpdate(boolean paramBoolean)
  {
    this.mIgnoreUpdate = paramBoolean;
  }
  
  public void setVisible(boolean paramBoolean)
  {
    this.mVisible = paramBoolean;
  }
  
  public void setZIndex(int paramInt)
  {
    this.mZIndex = paramInt;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.Entity
 * JD-Core Version:    0.7.0.1
 */