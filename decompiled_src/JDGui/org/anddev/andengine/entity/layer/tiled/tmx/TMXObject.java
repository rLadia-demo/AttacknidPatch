package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXObject
  implements TMXConstants
{
  private final int mHeight;
  private final String mName;
  private final TMXProperties<TMXObjectProperty> mTMXObjectProperties = new TMXProperties();
  private final String mType;
  private final int mWidth;
  private final int mX;
  private final int mY;
  
  public TMXObject(Attributes paramAttributes)
  {
    this.mName = paramAttributes.getValue("", "name");
    this.mType = paramAttributes.getValue("", "type");
    this.mX = SAXUtils.getIntAttributeOrThrow(paramAttributes, "x");
    this.mY = SAXUtils.getIntAttributeOrThrow(paramAttributes, "y");
    this.mWidth = SAXUtils.getIntAttribute(paramAttributes, "width", 0);
    this.mHeight = SAXUtils.getIntAttribute(paramAttributes, "height", 0);
  }
  
  public void addTMXObjectProperty(TMXObjectProperty paramTMXObjectProperty)
  {
    this.mTMXObjectProperties.add(paramTMXObjectProperty);
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public TMXProperties<TMXObjectProperty> getTMXObjectProperties()
  {
    return this.mTMXObjectProperties;
  }
  
  public String getType()
  {
    return this.mType;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  public int getX()
  {
    return this.mX;
  }
  
  public int getY()
  {
    return this.mY;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXObject
 * JD-Core Version:    0.7.0.1
 */