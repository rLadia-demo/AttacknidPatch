package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.xml.sax.*;

public class TSXParseException extends SAXException
{
    private static final long serialVersionUID = -7598783248970268198L;
    
    public TSXParseException() {
        super();
    }
    
    public TSXParseException(final Exception ex) {
        super(ex);
    }
    
    public TSXParseException(final String s) {
        super(s);
    }
    
    public TSXParseException(final String s, final Exception ex) {
        super(s, ex);
    }
}
