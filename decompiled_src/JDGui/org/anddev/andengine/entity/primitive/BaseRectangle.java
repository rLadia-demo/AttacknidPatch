package org.anddev.andengine.entity.primitive;

import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public abstract class BaseRectangle
  extends RectangularShape
{
  public BaseRectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, new RectangleVertexBuffer(35044));
    updateVertexBuffer();
  }
  
  public BaseRectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangleVertexBuffer);
  }
  
  public RectangleVertexBuffer getVertexBuffer()
  {
    return (RectangleVertexBuffer)super.getVertexBuffer();
  }
  
  protected void onUpdateVertexBuffer()
  {
    getVertexBuffer().update(this.mWidth, this.mHeight);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.primitive.BaseRectangle
 * JD-Core Version:    0.7.0.1
 */