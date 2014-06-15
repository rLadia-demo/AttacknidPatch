package org.anddev.andengine.engine.options;

public class TouchOptions
{
  private boolean mRunOnUpdateThread;
  
  public TouchOptions disableRunOnUpdateThread()
  {
    return setRunOnUpdateThread(false);
  }
  
  public TouchOptions enableRunOnUpdateThread()
  {
    return setRunOnUpdateThread(true);
  }
  
  public boolean isRunOnUpdateThread()
  {
    return this.mRunOnUpdateThread;
  }
  
  public TouchOptions setRunOnUpdateThread(boolean paramBoolean)
  {
    this.mRunOnUpdateThread = paramBoolean;
    return this;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.TouchOptions
 * JD-Core Version:    0.7.0.1
 */