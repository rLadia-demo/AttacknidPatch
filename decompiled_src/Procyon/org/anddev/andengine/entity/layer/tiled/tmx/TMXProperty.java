package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import org.xml.sax.*;

public class TMXProperty implements TMXConstants
{
    private final String mName;
    private final String mValue;
    
    public TMXProperty(final Attributes attributes) {
        super();
        this.mName = attributes.getValue("", "name");
        this.mValue = attributes.getValue("", "value");
    }
    
    public String getName() {
        return this.mName;
    }
    
    public String getValue() {
        return this.mValue;
    }
    
    @Override
    public String toString() {
        return String.valueOf(this.mName) + "='" + this.mValue + "'";
    }
}
