package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import java.util.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;

public class TMXObjectGroup implements TMXConstants
{
    private final int mHeight;
    private final String mName;
    private final TMXProperties<TMXObjectGroupProperty> mTMXObjectGroupProperties;
    private final ArrayList<TMXObject> mTMXObjects;
    private final int mWidth;
    
    public TMXObjectGroup(final Attributes attributes) {
        super();
        this.mTMXObjects = new ArrayList<TMXObject>();
        this.mTMXObjectGroupProperties = new TMXProperties<TMXObjectGroupProperty>();
        this.mName = attributes.getValue("", "name");
        this.mWidth = SAXUtils.getIntAttributeOrThrow(attributes, "width");
        this.mHeight = SAXUtils.getIntAttributeOrThrow(attributes, "height");
    }
    
    void addTMXObject(final TMXObject tmxObject) {
        this.mTMXObjects.add(tmxObject);
    }
    
    public void addTMXObjectGroupProperty(final TMXObjectGroupProperty tmxObjectGroupProperty) {
        this.mTMXObjectGroupProperties.add(tmxObjectGroupProperty);
    }
    
    public int getHeight() {
        return this.mHeight;
    }
    
    public String getName() {
        return this.mName;
    }
    
    public TMXProperties<TMXObjectGroupProperty> getTMXObjectGroupProperties() {
        return this.mTMXObjectGroupProperties;
    }
    
    public ArrayList<TMXObject> getTMXObjects() {
        return this.mTMXObjects;
    }
    
    public int getWidth() {
        return this.mWidth;
    }
}
