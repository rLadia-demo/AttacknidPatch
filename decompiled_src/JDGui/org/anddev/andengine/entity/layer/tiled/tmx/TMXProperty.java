package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.xml.sax.Attributes;

public class TMXProperty
  implements TMXConstants
{
  private final String mName;
  private final String mValue;
  
  public TMXProperty(Attributes paramAttributes)
  {
    this.mName = paramAttributes.getValue("", "name");
    this.mValue = paramAttributes.getValue("", "value");
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public String getValue()
  {
    return this.mValue;
  }
  
  public String toString()
  {
    return this.mName + "='" + this.mValue + "'";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXProperty
 * JD-Core Version:    0.7.0.1
 */