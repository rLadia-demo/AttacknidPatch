package org.anddev.andengine.opengl.texture;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import javax.microedition.khronos.opengles.GL10;

public class TextureManager
{
  private final ArrayList<Texture> mTexturesLoaded = new ArrayList();
  private final HashSet<Texture> mTexturesManaged = new HashSet();
  private final ArrayList<Texture> mTexturesToBeLoaded = new ArrayList();
  private final ArrayList<Texture> mTexturesToBeUnloaded = new ArrayList();
  
  protected void clear()
  {
    this.mTexturesToBeLoaded.clear();
    this.mTexturesLoaded.clear();
    this.mTexturesManaged.clear();
  }
  
  public boolean loadTexture(Texture paramTexture)
  {
    if (this.mTexturesManaged.contains(paramTexture))
    {
      this.mTexturesToBeUnloaded.remove(paramTexture);
      return false;
    }
    this.mTexturesManaged.add(paramTexture);
    this.mTexturesToBeLoaded.add(paramTexture);
    return true;
  }
  
  public void loadTextures(Texture... paramVarArgs)
  {
    for (int i = -1 + paramVarArgs.length;; i--)
    {
      if (i < 0) {
        return;
      }
      loadTexture(paramVarArgs[i]);
    }
  }
  
  public void reloadTextures()
  {
    Iterator localIterator = this.mTexturesManaged.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        this.mTexturesToBeLoaded.addAll(this.mTexturesLoaded);
        this.mTexturesLoaded.clear();
        this.mTexturesManaged.removeAll(this.mTexturesToBeUnloaded);
        this.mTexturesToBeUnloaded.clear();
        return;
      }
      ((Texture)localIterator.next()).setLoadedToHardware(false);
    }
  }
  
  public boolean unloadTexture(Texture paramTexture)
  {
    if (this.mTexturesManaged.contains(paramTexture))
    {
      if (this.mTexturesLoaded.contains(paramTexture)) {
        this.mTexturesToBeUnloaded.add(paramTexture);
      }
      for (;;)
      {
        return true;
        if (this.mTexturesToBeLoaded.remove(paramTexture)) {
          this.mTexturesManaged.remove(paramTexture);
        }
      }
    }
    return false;
  }
  
  public void unloadTextures(Texture... paramVarArgs)
  {
    for (int i = -1 + paramVarArgs.length;; i--)
    {
      if (i < 0) {
        return;
      }
      unloadTexture(paramVarArgs[i]);
    }
  }
  
  public void updateTextures(GL10 paramGL10)
  {
    HashSet localHashSet = this.mTexturesManaged;
    ArrayList localArrayList1 = this.mTexturesLoaded;
    ArrayList localArrayList2 = this.mTexturesToBeLoaded;
    ArrayList localArrayList3 = this.mTexturesToBeUnloaded;
    int i = localArrayList1.size();
    int i1;
    int j;
    int n;
    label62:
    int k;
    if (i > 0)
    {
      i1 = i - 1;
      if (i1 >= 0) {}
    }
    else
    {
      j = localArrayList2.size();
      if (j > 0)
      {
        n = j - 1;
        if (n >= 0) {
          break label141;
        }
      }
      k = localArrayList3.size();
      if (k <= 0) {}
    }
    for (int m = k - 1;; m--)
    {
      if (m < 0)
      {
        if ((j > 0) || (k > 0)) {
          System.gc();
        }
        return;
        Texture localTexture3 = (Texture)localArrayList1.get(i1);
        if (localTexture3.isUpdateOnHardwareNeeded())
        {
          localTexture3.unloadFromHardware(paramGL10);
          localTexture3.loadToHardware(paramGL10);
        }
        i1--;
        break;
        label141:
        Texture localTexture2 = (Texture)localArrayList2.remove(n);
        if (!localTexture2.isLoadedToHardware()) {
          localTexture2.loadToHardware(paramGL10);
        }
        localArrayList1.add(localTexture2);
        n--;
        break label62;
      }
      Texture localTexture1 = (Texture)localArrayList3.remove(m);
      if (localTexture1.isLoadedToHardware()) {
        localTexture1.unloadFromHardware(paramGL10);
      }
      localArrayList1.remove(localTexture1);
      localHashSet.remove(localTexture1);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.TextureManager
 * JD-Core Version:    0.7.0.1
 */