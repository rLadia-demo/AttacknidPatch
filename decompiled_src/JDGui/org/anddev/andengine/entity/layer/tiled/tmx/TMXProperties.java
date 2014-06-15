package org.anddev.andengine.entity.layer.tiled.tmx;

import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;

public class TMXProperties<T extends TMXProperty>
  extends ArrayList<T>
  implements TMXConstants
{
  private static final long serialVersionUID = 8912773556975105201L;
  
  public boolean containsTMXProperty(String paramString1, String paramString2)
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return false;
      }
      TMXProperty localTMXProperty = (TMXProperty)get(i);
      if ((localTMXProperty.getName().equals(paramString1)) && (localTMXProperty.getValue().equals(paramString2))) {
        return true;
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties
 * JD-Core Version:    0.7.0.1
 */