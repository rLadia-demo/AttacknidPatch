package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.xml.sax.*;

public class TMXParseException extends SAXException
{
    private static final long serialVersionUID = 2213964295487921492L;
    
    public TMXParseException() {
        super();
    }
    
    public TMXParseException(final Exception ex) {
        super(ex);
    }
    
    public TMXParseException(final String s) {
        super(s);
    }
    
    public TMXParseException(final String s, final Exception ex) {
        super(s, ex);
    }
}
