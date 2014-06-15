package org.anddev.andengine.util;

import org.anddev.progressmonitor.IProgressListener;

public abstract interface ProgressCallable<T>
{
  public abstract T call(IProgressListener paramIProgressListener)
    throws Exception;
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.ProgressCallable
 * JD-Core Version:    0.7.0.1
 */