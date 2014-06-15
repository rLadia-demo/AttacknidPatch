package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.util.ModifierUtils;

public class SequenceModifier<T>
  extends BaseModifier<T>
{
  private int mCurrentSubSequenceModifier;
  private final float mDuration;
  private ISubSequenceModifierListener<T> mSubSequenceModifierListener;
  private final IModifier<T>[] mSubSequenceModifiers;
  
  public SequenceModifier(IModifier.IModifierListener<T> paramIModifierListener, ISubSequenceModifierListener<T> paramISubSequenceModifierListener, IModifier<T>... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIModifierListener);
    if (paramVarArgs.length == 0) {
      throw new IllegalArgumentException("pModifiers must not be empty!");
    }
    this.mSubSequenceModifierListener = paramISubSequenceModifierListener;
    this.mSubSequenceModifiers = paramVarArgs;
    this.mDuration = ModifierUtils.getSequenceDurationOfModifier(paramVarArgs);
    paramVarArgs[0].setModifierListener(new InternalModifierListener(null));
  }
  
  public SequenceModifier(IModifier.IModifierListener<T> paramIModifierListener, IModifier<T>... paramVarArgs)
    throws IllegalArgumentException
  {
    this(paramIModifierListener, null, paramVarArgs);
  }
  
  protected SequenceModifier(SequenceModifier<T> paramSequenceModifier)
  {
    super(paramSequenceModifier.mModifierListener);
    this.mSubSequenceModifierListener = paramSequenceModifier.mSubSequenceModifierListener;
    this.mDuration = paramSequenceModifier.mDuration;
    IModifier[] arrayOfIModifier1 = paramSequenceModifier.mSubSequenceModifiers;
    this.mSubSequenceModifiers = new IModifier[arrayOfIModifier1.length];
    IModifier[] arrayOfIModifier2 = this.mSubSequenceModifiers;
    for (int i = -1 + arrayOfIModifier2.length;; i--)
    {
      if (i < 0)
      {
        arrayOfIModifier2[0].setModifierListener(new InternalModifierListener(null));
        return;
      }
      arrayOfIModifier2[i] = arrayOfIModifier1[i].clone();
    }
  }
  
  public SequenceModifier(IModifier<T>... paramVarArgs)
    throws IllegalArgumentException
  {
    this(null, paramVarArgs);
  }
  
  private void onHandleModifierFinished(SequenceModifier<T>.InternalModifierListener paramSequenceModifier, IModifier<T> paramIModifier, T paramT)
  {
    this.mCurrentSubSequenceModifier = (1 + this.mCurrentSubSequenceModifier);
    if (this.mCurrentSubSequenceModifier < this.mSubSequenceModifiers.length)
    {
      this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].setModifierListener(paramSequenceModifier);
      if (this.mSubSequenceModifierListener != null) {
        this.mSubSequenceModifierListener.onSubSequenceFinished(paramIModifier, paramT, this.mCurrentSubSequenceModifier);
      }
    }
    do
    {
      return;
      this.mFinished = true;
    } while (this.mModifierListener == null);
    this.mModifierListener.onModifierFinished(this, paramT);
  }
  
  public SequenceModifier<T> clone()
  {
    return new SequenceModifier(this);
  }
  
  public float getDuration()
  {
    return this.mDuration;
  }
  
  public ISubSequenceModifierListener<T> getSubSequenceModifierListener()
  {
    return this.mSubSequenceModifierListener;
  }
  
  public void onUpdate(float paramFloat, T paramT)
  {
    if (!this.mFinished) {
      this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].onUpdate(paramFloat, paramT);
    }
  }
  
  public void reset()
  {
    this.mCurrentSubSequenceModifier = 0;
    this.mFinished = false;
    IModifier[] arrayOfIModifier = this.mSubSequenceModifiers;
    for (int i = -1 + arrayOfIModifier.length;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfIModifier[i].reset();
    }
  }
  
  public void setSubSequenceModifierListener(ISubSequenceModifierListener<T> paramISubSequenceModifierListener)
  {
    this.mSubSequenceModifierListener = paramISubSequenceModifierListener;
  }
  
  public static abstract interface ISubSequenceModifierListener<T>
  {
    public abstract void onSubSequenceFinished(IModifier<T> paramIModifier, T paramT, int paramInt);
  }
  
  private class InternalModifierListener
    implements IModifier.IModifierListener<T>
  {
    private InternalModifierListener() {}
    
    public void onModifierFinished(IModifier<T> paramIModifier, T paramT)
    {
      SequenceModifier.this.onHandleModifierFinished(this, paramIModifier, paramT);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.SequenceModifier
 * JD-Core Version:    0.7.0.1
 */