package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class RotationAtModifier
  extends RotationModifier
{
  private final float mRotationCenterX;
  private final float mRotationCenterY;
  
  public RotationAtModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    super(paramFloat1, paramFloat2, paramFloat3, IEaseFunction.DEFAULT);
    this.mRotationCenterX = paramFloat4;
    this.mRotationCenterY = paramFloat5;
  }
  
  public RotationAtModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
    this.mRotationCenterX = paramFloat4;
    this.mRotationCenterY = paramFloat5;
  }
  
  public RotationAtModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
    this.mRotationCenterX = paramFloat4;
    this.mRotationCenterY = paramFloat5;
  }
  
  public RotationAtModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIEaseFunction);
    this.mRotationCenterX = paramFloat4;
    this.mRotationCenterY = paramFloat5;
  }
  
  protected RotationAtModifier(RotationAtModifier paramRotationAtModifier)
  {
    super(paramRotationAtModifier);
    this.mRotationCenterX = paramRotationAtModifier.mRotationCenterX;
    this.mRotationCenterY = paramRotationAtModifier.mRotationCenterY;
  }
  
  public RotationAtModifier clone()
  {
    return new RotationAtModifier(this);
  }
  
  protected void onManagedInitialize(IShape paramIShape)
  {
    super.onManagedInitialize(paramIShape);
    paramIShape.setRotationCenter(this.mRotationCenterX, this.mRotationCenterY);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.RotationAtModifier
 * JD-Core Version:    0.7.0.1
 */