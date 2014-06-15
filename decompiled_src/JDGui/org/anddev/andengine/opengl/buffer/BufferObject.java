package org.anddev.andengine.opengl.buffer;

import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;

public abstract class BufferObject
{
  private static final int[] HARDWAREBUFFERID_FETCHER = new int[1];
  protected final int[] mBufferData;
  private final int mDrawType;
  private final FastFloatBuffer mFloatBuffer;
  private int mHardwareBufferID = -1;
  private boolean mHardwareBufferNeedsUpdate = true;
  private boolean mLoadedToHardware;
  
  public BufferObject(int paramInt1, int paramInt2)
  {
    this.mDrawType = paramInt2;
    this.mBufferData = new int[paramInt1];
    this.mFloatBuffer = new FastFloatBuffer(paramInt1);
  }
  
  private void deleteBufferOnHardware(GL11 paramGL11)
  {
    GLHelper.deleteBuffer(paramGL11, this.mHardwareBufferID);
  }
  
  private int generateHardwareBufferID(GL11 paramGL11)
  {
    paramGL11.glGenBuffers(1, HARDWAREBUFFERID_FETCHER, 0);
    return HARDWAREBUFFERID_FETCHER[0];
  }
  
  public FastFloatBuffer getFloatBuffer()
  {
    return this.mFloatBuffer;
  }
  
  public int getHardwareBufferID()
  {
    return this.mHardwareBufferID;
  }
  
  public boolean isLoadedToHardware()
  {
    return this.mLoadedToHardware;
  }
  
  public void loadToHardware(GL11 paramGL11)
  {
    this.mHardwareBufferID = generateHardwareBufferID(paramGL11);
    this.mLoadedToHardware = true;
  }
  
  public void selectOnHardware(GL11 paramGL11)
  {
    int i = this.mHardwareBufferID;
    if (i == -1) {}
    do
    {
      return;
      GLHelper.bindBuffer(paramGL11, i);
    } while (!this.mHardwareBufferNeedsUpdate);
    this.mHardwareBufferNeedsUpdate = false;
    try
    {
      GLHelper.bufferData(paramGL11, this.mFloatBuffer.mByteBuffer, this.mDrawType);
      return;
    }
    finally {}
  }
  
  public void setHardwareBufferNeedsUpdate()
  {
    this.mHardwareBufferNeedsUpdate = true;
  }
  
  void setLoadedToHardware(boolean paramBoolean)
  {
    this.mLoadedToHardware = paramBoolean;
  }
  
  public void unloadFromHardware(GL11 paramGL11)
  {
    deleteBufferOnHardware(paramGL11);
    this.mHardwareBufferID = -1;
    this.mLoadedToHardware = false;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.buffer.BufferObject
 * JD-Core Version:    0.7.0.1
 */