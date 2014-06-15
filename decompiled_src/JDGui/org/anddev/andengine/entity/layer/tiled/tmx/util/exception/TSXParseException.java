package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.xml.sax.SAXException;

public class TSXParseException
  extends SAXException
{
  private static final long serialVersionUID = -7598783248970268198L;
  
  public TSXParseException() {}
  
  public TSXParseException(Exception paramException)
  {
    super(paramException);
  }
  
  public TSXParseException(String paramString)
  {
    super(paramString);
  }
  
  public TSXParseException(String paramString, Exception paramException)
  {
    super(paramString, paramException);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TSXParseException
 * JD-Core Version:    0.7.0.1
 */