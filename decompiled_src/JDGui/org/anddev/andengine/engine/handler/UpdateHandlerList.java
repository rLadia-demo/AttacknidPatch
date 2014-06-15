package org.anddev.andengine.engine.handler;

import java.util.ArrayList;

public class UpdateHandlerList
  extends ArrayList<IUpdateHandler>
  implements IUpdateHandler
{
  private static final long serialVersionUID = -8842562717687229277L;
  
  public void onUpdate(float paramFloat)
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((IUpdateHandler)get(i)).onUpdate(paramFloat);
    }
  }
  
  public void reset()
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((IUpdateHandler)get(i)).reset();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.handler.UpdateHandlerList
 * JD-Core Version:    0.7.0.1
 */