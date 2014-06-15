package org.anddev.andengine.util.modifier;

public class LoopModifier<T>
  extends BaseModifier<T>
{
  public static final int LOOP_CONTINUOUS = -1;
  private final float mDuration;
  private final int mInitialLoopCount;
  private int mLoopCount;
  private ILoopModifierListener<T> mLoopModifierListener;
  private final IModifier<T> mModifier;
  
  public LoopModifier(int paramInt, IModifier<T> paramIModifier)
  {
    this(null, paramInt, paramIModifier);
  }
  
  public LoopModifier(IModifier.IModifierListener<T> paramIModifierListener, int paramInt, IModifier<T> paramIModifier)
  {
    this(paramIModifierListener, paramInt, null, paramIModifier);
  }
  
  public LoopModifier(IModifier.IModifierListener<T> paramIModifierListener, int paramInt, ILoopModifierListener<T> paramILoopModifierListener, IModifier<T> paramIModifier)
  {
    super(paramIModifierListener);
    this.mLoopModifierListener = paramILoopModifierListener;
    this.mModifier = paramIModifier;
    this.mInitialLoopCount = paramInt;
    this.mLoopCount = paramInt;
    if (paramInt == -1) {}
    for (float f = (1.0F / 1.0F);; f = paramIModifier.getDuration() * paramInt)
    {
      this.mDuration = f;
      paramIModifier.setModifierListener(new InternalModifierListener(null));
      return;
    }
  }
  
  public LoopModifier(IModifier<T> paramIModifier)
  {
    this(null, -1, paramIModifier);
  }
  
  protected LoopModifier(LoopModifier<T> paramLoopModifier)
  {
    this(paramLoopModifier.mModifierListener, paramLoopModifier.mInitialLoopCount, paramLoopModifier.mModifier.clone());
  }
  
  public LoopModifier<T> clone()
  {
    return new LoopModifier(this);
  }
  
  public float getDuration()
  {
    return this.mDuration;
  }
  
  public ILoopModifierListener<T> getLoopModifierListener()
  {
    return this.mLoopModifierListener;
  }
  
  public void onHandleLoopFinished(T paramT)
  {
    if (this.mLoopModifierListener != null) {
      this.mLoopModifierListener.onLoopFinished(this, this.mLoopCount);
    }
    if (this.mInitialLoopCount == -1) {
      this.mModifier.reset();
    }
    do
    {
      return;
      this.mLoopCount = (-1 + this.mLoopCount);
      if (this.mLoopCount >= 0) {
        break;
      }
      this.mFinished = true;
    } while (this.mModifierListener == null);
    this.mModifierListener.onModifierFinished(this, paramT);
    return;
    this.mModifier.reset();
  }
  
  public void onUpdate(float paramFloat, T paramT)
  {
    if (!this.mFinished) {
      this.mModifier.onUpdate(paramFloat, paramT);
    }
  }
  
  public void reset()
  {
    this.mLoopCount = this.mInitialLoopCount;
    this.mModifier.reset();
  }
  
  public void setLoopModifierListener(ILoopModifierListener<T> paramILoopModifierListener)
  {
    this.mLoopModifierListener = paramILoopModifierListener;
  }
  
  public static abstract interface ILoopModifierListener<T>
  {
    public abstract void onLoopFinished(LoopModifier<T> paramLoopModifier, int paramInt);
  }
  
  private class InternalModifierListener
    implements IModifier.IModifierListener<T>
  {
    private InternalModifierListener() {}
    
    public void onModifierFinished(IModifier<T> paramIModifier, T paramT)
    {
      LoopModifier.this.onHandleLoopFinished(paramT);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.LoopModifier
 * JD-Core Version:    0.7.0.1
 */