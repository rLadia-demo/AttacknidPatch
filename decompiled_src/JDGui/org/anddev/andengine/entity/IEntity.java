package org.anddev.andengine.entity;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.opengl.IDrawable;

public abstract interface IEntity
  extends IDrawable, IUpdateHandler
{
  public abstract int getZIndex();
  
  public abstract void setZIndex(int paramInt);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.IEntity
 * JD-Core Version:    0.7.0.1
 */