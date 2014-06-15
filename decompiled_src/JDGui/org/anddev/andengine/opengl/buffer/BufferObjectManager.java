package org.anddev.andengine.opengl.buffer;

import java.util.ArrayList;
import java.util.HashSet;
import javax.microedition.khronos.opengles.GL11;

public class BufferObjectManager
{
  private static BufferObjectManager mActiveInstance = null;
  private static final ArrayList<BufferObject> mBufferObjectsLoaded;
  private static final HashSet<BufferObject> mBufferObjectsManaged = new HashSet();
  private static final ArrayList<BufferObject> mBufferObjectsToBeLoaded;
  private static final ArrayList<BufferObject> mBufferObjectsToBeUnloaded;
  
  static
  {
    mBufferObjectsLoaded = new ArrayList();
    mBufferObjectsToBeLoaded = new ArrayList();
    mBufferObjectsToBeUnloaded = new ArrayList();
  }
  
  public static BufferObjectManager getActiveInstance()
  {
    return mActiveInstance;
  }
  
  public static void setActiveInstance(BufferObjectManager paramBufferObjectManager)
  {
    mActiveInstance = paramBufferObjectManager;
  }
  
  public void clear()
  {
    mBufferObjectsToBeLoaded.clear();
    mBufferObjectsLoaded.clear();
    mBufferObjectsManaged.clear();
  }
  
  public void loadBufferObject(BufferObject paramBufferObject)
  {
    if (paramBufferObject == null) {
      return;
    }
    if (mBufferObjectsManaged.contains(paramBufferObject))
    {
      mBufferObjectsToBeUnloaded.remove(paramBufferObject);
      return;
    }
    mBufferObjectsManaged.add(paramBufferObject);
    mBufferObjectsToBeLoaded.add(paramBufferObject);
  }
  
  public void loadBufferObjects(BufferObject... paramVarArgs)
  {
    for (int i = -1 + paramVarArgs.length;; i--)
    {
      if (i < 0) {
        return;
      }
      loadBufferObject(paramVarArgs[i]);
    }
  }
  
  public void reloadBufferObjects()
  {
    ArrayList localArrayList = mBufferObjectsLoaded;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0)
      {
        mBufferObjectsToBeLoaded.addAll(localArrayList);
        localArrayList.clear();
        return;
      }
      ((BufferObject)localArrayList.get(i)).setLoadedToHardware(false);
    }
  }
  
  public void unloadBufferObject(BufferObject paramBufferObject)
  {
    if (paramBufferObject == null) {}
    do
    {
      do
      {
        return;
      } while (!mBufferObjectsManaged.contains(paramBufferObject));
      if (mBufferObjectsLoaded.contains(paramBufferObject))
      {
        mBufferObjectsToBeUnloaded.add(paramBufferObject);
        return;
      }
    } while (!mBufferObjectsToBeLoaded.remove(paramBufferObject));
    mBufferObjectsManaged.remove(paramBufferObject);
  }
  
  public void unloadBufferObjects(BufferObject... paramVarArgs)
  {
    for (int i = -1 + paramVarArgs.length;; i--)
    {
      if (i < 0) {
        return;
      }
      unloadBufferObject(paramVarArgs[i]);
    }
  }
  
  public void updateBufferObjects(GL11 paramGL11)
  {
    HashSet localHashSet = mBufferObjectsManaged;
    ArrayList localArrayList1 = mBufferObjectsLoaded;
    ArrayList localArrayList2 = mBufferObjectsToBeLoaded;
    ArrayList localArrayList3 = mBufferObjectsToBeUnloaded;
    int i = localArrayList2.size();
    int m;
    int j;
    if (i > 0)
    {
      m = i - 1;
      if (m < 0) {
        localArrayList2.clear();
      }
    }
    else
    {
      j = localArrayList3.size();
      if (j <= 0) {}
    }
    for (int k = j - 1;; k--)
    {
      if (k < 0)
      {
        return;
        BufferObject localBufferObject2 = (BufferObject)localArrayList2.get(m);
        if (!localBufferObject2.isLoadedToHardware())
        {
          localBufferObject2.loadToHardware(paramGL11);
          localBufferObject2.setHardwareBufferNeedsUpdate();
        }
        localArrayList1.add(localBufferObject2);
        m--;
        break;
      }
      BufferObject localBufferObject1 = (BufferObject)localArrayList3.remove(k);
      if (localBufferObject1.isLoadedToHardware()) {
        localBufferObject1.unloadFromHardware(paramGL11);
      }
      localArrayList1.remove(localBufferObject1);
      localHashSet.remove(localBufferObject1);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.buffer.BufferObjectManager
 * JD-Core Version:    0.7.0.1
 */