package org.anddev.andengine.entity.primitive;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.LineCollisionChecker;
import org.anddev.andengine.collision.ShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.GLShape;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.LineVertexBuffer;

public class Line
  extends GLShape
{
  private static final float LINEWIDTH_DEFAULT = 1.0F;
  private final LineVertexBuffer mLineVertexBuffer;
  private float mLineWidth;
  protected float mX2;
  protected float mY2;
  
  public Line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, 1.0F);
  }
  
  public Line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    super(paramFloat1, paramFloat2);
    this.mX2 = paramFloat3;
    this.mY2 = paramFloat4;
    this.mLineWidth = paramFloat5;
    this.mLineVertexBuffer = new LineVertexBuffer(35044);
    BufferObjectManager.getActiveInstance().loadBufferObject(this.mLineVertexBuffer);
    updateVertexBuffer();
    float f1 = getWidth();
    float f2 = getHeight();
    this.mRotationCenterX = (f1 * 0.5F);
    this.mRotationCenterY = (f2 * 0.5F);
    this.mScaleCenterX = this.mRotationCenterX;
    this.mScaleCenterY = this.mRotationCenterY;
  }
  
  public boolean collidesWith(IShape paramIShape)
  {
    if ((paramIShape instanceof Line))
    {
      Line localLine = (Line)paramIShape;
      return LineCollisionChecker.checkLineCollision(this.mX, this.mY, this.mX2, this.mY2, localLine.mX, localLine.mY, localLine.mX2, localLine.mY2);
    }
    return false;
  }
  
  @Deprecated
  public boolean contains(float paramFloat1, float paramFloat2)
  {
    return false;
  }
  
  @Deprecated
  public float[] convertLocalToSceneCoordinates(float paramFloat1, float paramFloat2)
  {
    return null;
  }
  
  @Deprecated
  public float[] convertSceneToLocalCoordinates(float paramFloat1, float paramFloat2)
  {
    return null;
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    paramGL10.glDrawArrays(1, 0, 2);
  }
  
  public float getBaseHeight()
  {
    return this.mY2 - this.mY;
  }
  
  public float getBaseWidth()
  {
    return this.mX2 - this.mX;
  }
  
  public float getHeight()
  {
    return this.mY2 - this.mY;
  }
  
  public float getLineWidth()
  {
    return this.mLineWidth;
  }
  
  public float[] getSceneCenterCoordinates()
  {
    return ShapeCollisionChecker.convertLocalToSceneCoordinates(this, 0.5F * (this.mX + this.mX2), 0.5F * (this.mY + this.mY2));
  }
  
  public LineVertexBuffer getVertexBuffer()
  {
    return this.mLineVertexBuffer;
  }
  
  public float getWidth()
  {
    return this.mX2 - this.mX;
  }
  
  @Deprecated
  public float getX()
  {
    return super.getX();
  }
  
  public float getX1()
  {
    return super.getX();
  }
  
  public float getX2()
  {
    return this.mX2;
  }
  
  @Deprecated
  public float getY()
  {
    return super.getY();
  }
  
  public float getY1()
  {
    return super.getY();
  }
  
  public float getY2()
  {
    return this.mY2;
  }
  
  protected boolean isCulled(Camera paramCamera)
  {
    return false;
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    super.onInitDraw(paramGL10);
    GLHelper.disableTextures(paramGL10);
    GLHelper.disableTexCoordArray(paramGL10);
    GLHelper.lineWidth(paramGL10, this.mLineWidth);
  }
  
  protected void onUpdateVertexBuffer()
  {
    this.mLineVertexBuffer.update(0.0F, 0.0F, this.mX2 - this.mX, this.mY2 - this.mY);
  }
  
  public void setLineWidth(float paramFloat)
  {
    this.mLineWidth = paramFloat;
  }
  
  @Deprecated
  public void setPosition(float paramFloat1, float paramFloat2)
  {
    float f1 = this.mX - paramFloat1;
    float f2 = this.mY - paramFloat2;
    super.setPosition(paramFloat1, paramFloat2);
    this.mX2 = (f1 + this.mX2);
    this.mY2 = (f2 + this.mY2);
  }
  
  public void setPosition(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mX2 = paramFloat3;
    this.mY2 = paramFloat4;
    super.setPosition(paramFloat1, paramFloat2);
    updateVertexBuffer();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.primitive.Line
 * JD-Core Version:    0.7.0.1
 */