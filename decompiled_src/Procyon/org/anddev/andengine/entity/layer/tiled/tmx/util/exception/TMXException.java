package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

public abstract class TMXException extends Exception
{
    private static final long serialVersionUID = 337819550394833109L;
    
    public TMXException() {
        super();
    }
    
    public TMXException(final String s) {
        super(s);
    }
    
    public TMXException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public TMXException(final Throwable t) {
        super(t);
    }
}
