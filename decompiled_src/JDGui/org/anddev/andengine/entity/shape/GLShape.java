package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public abstract class GLShape
  extends Shape
{
  public GLShape(float paramFloat1, float paramFloat2)
  {
    super(paramFloat1, paramFloat2);
  }
  
  protected abstract VertexBuffer getVertexBuffer();
  
  protected void onApplyVertices(GL10 paramGL10)
  {
    if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS)
    {
      GL11 localGL11 = (GL11)paramGL10;
      getVertexBuffer().selectOnHardware(localGL11);
      GLHelper.vertexZeroPointer(localGL11);
      return;
    }
    GLHelper.vertexPointer(paramGL10, getVertexBuffer().getFloatBuffer());
  }
  
  protected abstract void onUpdateVertexBuffer();
  
  protected void updateVertexBuffer()
  {
    onUpdateVertexBuffer();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.GLShape
 * JD-Core Version:    0.7.0.1
 */