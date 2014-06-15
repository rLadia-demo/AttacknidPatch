package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

public class TSXLoadException extends TMXException
{
    private static final long serialVersionUID = 10055223972707703L;
    
    public TSXLoadException() {
        super();
    }
    
    public TSXLoadException(final String s) {
        super(s);
    }
    
    public TSXLoadException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public TSXLoadException(final Throwable t) {
        super(t);
    }
}
