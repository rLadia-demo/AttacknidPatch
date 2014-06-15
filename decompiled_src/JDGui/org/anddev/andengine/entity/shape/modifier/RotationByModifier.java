package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;

public class RotationByModifier
  extends SingleValueChangeShapeModifier
{
  public RotationByModifier(float paramFloat1, float paramFloat2)
  {
    super(paramFloat1, paramFloat2);
  }
  
  protected RotationByModifier(RotationByModifier paramRotationByModifier)
  {
    super(paramRotationByModifier);
  }
  
  public RotationByModifier clone()
  {
    return new RotationByModifier(this);
  }
  
  protected void onChangeValue(IShape paramIShape, float paramFloat)
  {
    paramIShape.setRotation(paramFloat + paramIShape.getRotation());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.RotationByModifier
 * JD-Core Version:    0.7.0.1
 */