package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.scene.Scene.ITouchArea;

public abstract class BaseLayer
  extends Entity
  implements ILayer
{
  private final ArrayList<Scene.ITouchArea> mTouchAreas = new ArrayList();
  
  public BaseLayer() {}
  
  public BaseLayer(int paramInt)
  {
    super(paramInt);
  }
  
  public ArrayList<Scene.ITouchArea> getTouchAreas()
  {
    return this.mTouchAreas;
  }
  
  public void registerTouchArea(Scene.ITouchArea paramITouchArea)
  {
    this.mTouchAreas.add(paramITouchArea);
  }
  
  public void unregisterTouchArea(Scene.ITouchArea paramITouchArea)
  {
    this.mTouchAreas.remove(paramITouchArea);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.BaseLayer
 * JD-Core Version:    0.7.0.1
 */