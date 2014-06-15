/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.level;

import java.util.HashMap;
import org.anddev.andengine.level.LevelLoader;
import org.anddev.andengine.level.util.constants.LevelConstants;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class LevelParser
extends DefaultHandler
implements LevelConstants {
    private final HashMap<String, LevelLoader.IEntityLoader> mEntityLoaders;

    public LevelParser(HashMap<String, LevelLoader.IEntityLoader> hashMap) {
        this.mEntityLoaders = hashMap;
    }

    @Override
    public void startElement(String string3, String string2, String string3, Attributes attributes) throws SAXException {
        LevelLoader.IEntityLoader iEntityLoader = this.mEntityLoaders.get(string2);
        if (iEntityLoader == null) throw new IllegalArgumentException("Unexpected tag: '" + string2 + "'.");
        iEntityLoader.onLoadEntity(string2, attributes);
    }
}

