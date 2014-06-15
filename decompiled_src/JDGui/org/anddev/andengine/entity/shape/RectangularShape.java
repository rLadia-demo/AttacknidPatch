package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.RectangularShapeCollisionChecker;
import org.anddev.andengine.collision.ShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public abstract class RectangularShape
  extends GLShape
{
  protected float mBaseHeight;
  protected float mBaseWidth;
  protected float mHeight;
  private final VertexBuffer mVertexBuffer;
  protected float mWidth;
  
  public RectangularShape(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, VertexBuffer paramVertexBuffer)
  {
    super(paramFloat1, paramFloat2);
    this.mBaseWidth = paramFloat3;
    this.mBaseHeight = paramFloat4;
    this.mWidth = paramFloat3;
    this.mHeight = paramFloat4;
    this.mVertexBuffer = paramVertexBuffer;
    BufferObjectManager.getActiveInstance().loadBufferObject(this.mVertexBuffer);
    this.mRotationCenterX = (paramFloat3 * 0.5F);
    this.mRotationCenterY = (paramFloat4 * 0.5F);
    this.mScaleCenterX = this.mRotationCenterX;
    this.mScaleCenterY = this.mRotationCenterY;
  }
  
  public boolean collidesWith(IShape paramIShape)
  {
    if ((paramIShape instanceof RectangularShape)) {
      return RectangularShapeCollisionChecker.checkCollision(this, (RectangularShape)paramIShape);
    }
    return false;
  }
  
  public boolean contains(float paramFloat1, float paramFloat2)
  {
    return RectangularShapeCollisionChecker.checkContains(this, paramFloat1, paramFloat2);
  }
  
  public float[] convertLocalToSceneCoordinates(float paramFloat1, float paramFloat2)
  {
    float[] arrayOfFloat = ShapeCollisionChecker.convertLocalToSceneCoordinates(this, paramFloat1, paramFloat2);
    arrayOfFloat[0] += this.mX;
    arrayOfFloat[1] += this.mY;
    return arrayOfFloat;
  }
  
  public float[] convertSceneToLocalCoordinates(float paramFloat1, float paramFloat2)
  {
    float[] arrayOfFloat = ShapeCollisionChecker.convertSceneToLocalCoordinates(this, paramFloat1, paramFloat2);
    arrayOfFloat[0] -= this.mX;
    arrayOfFloat[1] -= this.mY;
    return arrayOfFloat;
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    paramGL10.glDrawArrays(5, 0, 4);
  }
  
  public float getBaseHeight()
  {
    return this.mBaseHeight;
  }
  
  public float getBaseWidth()
  {
    return this.mBaseWidth;
  }
  
  public float getHeight()
  {
    return this.mHeight;
  }
  
  public float[] getSceneCenterCoordinates()
  {
    return convertLocalToSceneCoordinates(0.5F * this.mWidth, 0.5F * this.mHeight);
  }
  
  public VertexBuffer getVertexBuffer()
  {
    return this.mVertexBuffer;
  }
  
  public float getWidth()
  {
    return this.mWidth;
  }
  
  protected boolean isCulled(Camera paramCamera)
  {
    float f1 = this.mX;
    float f2 = this.mY;
    return (f1 > paramCamera.getMaxX()) || (f2 > paramCamera.getMaxY()) || (f1 + getWidth() < paramCamera.getMinX()) || (f2 + getHeight() < paramCamera.getMinY());
  }
  
  public void reset()
  {
    super.reset();
    setBaseSize();
    float f1 = getBaseWidth();
    float f2 = getBaseHeight();
    this.mRotationCenterX = (f1 * 0.5F);
    this.mRotationCenterY = (f2 * 0.5F);
    this.mScaleCenterX = this.mRotationCenterX;
    this.mScaleCenterY = this.mRotationCenterY;
  }
  
  public void setBaseSize()
  {
    if ((this.mWidth != this.mBaseWidth) && (this.mHeight != this.mBaseHeight))
    {
      this.mWidth = this.mBaseWidth;
      this.mHeight = this.mBaseHeight;
      onPositionChanged();
      updateVertexBuffer();
    }
  }
  
  public void setHeight(float paramFloat)
  {
    this.mHeight = paramFloat;
    updateVertexBuffer();
  }
  
  public void setSize(float paramFloat1, float paramFloat2)
  {
    this.mWidth = paramFloat1;
    this.mHeight = paramFloat2;
    updateVertexBuffer();
  }
  
  public void setWidth(float paramFloat)
  {
    this.mWidth = paramFloat;
    updateVertexBuffer();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.RectangularShape
 * JD-Core Version:    0.7.0.1
 */