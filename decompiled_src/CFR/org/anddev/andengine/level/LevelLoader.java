/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetManager
 *  android.content.res.Resources
 */
package org.anddev.andengine.level;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.anddev.andengine.level.LevelParser;
import org.anddev.andengine.level.util.constants.LevelConstants;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;
import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class LevelLoader
implements LevelConstants {
    private String mAssetBasePath;
    private final HashMap<String, IEntityLoader> mEntityLoaders = new HashMap<String, IEntityLoader>();

    public LevelLoader() {
        this("");
    }

    public LevelLoader(String string) {
        this.setAssetBasePath(string);
    }

    public void loadLevelFromAsset(Context context, String string) throws IOException {
        this.loadLevelFromStream(context.getAssets().open(String.valueOf(this.mAssetBasePath) + string));
    }

    public void loadLevelFromResource(Context context, int n) throws IOException {
        this.loadLevelFromStream(context.getResources().openRawResource(n));
    }

    public void loadLevelFromStream(InputStream inputStream) throws IOException {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            xMLReader.setContentHandler(new LevelParser(this.mEntityLoaders));
            xMLReader.parse(new InputSource(new BufferedInputStream(inputStream)));
            return;
        }
        catch (SAXException var4_3) {
            Debug.e(var4_3);
            return;
        }
        catch (ParserConfigurationException var3_4) {
            Debug.e(var3_4);
            return;
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }

    public void registerEntityLoader(String string, IEntityLoader iEntityLoader) {
        this.mEntityLoaders.put(string, iEntityLoader);
    }

    public void registerEntityLoader(String[] arrstring, IEntityLoader iEntityLoader) {
        HashMap<String, IEntityLoader> hashMap = this.mEntityLoaders;
        int n = -1 + arrstring.length;
        while (n >= 0) {
            hashMap.put(arrstring[n], iEntityLoader);
            --n;
        }
        return;
    }

    public void setAssetBasePath(String string) {
        if (!string.endsWith("/") && string.length() != 0) throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
        this.mAssetBasePath = string;
    }

    public interface IEntityLoader {
        public void onLoadEntity(String var1, Attributes var2);
    }

}

