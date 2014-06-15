package org.anddev.andengine.level;

import java.util.HashMap;
import org.anddev.andengine.level.util.constants.LevelConstants;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class LevelParser
  extends DefaultHandler
  implements LevelConstants
{
  private final HashMap<String, LevelLoader.IEntityLoader> mEntityLoaders;
  
  public LevelParser(HashMap<String, LevelLoader.IEntityLoader> paramHashMap)
  {
    this.mEntityLoaders = paramHashMap;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    LevelLoader.IEntityLoader localIEntityLoader = (LevelLoader.IEntityLoader)this.mEntityLoaders.get(paramString2);
    if (localIEntityLoader != null)
    {
      localIEntityLoader.onLoadEntity(paramString2, paramAttributes);
      return;
    }
    throw new IllegalArgumentException("Unexpected tag: '" + paramString2 + "'.");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.level.LevelParser
 * JD-Core Version:    0.7.0.1
 */