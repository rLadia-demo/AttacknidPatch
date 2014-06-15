package org.anddev.andengine.opengl.texture.builder;

import java.util.ArrayList;
import org.anddev.andengine.opengl.texture.BuildableTexture;
import org.anddev.andengine.opengl.texture.BuildableTexture.TextureSourceWithWithLocationCallback;

public abstract interface ITextureBuilder
{
  public abstract void pack(BuildableTexture paramBuildableTexture, ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> paramArrayList)
    throws ITextureBuilder.TextureSourcePackingException;
  
  public static class TextureSourcePackingException
    extends Exception
  {
    private static final long serialVersionUID = 4700734424214372671L;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.builder.ITextureBuilder
 * JD-Core Version:    0.7.0.1
 */