/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXObject
implements TMXConstants {
    private final int mHeight;
    private final String mName;
    private final TMXProperties<TMXObjectProperty> mTMXObjectProperties = new TMXProperties<TMXObjectProperty>();
    private final String mType;
    private final int mWidth;
    private final int mX;
    private final int mY;

    public TMXObject(Attributes attributes) {
        this.mName = attributes.getValue("", "name");
        this.mType = attributes.getValue("", "type");
        this.mX = SAXUtils.getIntAttributeOrThrow(attributes, "x");
        this.mY = SAXUtils.getIntAttributeOrThrow(attributes, "y");
        this.mWidth = SAXUtils.getIntAttribute(attributes, "width", 0);
        this.mHeight = SAXUtils.getIntAttribute(attributes, "height", 0);
    }

    public void addTMXObjectProperty(TMXObjectProperty tMXObjectProperty) {
        this.mTMXObjectProperties.add((Object)tMXObjectProperty);
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

