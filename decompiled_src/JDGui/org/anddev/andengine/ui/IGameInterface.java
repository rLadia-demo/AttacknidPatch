package org.anddev.andengine.ui;

import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.entity.scene.Scene;

public abstract interface IGameInterface
{
  public abstract void onGamePaused();
  
  public abstract void onGameResumed();
  
  public abstract void onLoadComplete();
  
  public abstract Engine onLoadEngine();
  
  public abstract void onLoadResources();
  
  public abstract Scene onLoadScene();
  
  public abstract void onUnloadResources();
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.IGameInterface
 * JD-Core Version:    0.7.0.1
 */