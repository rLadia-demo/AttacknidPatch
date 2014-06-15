/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObject;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectGroupProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXObjectGroup
implements TMXConstants {
    private final int mHeight;
    private final String mName;
    private final TMXProperties<TMXObjectGroupProperty> mTMXObjectGroupProperties = new TMXProperties<TMXObjectGroupProperty>();
    private final ArrayList<TMXObject> mTMXObjects = new ArrayList<TMXObject>();
    private final int mWidth;

    public TMXObjectGroup(Attributes attributes) {
        this.mName = attributes.getValue("", "name");
        this.mWidth = SAXUtils.getIntAttributeOrThrow(attributes, "width");
        this.mHeight = SAXUtils.getIntAttributeOrThrow(attributes, "height");
    }

    void addTMXObject(TMXObject tMXObject) {
        this.mTMXObjects.add(tMXObject);
    }

    public void addTMXObjectGroupProperty(TMXObjectGroupProperty tMXObjectGroupProperty) {
        this.mTMXObjectGroupProperties.add((Object)tMXObjectGroupProperty);
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

