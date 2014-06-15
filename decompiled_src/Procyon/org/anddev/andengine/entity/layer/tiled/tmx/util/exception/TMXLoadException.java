package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

public class TMXLoadException extends TMXException
{
    private static final long serialVersionUID = -8295358631698809883L;
    
    public TMXLoadException() {
        super();
    }
    
    public TMXLoadException(final String s) {
        super(s);
    }
    
    public TMXLoadException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public TMXLoadException(final Throwable t) {
        super(t);
    }
}
