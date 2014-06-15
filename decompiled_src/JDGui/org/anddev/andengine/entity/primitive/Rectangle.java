package org.anddev.andengine.entity.primitive;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class Rectangle
  extends BaseRectangle
{
  public Rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public Rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangleVertexBuffer);
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    super.onInitDraw(paramGL10);
    GLHelper.disableTextures(paramGL10);
    GLHelper.disableTexCoordArray(paramGL10);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.primitive.Rectangle
 * JD-Core Version:    0.7.0.1
 */