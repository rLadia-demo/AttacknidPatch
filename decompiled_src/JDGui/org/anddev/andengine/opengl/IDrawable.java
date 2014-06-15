package org.anddev.andengine.opengl;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;

public abstract interface IDrawable
{
  public abstract void onDraw(GL10 paramGL10, Camera paramCamera);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.IDrawable
 * JD-Core Version:    0.7.0.1
 */