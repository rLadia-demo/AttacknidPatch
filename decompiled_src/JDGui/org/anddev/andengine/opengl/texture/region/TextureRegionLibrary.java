package org.anddev.andengine.opengl.texture.region;

import android.util.SparseArray;
import org.anddev.andengine.util.Library;

public class TextureRegionLibrary
  extends Library<BaseTextureRegion>
{
  public TextureRegionLibrary() {}
  
  public TextureRegionLibrary(int paramInt)
  {
    super(paramInt);
  }
  
  public TextureRegion get(int paramInt)
  {
    return (TextureRegion)super.get(paramInt);
  }
  
  public TiledTextureRegion getTiled(int paramInt)
  {
    return (TiledTextureRegion)this.mItems.get(paramInt);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.TextureRegionLibrary
 * JD-Core Version:    0.7.0.1
 */