package org.anddev.andengine.level;

import org.xml.sax.helpers.*;
import org.anddev.andengine.level.util.constants.*;
import java.util.*;
import org.xml.sax.*;

public class LevelParser extends DefaultHandler implements LevelConstants
{
    private final HashMap<String, LevelLoader.IEntityLoader> mEntityLoaders;
    
    public LevelParser(final HashMap<String, LevelLoader.IEntityLoader> mEntityLoaders) {
        super();
        this.mEntityLoaders = mEntityLoaders;
    }
    
    @Override
    public void startElement(final String s, final String s2, final String s3, final Attributes attributes) throws SAXException {
        final LevelLoader.IEntityLoader entityLoader = this.mEntityLoaders.get(s2);
        if (entityLoader != null) {
            entityLoader.onLoadEntity(s2, attributes);
            return;
        }
        throw new IllegalArgumentException("Unexpected tag: '" + s2 + "'.");
    }
}
