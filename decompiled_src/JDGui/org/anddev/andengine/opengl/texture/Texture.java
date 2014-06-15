package org.anddev.andengine.opengl.texture;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.opengl.GLUtils;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.MathUtils;

public class Texture
{
  private static final int[] HARDWARETEXTUREID_FETCHER = new int[1];
  private int mHardwareTextureID = -1;
  private final int mHeight;
  private boolean mLoadedToHardware;
  private final TextureOptions mTextureOptions;
  private final ArrayList<TextureSourceWithLocation> mTextureSources = new ArrayList();
  private final ITextureStateListener mTextureStateListener;
  protected boolean mUpdateOnHardwareNeeded = false;
  private final int mWidth;
  
  public Texture(int paramInt1, int paramInt2)
  {
    this(paramInt1, paramInt2, TextureOptions.DEFAULT, null);
  }
  
  public Texture(int paramInt1, int paramInt2, ITextureStateListener paramITextureStateListener)
  {
    this(paramInt1, paramInt2, TextureOptions.DEFAULT, paramITextureStateListener);
  }
  
  public Texture(int paramInt1, int paramInt2, TextureOptions paramTextureOptions)
    throws IllegalArgumentException
  {
    this(paramInt1, paramInt2, paramTextureOptions, null);
  }
  
  public Texture(int paramInt1, int paramInt2, TextureOptions paramTextureOptions, ITextureStateListener paramITextureStateListener)
    throws IllegalArgumentException
  {
    if ((!MathUtils.isPowerOfTwo(paramInt1)) || (!MathUtils.isPowerOfTwo(paramInt2))) {
      throw new IllegalArgumentException("Width and Height of a Texture must be a power of 2!");
    }
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
    this.mTextureOptions = paramTextureOptions;
    this.mTextureStateListener = paramITextureStateListener;
  }
  
  private void allocateAndBindTextureOnHardware(GL10 paramGL10)
  {
    GLHelper.bindTexture(paramGL10, this.mHardwareTextureID);
    sendPlaceholderBitmapToHardware(this.mWidth, this.mHeight);
  }
  
  private void applyTextureOptions(GL10 paramGL10)
  {
    TextureOptions localTextureOptions = this.mTextureOptions;
    paramGL10.glTexParameterf(3553, 10241, localTextureOptions.mMinFilter);
    paramGL10.glTexParameterf(3553, 10240, localTextureOptions.mMagFilter);
    paramGL10.glTexParameterf(3553, 10242, localTextureOptions.mWrapS);
    paramGL10.glTexParameterf(3553, 10243, localTextureOptions.mWrapT);
    paramGL10.glTexEnvf(8960, 8704, localTextureOptions.mTextureEnvironment);
  }
  
  private void checkTextureSourcePosition(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
    throws IllegalArgumentException
  {
    if (paramInt1 < 0) {
      throw new IllegalArgumentException("Illegal negative pTexturePositionX supplied: '" + paramInt1 + "'");
    }
    if (paramInt2 < 0) {
      throw new IllegalArgumentException("Illegal negative pTexturePositionY supplied: '" + paramInt2 + "'");
    }
    if ((paramInt1 + paramITextureSource.getWidth() > this.mWidth) || (paramInt2 + paramITextureSource.getHeight() > this.mHeight)) {
      throw new IllegalArgumentException("Supplied TextureSource must not exceed bounds of Texture.");
    }
  }
  
  private void deleteTextureOnHardware(GL10 paramGL10)
  {
    GLHelper.deleteTexture(paramGL10, this.mHardwareTextureID);
  }
  
  private static int generateHardwareTextureID(GL10 paramGL10)
  {
    paramGL10.glGenTextures(1, HARDWARETEXTUREID_FETCHER, 0);
    return HARDWARETEXTUREID_FETCHER[0];
  }
  
  private static void sendPlaceholderBitmapToHardware(int paramInt1, int paramInt2)
  {
    Bitmap localBitmap = Bitmap.createBitmap(paramInt1, paramInt2, Bitmap.Config.ARGB_8888);
    GLUtils.texImage2D(3553, 0, localBitmap, 0);
    localBitmap.recycle();
  }
  
  private void writeTextureToHardware(GL10 paramGL10)
  {
    boolean bool = this.mTextureOptions.mPreMultipyAlpha;
    ArrayList localArrayList = this.mTextureSources;
    int i = localArrayList.size();
    TextureSourceWithLocation localTextureSourceWithLocation;
    Bitmap localBitmap;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      localTextureSourceWithLocation = (TextureSourceWithLocation)localArrayList.get(j);
      if (localTextureSourceWithLocation != null)
      {
        localBitmap = localTextureSourceWithLocation.onLoadBitmap();
        if (localBitmap != null) {
          break;
        }
        try
        {
          throw new IllegalArgumentException("TextureSource: " + localTextureSourceWithLocation.toString() + " returned a null Bitmap.");
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          Debug.e("Error loading: " + localTextureSourceWithLocation.toString(), localIllegalArgumentException);
          if (this.mTextureStateListener == null) {
            break label214;
          }
        }
        this.mTextureStateListener.onTextureSourceLoadExeption(this, localTextureSourceWithLocation.mTextureSource, localIllegalArgumentException);
      }
    }
    if (bool) {
      GLUtils.texSubImage2D(3553, 0, localTextureSourceWithLocation.getTexturePositionX(), localTextureSourceWithLocation.getTexturePositionY(), localBitmap, 6408, 5121);
    }
    for (;;)
    {
      localBitmap.recycle();
      break;
      GLHelper.glTexSubImage2D(paramGL10, 3553, 0, localTextureSourceWithLocation.getTexturePositionX(), localTextureSourceWithLocation.getTexturePositionY(), localBitmap, 6408, 5121);
    }
    label214:
    throw localIllegalArgumentException;
  }
  
  public TextureSourceWithLocation addTextureSource(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
    throws IllegalArgumentException
  {
    checkTextureSourcePosition(paramITextureSource, paramInt1, paramInt2);
    TextureSourceWithLocation localTextureSourceWithLocation = new TextureSourceWithLocation(paramITextureSource, paramInt1, paramInt2);
    this.mTextureSources.add(localTextureSourceWithLocation);
    this.mUpdateOnHardwareNeeded = true;
    return localTextureSourceWithLocation;
  }
  
  public void clearTextureSources()
  {
    this.mTextureSources.clear();
    this.mUpdateOnHardwareNeeded = true;
  }
  
  public int getHardwareTextureID()
  {
    return this.mHardwareTextureID;
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public TextureOptions getTextureOptions()
  {
    return this.mTextureOptions;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  public boolean isLoadedToHardware()
  {
    return this.mLoadedToHardware;
  }
  
  public boolean isUpdateOnHardwareNeeded()
  {
    return this.mUpdateOnHardwareNeeded;
  }
  
  public void loadToHardware(GL10 paramGL10)
  {
    GLHelper.enableTextures(paramGL10);
    this.mHardwareTextureID = generateHardwareTextureID(paramGL10);
    allocateAndBindTextureOnHardware(paramGL10);
    applyTextureOptions(paramGL10);
    writeTextureToHardware(paramGL10);
    this.mUpdateOnHardwareNeeded = false;
    this.mLoadedToHardware = true;
    if (this.mTextureStateListener != null) {
      this.mTextureStateListener.onLoadedToHardware(this);
    }
  }
  
  public void removeTextureSource(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
  {
    ArrayList localArrayList = this.mTextureSources;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      TextureSourceWithLocation localTextureSourceWithLocation = (TextureSourceWithLocation)localArrayList.get(i);
      if ((localTextureSourceWithLocation.mTextureSource == paramITextureSource) && (localTextureSourceWithLocation.mTexturePositionX == paramInt1) && (localTextureSourceWithLocation.mTexturePositionY == paramInt2))
      {
        localArrayList.remove(i);
        this.mUpdateOnHardwareNeeded = true;
        return;
      }
    }
  }
  
  void setLoadedToHardware(boolean paramBoolean)
  {
    this.mLoadedToHardware = paramBoolean;
  }
  
  public void unloadFromHardware(GL10 paramGL10)
  {
    GLHelper.enableTextures(paramGL10);
    deleteTextureOnHardware(paramGL10);
    this.mHardwareTextureID = -1;
    this.mLoadedToHardware = false;
    if (this.mTextureStateListener != null) {
      this.mTextureStateListener.onUnloadedFromHardware(this);
    }
  }
  
  public static abstract interface ITextureStateListener
  {
    public abstract void onLoadedToHardware(Texture paramTexture);
    
    public abstract void onTextureSourceLoadExeption(Texture paramTexture, ITextureSource paramITextureSource, Throwable paramThrowable);
    
    public abstract void onUnloadedFromHardware(Texture paramTexture);
    
    public static class DebugTextureStateListener
      implements Texture.ITextureStateListener
    {
      public void onLoadedToHardware(Texture paramTexture)
      {
        Debug.d("Texture loaded: " + paramTexture.toString());
      }
      
      public void onTextureSourceLoadExeption(Texture paramTexture, ITextureSource paramITextureSource, Throwable paramThrowable)
      {
        Debug.e("Exception loading TextureSource. Texture: " + paramTexture.toString() + " TextureSource: " + paramITextureSource.toString(), paramThrowable);
      }
      
      public void onUnloadedFromHardware(Texture paramTexture)
      {
        Debug.d("Texture unloaded: " + paramTexture.toString());
      }
    }
    
    public static class TextureStateAdapter
      implements Texture.ITextureStateListener
    {
      public void onLoadedToHardware(Texture paramTexture) {}
      
      public void onTextureSourceLoadExeption(Texture paramTexture, ITextureSource paramITextureSource, Throwable paramThrowable) {}
      
      public void onUnloadedFromHardware(Texture paramTexture) {}
    }
  }
  
  public static class TextureSourceWithLocation
  {
    private final int mTexturePositionX;
    private final int mTexturePositionY;
    private final ITextureSource mTextureSource;
    
    public TextureSourceWithLocation(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
    {
      this.mTextureSource = paramITextureSource;
      this.mTexturePositionX = paramInt1;
      this.mTexturePositionY = paramInt2;
    }
    
    public int getHeight()
    {
      return this.mTextureSource.getHeight();
    }
    
    public int getTexturePositionX()
    {
      return this.mTexturePositionX;
    }
    
    public int getTexturePositionY()
    {
      return this.mTexturePositionY;
    }
    
    public int getWidth()
    {
      return this.mTextureSource.getWidth();
    }
    
    public Bitmap onLoadBitmap()
    {
      return this.mTextureSource.onLoadBitmap();
    }
    
    public String toString()
    {
      return this.mTextureSource.toString();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.Texture
 * JD-Core Version:    0.7.0.1
 */