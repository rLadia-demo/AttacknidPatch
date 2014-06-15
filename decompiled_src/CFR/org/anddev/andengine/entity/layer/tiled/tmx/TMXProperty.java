/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.xml.sax.Attributes;

public class TMXProperty
implements TMXConstants {
    private final String mName;
    private final String mValue;

    public TMXProperty(Attributes attributes) {
        this.mName = attributes.getValue("", "name");
        this.mValue = attributes.getValue("", "value");
    }

    public String getName() {
        return this.mName;
    }

    public String getValue() {
        return this.mValue;
    }

    public String toString() {
        return String.valueOf(this.mName) + "='" + this.mValue + "'";
    }
}

