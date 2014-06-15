package org.anddev.andengine.util;

public abstract interface AsyncCallable<T>
{
  public abstract void call(Callback<T> paramCallback, Callback<Exception> paramCallback1);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.AsyncCallable
 * JD-Core Version:    0.7.0.1
 */