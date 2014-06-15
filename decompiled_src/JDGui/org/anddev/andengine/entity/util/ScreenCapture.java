package org.anddev.andengine.entity.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.IntBuffer;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;

public class ScreenCapture
  extends Entity
{
  private String mFilePath;
  private int mHeight;
  private IScreenCaptureCallback mScreenCaptureCallback;
  private boolean mScreenCapturePending = false;
  private int mWidth;
  
  private static Bitmap capture(int paramInt1, int paramInt2, int paramInt3, int paramInt4, GL10 paramGL10)
  {
    int[] arrayOfInt1 = new int[paramInt3 * (paramInt2 + paramInt4)];
    int[] arrayOfInt2 = new int[paramInt3 * paramInt4];
    IntBuffer localIntBuffer = IntBuffer.wrap(arrayOfInt1);
    localIntBuffer.position(0);
    paramGL10.glReadPixels(paramInt1, 0, paramInt3, paramInt2 + paramInt4, 6408, 5121, localIntBuffer);
    int i = 0;
    int j = 0;
    if (i >= paramInt4) {
      return Bitmap.createBitmap(arrayOfInt2, paramInt3, paramInt4, Bitmap.Config.ARGB_8888);
    }
    for (int k = 0;; k++)
    {
      if (k >= paramInt3)
      {
        i++;
        j++;
        break;
      }
      int m = arrayOfInt1[(k + i * paramInt3)];
      int n = 0xFF & m >> 16 | 0xFF0000 & m << 16 | 0xFF00FF00 & m;
      arrayOfInt2[(k + paramInt3 * (-1 + (paramInt4 - j)))] = n;
    }
  }
  
  private static void saveCapture(int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString, GL10 paramGL10)
  {
    Bitmap localBitmap = capture(paramInt1, paramInt2, paramInt3, paramInt4, paramGL10);
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(paramString);
      localBitmap.compress(Bitmap.CompressFormat.PNG, 100, localFileOutputStream);
      StreamUtils.flushCloseStream(localFileOutputStream);
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      Debug.e("Error saving file to: " + paramString, localFileNotFoundException);
    }
  }
  
  private static void saveCapture(int paramInt1, int paramInt2, String paramString, GL10 paramGL10)
  {
    saveCapture(0, 0, paramInt1, paramInt2, paramString, paramGL10);
  }
  
  public void capture(int paramInt1, int paramInt2, String paramString, IScreenCaptureCallback paramIScreenCaptureCallback)
  {
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
    this.mFilePath = paramString;
    this.mScreenCaptureCallback = paramIScreenCaptureCallback;
    this.mScreenCapturePending = true;
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    if (this.mScreenCapturePending)
    {
      saveCapture(this.mWidth, this.mHeight, this.mFilePath, paramGL10);
      this.mScreenCaptureCallback.onScreenCaptured(this.mFilePath);
      this.mScreenCapturePending = false;
      this.mFilePath = null;
      this.mScreenCaptureCallback = null;
    }
  }
  
  protected void onManagedUpdate(float paramFloat) {}
  
  public void reset() {}
  
  public static abstract interface IScreenCaptureCallback
  {
    public abstract void onScreenCaptured(String paramString);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.util.ScreenCapture
 * JD-Core Version:    0.7.0.1
 */