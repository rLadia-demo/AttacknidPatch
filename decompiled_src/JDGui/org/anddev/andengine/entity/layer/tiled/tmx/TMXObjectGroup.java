package org.anddev.andengine.entity.layer.tiled.tmx;

import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXObjectGroup
  implements TMXConstants
{
  private final int mHeight;
  private final String mName;
  private final TMXProperties<TMXObjectGroupProperty> mTMXObjectGroupProperties = new TMXProperties();
  private final ArrayList<TMXObject> mTMXObjects = new ArrayList();
  private final int mWidth;
  
  public TMXObjectGroup(Attributes paramAttributes)
  {
    this.mName = paramAttributes.getValue("", "name");
    this.mWidth = SAXUtils.getIntAttributeOrThrow(paramAttributes, "width");
    this.mHeight = SAXUtils.getIntAttributeOrThrow(paramAttributes, "height");
  }
  
  void addTMXObject(TMXObject paramTMXObject)
  {
    this.mTMXObjects.add(paramTMXObject);
  }
  
  public void addTMXObjectGroupProperty(TMXObjectGroupProperty paramTMXObjectGroupProperty)
  {
    this.mTMXObjectGroupProperties.add(paramTMXObjectGroupProperty);
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public TMXProperties<TMXObjectGroupProperty> getTMXObjectGroupProperties()
  {
    return this.mTMXObjectGroupProperties;
  }
  
  public ArrayList<TMXObject> getTMXObjects()
  {
    return this.mTMXObjects;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectGroup
 * JD-Core Version:    0.7.0.1
 */