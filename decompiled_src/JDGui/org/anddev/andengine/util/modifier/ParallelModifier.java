package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.util.ModifierUtils;

public class ParallelModifier<T>
  extends BaseModifier<T>
{
  private final float mDuration;
  private boolean mFinishedCached;
  private final IModifier<T>[] mModifiers;
  
  public ParallelModifier(IModifier.IModifierListener<T> paramIModifierListener, IModifier<T>... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIModifierListener);
    if (paramVarArgs.length == 0) {
      throw new IllegalArgumentException("pModifiers must not be empty!");
    }
    this.mModifiers = paramVarArgs;
    IModifier localIModifier = ModifierUtils.getModifierWithLongestDuration(paramVarArgs);
    this.mDuration = localIModifier.getDuration();
    localIModifier.setModifierListener(new InternalModifierListener(null));
  }
  
  protected ParallelModifier(ParallelModifier<T> paramParallelModifier)
  {
    super(paramParallelModifier.mModifierListener);
    IModifier[] arrayOfIModifier1 = paramParallelModifier.mModifiers;
    this.mModifiers = new IModifier[arrayOfIModifier1.length];
    IModifier[] arrayOfIModifier2 = this.mModifiers;
    for (int i = -1 + arrayOfIModifier2.length;; i--)
    {
      if (i < 0)
      {
        IModifier localIModifier = ModifierUtils.getModifierWithLongestDuration(arrayOfIModifier2);
        this.mDuration = localIModifier.getDuration();
        localIModifier.setModifierListener(new InternalModifierListener(null));
        return;
      }
      arrayOfIModifier2[i] = arrayOfIModifier1[i].clone();
    }
  }
  
  public ParallelModifier(IModifier<T>... paramVarArgs)
    throws IllegalArgumentException
  {
    this(null, paramVarArgs);
  }
  
  public ParallelModifier<T> clone()
  {
    return new ParallelModifier(this);
  }
  
  public float getDuration()
  {
    return this.mDuration;
  }
  
  public void onUpdate(float paramFloat, T paramT)
  {
    this.mFinishedCached = false;
    IModifier[] arrayOfIModifier = this.mModifiers;
    for (int i = -1 + arrayOfIModifier.length;; i--)
    {
      if (i < 0) {
        this.mFinishedCached = false;
      }
      do
      {
        return;
        arrayOfIModifier[i].onUpdate(paramFloat, paramT);
      } while (this.mFinishedCached);
    }
  }
  
  public void reset()
  {
    this.mFinished = false;
    IModifier[] arrayOfIModifier = this.mModifiers;
    for (int i = -1 + arrayOfIModifier.length;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfIModifier[i].reset();
    }
  }
  
  private class InternalModifierListener
    implements IModifier.IModifierListener<T>
  {
    private InternalModifierListener() {}
    
    public void onModifierFinished(IModifier<T> paramIModifier, T paramT)
    {
      ParallelModifier.this.mFinished = true;
      ParallelModifier.this.mFinishedCached = true;
      if (ParallelModifier.this.mModifierListener != null) {
        ParallelModifier.this.mModifierListener.onModifierFinished(ParallelModifier.this, paramT);
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ParallelModifier
 * JD-Core Version:    0.7.0.1
 */