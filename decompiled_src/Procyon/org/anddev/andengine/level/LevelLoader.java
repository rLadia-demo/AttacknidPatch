package org.anddev.andengine.level;

import org.anddev.andengine.level.util.constants.*;
import java.util.*;
import android.content.*;
import javax.xml.parsers.*;
import org.anddev.andengine.util.*;
import java.io.*;
import org.xml.sax.*;

public class LevelLoader implements LevelConstants
{
    private String mAssetBasePath;
    private final HashMap<String, IEntityLoader> mEntityLoaders;
    
    public LevelLoader() {
        this("");
    }
    
    public LevelLoader(final String assetBasePath) {
        super();
        this.mEntityLoaders = new HashMap<String, IEntityLoader>();
        this.setAssetBasePath(assetBasePath);
    }
    
    public void loadLevelFromAsset(final Context context, final String s) throws IOException {
        this.loadLevelFromStream(context.getAssets().open(String.valueOf(this.mAssetBasePath) + s));
    }
    
    public void loadLevelFromResource(final Context context, final int n) throws IOException {
        this.loadLevelFromStream(context.getResources().openRawResource(n));
    }
    
    public void loadLevelFromStream(final InputStream inputStream) throws IOException {
        try {
            final XMLReader xmlReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            xmlReader.setContentHandler(new LevelParser(this.mEntityLoaders));
            xmlReader.parse(new InputSource(new BufferedInputStream(inputStream)));
        }
        catch (SAXException ex) {
            Debug.e(ex);
        }
        catch (ParserConfigurationException ex2) {
            Debug.e(ex2);
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }
    
    public void registerEntityLoader(final String s, final IEntityLoader entityLoader) {
        this.mEntityLoaders.put(s, entityLoader);
    }
    
    public void registerEntityLoader(final String[] array, final IEntityLoader entityLoader) {
        final HashMap<String, IEntityLoader> mEntityLoaders = this.mEntityLoaders;
        for (int i = -1 + array.length; i >= 0; --i) {
            mEntityLoaders.put(array[i], entityLoader);
        }
    }
    
    public void setAssetBasePath(final String mAssetBasePath) {
        if (mAssetBasePath.endsWith("/") || mAssetBasePath.length() == 0) {
            this.mAssetBasePath = mAssetBasePath;
            return;
        }
        throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
    }
    
    public interface IEntityLoader
    {
        void onLoadEntity(String p0, Attributes p1);
    }
}
