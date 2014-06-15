package org.anddev.andengine.entity.shape.util;

import android.util.FloatMath;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.MathUtils;

public class ShapeUtils
{
  @Deprecated
  public void accelerateRespectingRotation(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    float f1 = MathUtils.degToRad(paramIShape.getRotation());
    float f2 = FloatMath.sin(f1);
    float f3 = FloatMath.cos(f1);
    paramIShape.setAcceleration(f2 * -paramFloat2 + f3 * paramFloat1, f3 * paramFloat2 + f2 * paramFloat1);
  }
  
  @Deprecated
  public void setVelocityRespectingRotation(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    float f1 = MathUtils.degToRad(paramIShape.getRotation());
    float f2 = FloatMath.sin(f1);
    float f3 = FloatMath.cos(f1);
    paramIShape.setVelocity(f2 * -paramFloat2 + f3 * paramFloat1, f3 * paramFloat2 + f2 * paramFloat1);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.util.ShapeUtils
 * JD-Core Version:    0.7.0.1
 */