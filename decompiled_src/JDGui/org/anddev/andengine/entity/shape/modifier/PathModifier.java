package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.Path;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.IModifier.IModifierListener;
import org.anddev.andengine.util.modifier.SequenceModifier;
import org.anddev.andengine.util.modifier.SequenceModifier.ISubSequenceModifierListener;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class PathModifier
  extends ShapeModifier
{
  private final Path mPath;
  private IPathModifierListener mPathModifierListener;
  private final SequenceModifier<IShape> mSequenceModifier;
  
  public PathModifier(float paramFloat, Path paramPath)
  {
    this(paramFloat, paramPath, null, IEaseFunction.DEFAULT);
  }
  
  public PathModifier(float paramFloat, Path paramPath, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    this(paramFloat, paramPath, paramIShapeModifierListener, null, IEaseFunction.DEFAULT);
  }
  
  public PathModifier(float paramFloat, Path paramPath, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IPathModifierListener paramIPathModifierListener)
    throws IllegalArgumentException
  {
    this(paramFloat, paramPath, paramIShapeModifierListener, paramIPathModifierListener, IEaseFunction.DEFAULT);
  }
  
  public PathModifier(float paramFloat, Path paramPath, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IPathModifierListener paramIPathModifierListener, IEaseFunction paramIEaseFunction)
    throws IllegalArgumentException
  {
    int i = paramPath.getSize();
    if (i < 2) {
      throw new IllegalArgumentException("Path needs at least 2 waypoints!");
    }
    this.mPath = paramPath;
    this.mModifierListener = paramIShapeModifierListener;
    this.mPathModifierListener = paramIPathModifierListener;
    MoveModifier[] arrayOfMoveModifier = new MoveModifier[i - 1];
    float[] arrayOfFloat1 = paramPath.getCoordinatesX();
    float[] arrayOfFloat2 = paramPath.getCoordinatesY();
    float f1 = paramPath.getLength() / paramFloat;
    final int j = arrayOfMoveModifier.length;
    int k = 0;
    if (k >= j)
    {
      this.mSequenceModifier = new SequenceModifier(new IShapeModifier.IShapeModifierListener()new SequenceModifier.ISubSequenceModifierListener
      {
        public void onModifierFinished(IModifier<IShape> paramAnonymousIModifier, IShape paramAnonymousIShape)
        {
          if (PathModifier.this.mPathModifierListener != null) {
            PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, paramAnonymousIShape, j);
          }
          if (PathModifier.this.mModifierListener != null) {
            PathModifier.this.mModifierListener.onModifierFinished(PathModifier.this, paramAnonymousIShape);
          }
        }
      }, new SequenceModifier.ISubSequenceModifierListener()
      {
        public void onSubSequenceFinished(IModifier<IShape> paramAnonymousIModifier, IShape paramAnonymousIShape, int paramAnonymousInt)
        {
          if (PathModifier.this.mPathModifierListener != null) {
            PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, paramAnonymousIShape, paramAnonymousInt);
          }
        }
      }, arrayOfMoveModifier);
      return;
    }
    float f2 = paramPath.getSegmentLength(k) / f1;
    if (k == 0) {
      arrayOfMoveModifier[k = new MoveModifier(f2, arrayOfFloat1[k], arrayOfFloat1[(k + 1)], arrayOfFloat2[k], arrayOfFloat2[(k + 1)], null, paramIEaseFunction)
      {
        protected void onManagedInitialize(IShape paramAnonymousIShape)
        {
          super.onManagedInitialize(paramAnonymousIShape);
          if (PathModifier.this.mPathModifierListener != null) {
            PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, paramAnonymousIShape, 0);
          }
        }
      };
    }
    for (;;)
    {
      k++;
      break;
      arrayOfMoveModifier[k] = new MoveModifier(f2, arrayOfFloat1[k], arrayOfFloat1[(k + 1)], arrayOfFloat2[k], arrayOfFloat2[(k + 1)], null, paramIEaseFunction);
    }
  }
  
  public PathModifier(float paramFloat, Path paramPath, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat, paramPath, paramIShapeModifierListener, null, paramIEaseFunction);
  }
  
  public PathModifier(float paramFloat, Path paramPath, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat, paramPath, null, paramIEaseFunction);
  }
  
  protected PathModifier(PathModifier paramPathModifier)
  {
    this.mPath = paramPathModifier.mPath.clone();
    this.mSequenceModifier = paramPathModifier.mSequenceModifier.clone();
  }
  
  public PathModifier clone()
  {
    return new PathModifier(this);
  }
  
  public float getDuration()
  {
    return this.mSequenceModifier.getDuration();
  }
  
  public Path getPath()
  {
    return this.mPath;
  }
  
  public IPathModifierListener getPathModifierListener()
  {
    return this.mPathModifierListener;
  }
  
  public boolean isFinished()
  {
    return this.mSequenceModifier.isFinished();
  }
  
  public void onUpdate(float paramFloat, IShape paramIShape)
  {
    this.mSequenceModifier.onUpdate(paramFloat, paramIShape);
  }
  
  public void reset()
  {
    this.mSequenceModifier.reset();
  }
  
  public void setPathModifierListener(IPathModifierListener paramIPathModifierListener)
  {
    this.mPathModifierListener = paramIPathModifierListener;
  }
  
  public static abstract interface IPathModifierListener
  {
    public abstract void onWaypointPassed(PathModifier paramPathModifier, IShape paramIShape, int paramInt);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.PathModifier
 * JD-Core Version:    0.7.0.1
 */