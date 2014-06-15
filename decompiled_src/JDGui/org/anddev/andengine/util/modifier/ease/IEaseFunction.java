package org.anddev.andengine.util.modifier.ease;

public abstract interface IEaseFunction
{
  public static final IEaseFunction DEFAULT = ;
  
  public abstract float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.IEaseFunction
 * JD-Core Version:    0.7.0.1
 */