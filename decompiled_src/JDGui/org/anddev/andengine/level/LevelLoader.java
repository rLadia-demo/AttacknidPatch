package org.anddev.andengine.level;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.anddev.andengine.level.util.constants.LevelConstants;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class LevelLoader
  implements LevelConstants
{
  private String mAssetBasePath;
  private final HashMap<String, IEntityLoader> mEntityLoaders = new HashMap();
  
  public LevelLoader()
  {
    this("");
  }
  
  public LevelLoader(String paramString)
  {
    setAssetBasePath(paramString);
  }
  
  public void loadLevelFromAsset(Context paramContext, String paramString)
    throws IOException
  {
    loadLevelFromStream(paramContext.getAssets().open(this.mAssetBasePath + paramString));
  }
  
  public void loadLevelFromResource(Context paramContext, int paramInt)
    throws IOException
  {
    loadLevelFromStream(paramContext.getResources().openRawResource(paramInt));
  }
  
  public void loadLevelFromStream(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      XMLReader localXMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
      localXMLReader.setContentHandler(new LevelParser(this.mEntityLoaders));
      localXMLReader.parse(new InputSource(new BufferedInputStream(paramInputStream)));
      return;
    }
    catch (SAXException localSAXException)
    {
      Debug.e(localSAXException);
      return;
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      Debug.e(localParserConfigurationException);
      return;
    }
    finally
    {
      StreamUtils.closeStream(paramInputStream);
    }
  }
  
  public void registerEntityLoader(String paramString, IEntityLoader paramIEntityLoader)
  {
    this.mEntityLoaders.put(paramString, paramIEntityLoader);
  }
  
  public void registerEntityLoader(String[] paramArrayOfString, IEntityLoader paramIEntityLoader)
  {
    HashMap localHashMap = this.mEntityLoaders;
    for (int i = -1 + paramArrayOfString.length;; i--)
    {
      if (i < 0) {
        return;
      }
      localHashMap.put(paramArrayOfString[i], paramIEntityLoader);
    }
  }
  
  public void setAssetBasePath(String paramString)
  {
    if ((paramString.endsWith("/")) || (paramString.length() == 0))
    {
      this.mAssetBasePath = paramString;
      return;
    }
    throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
  }
  
  public static abstract interface IEntityLoader
  {
    public abstract void onLoadEntity(String paramString, Attributes paramAttributes);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.level.LevelLoader
 * JD-Core Version:    0.7.0.1
 */