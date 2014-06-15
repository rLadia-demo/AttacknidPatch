package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;

public class TMXObject implements TMXConstants
{
    private final int mHeight;
    private final String mName;
    private final TMXProperties<TMXObjectProperty> mTMXObjectProperties;
    private final String mType;
    private final int mWidth;
    private final int mX;
    private final int mY;
    
    public TMXObject(final Attributes attributes) {
        super();
        this.mTMXObjectProperties = new TMXProperties<TMXObjectProperty>();
        this.mName = attributes.getValue("", "name");
        this.mType = attributes.getValue("", "type");
        this.mX = SAXUtils.getIntAttributeOrThrow(attributes, "x");
        this.mY = SAXUtils.getIntAttributeOrThrow(attributes, "y");
        this.mWidth = SAXUtils.getIntAttribute(attributes, "width", 0);
        this.mHeight = SAXUtils.getIntAttribute(attributes, "height", 0);
    }
    
    public void addTMXObjectProperty(final TMXObjectProperty tmxObjectProperty) {
        this.mTMXObjectProperties.add(tmxObjectProperty);
    }
    
    public int getHeight() {
        return this.mHeight;
    }
    
    public String getName() {
        return this.mName;
    }
    
    public TMXProperties<TMXObjectProperty> getTMXObjectProperties() {
        return this.mTMXObjectProperties;
    }
    
    public String getType() {
        return this.mType;
    }
    
    public int getWidth() {
        return this.mWidth;
    }
    
    public int getX() {
        return this.mX;
    }
    
    public int getY() {
        return this.mY;
    }
}
