package org.anddev.andengine.opengl.texture;

import android.graphics.Bitmap;
import java.util.ArrayList;
import org.anddev.andengine.opengl.texture.builder.ITextureBuilder;
import org.anddev.andengine.opengl.texture.builder.ITextureBuilder.TextureSourcePackingException;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Callback;

public class BuildableTexture
  extends Texture
{
  private final ArrayList<TextureSourceWithWithLocationCallback> mTextureSourcesToPlace = new ArrayList();
  
  public BuildableTexture(int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2, TextureOptions.DEFAULT, null);
  }
  
  public BuildableTexture(int paramInt1, int paramInt2, Texture.ITextureStateListener paramITextureStateListener)
  {
    super(paramInt1, paramInt2, TextureOptions.DEFAULT, paramITextureStateListener);
  }
  
  public BuildableTexture(int paramInt1, int paramInt2, TextureOptions paramTextureOptions)
    throws IllegalArgumentException
  {
    super(paramInt1, paramInt2, paramTextureOptions, null);
  }
  
  public BuildableTexture(int paramInt1, int paramInt2, TextureOptions paramTextureOptions, Texture.ITextureStateListener paramITextureStateListener)
    throws IllegalArgumentException
  {
    super(paramInt1, paramInt2, paramTextureOptions, paramITextureStateListener);
  }
  
  @Deprecated
  public Texture.TextureSourceWithLocation addTextureSource(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
  {
    return super.addTextureSource(paramITextureSource, paramInt1, paramInt2);
  }
  
  public void addTextureSource(ITextureSource paramITextureSource, Callback<Texture.TextureSourceWithLocation> paramCallback)
  {
    this.mTextureSourcesToPlace.add(new TextureSourceWithWithLocationCallback(paramITextureSource, paramCallback));
  }
  
  public void build(ITextureBuilder paramITextureBuilder)
    throws ITextureBuilder.TextureSourcePackingException
  {
    paramITextureBuilder.pack(this, this.mTextureSourcesToPlace);
    this.mTextureSourcesToPlace.clear();
    this.mUpdateOnHardwareNeeded = true;
  }
  
  public void clearTextureSources()
  {
    super.clearTextureSources();
    this.mTextureSourcesToPlace.clear();
  }
  
  public void removeTextureSource(ITextureSource paramITextureSource)
  {
    ArrayList localArrayList = this.mTextureSourcesToPlace;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      if (((TextureSourceWithWithLocationCallback)localArrayList.get(i)).mTextureSource == paramITextureSource)
      {
        localArrayList.remove(i);
        this.mUpdateOnHardwareNeeded = true;
        return;
      }
    }
  }
  
  public static class TextureSourceWithWithLocationCallback
    implements ITextureSource
  {
    private final Callback<Texture.TextureSourceWithLocation> mCallback;
    private final ITextureSource mTextureSource;
    
    public TextureSourceWithWithLocationCallback(ITextureSource paramITextureSource, Callback<Texture.TextureSourceWithLocation> paramCallback)
    {
      this.mTextureSource = paramITextureSource;
      this.mCallback = paramCallback;
    }
    
    public TextureSourceWithWithLocationCallback clone()
    {
      return null;
    }
    
    public Callback<Texture.TextureSourceWithLocation> getCallback()
    {
      return this.mCallback;
    }
    
    public int getHeight()
    {
      return this.mTextureSource.getHeight();
    }
    
    public ITextureSource getTextureSource()
    {
      return this.mTextureSource;
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
 * Qualified Name:     org.anddev.andengine.opengl.texture.BuildableTexture
 * JD-Core Version:    0.7.0.1
 */