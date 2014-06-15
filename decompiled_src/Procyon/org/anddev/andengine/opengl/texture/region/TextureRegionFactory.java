package org.anddev.andengine.opengl.texture.region;

import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.util.*;

public class TextureRegionFactory
{
    private static String sAssetBasePath;
    
    static {
        TextureRegionFactory.sAssetBasePath = "";
    }
    
    public static TextureRegion createFromAsset(final BuildableTexture buildableTexture, final Context context, final String s) {
        return createFromSource(buildableTexture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + s));
    }
    
    public static TextureRegion createFromAsset(final Texture texture, final Context context, final String s, final int n, final int n2) {
        return createFromSource(texture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + s), n, n2);
    }
    
    public static TextureRegion createFromResource(final BuildableTexture buildableTexture, final Context context, final int n) {
        return createFromSource(buildableTexture, new ResourceTextureSource(context, n));
    }
    
    public static TextureRegion createFromResource(final Texture texture, final Context context, final int n, final int n2, final int n3) {
        return createFromSource(texture, new ResourceTextureSource(context, n), n2, n3);
    }
    
    public static TextureRegion createFromSource(final BuildableTexture buildableTexture, final ITextureSource textureSource) {
        final TextureRegion textureRegion = new TextureRegion(buildableTexture, 0, 0, textureSource.getWidth(), textureSource.getHeight());
        buildableTexture.addTextureSource(textureSource, new Callback<Texture.TextureSourceWithLocation>() {
            @Override
            public void onCallback(final Texture.TextureSourceWithLocation textureSourceWithLocation) {
                textureRegion.setTexturePosition(textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY());
            }
        });
        return textureRegion;
    }
    
    public static TextureRegion createFromSource(final Texture texture, final ITextureSource textureSource, final int n, final int n2) {
        final TextureRegion textureRegion = new TextureRegion(texture, n, n2, textureSource.getWidth(), textureSource.getHeight());
        texture.addTextureSource(textureSource, textureRegion.getTexturePositionX(), textureRegion.getTexturePositionY());
        return textureRegion;
    }
    
    public static TiledTextureRegion createTiledFromAsset(final BuildableTexture buildableTexture, final Context context, final String s, final int n, final int n2) {
        return createTiledFromSource(buildableTexture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + s), n, n2);
    }
    
    public static TiledTextureRegion createTiledFromAsset(final Texture texture, final Context context, final String s, final int n, final int n2, final int n3, final int n4) {
        return createTiledFromSource(texture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + s), n, n2, n3, n4);
    }
    
    public static TiledTextureRegion createTiledFromResource(final BuildableTexture buildableTexture, final Context context, final int n, final int n2, final int n3) {
        return createTiledFromSource(buildableTexture, new ResourceTextureSource(context, n), n2, n3);
    }
    
    public static TiledTextureRegion createTiledFromResource(final Texture texture, final Context context, final int n, final int n2, final int n3, final int n4, final int n5) {
        return createTiledFromSource(texture, new ResourceTextureSource(context, n), n2, n3, n4, n5);
    }
    
    public static TiledTextureRegion createTiledFromSource(final BuildableTexture buildableTexture, final ITextureSource textureSource, final int n, final int n2) {
        final TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(buildableTexture, 0, 0, textureSource.getWidth(), textureSource.getHeight(), n, n2);
        buildableTexture.addTextureSource(textureSource, new Callback<Texture.TextureSourceWithLocation>() {
            @Override
            public void onCallback(final Texture.TextureSourceWithLocation textureSourceWithLocation) {
                tiledTextureRegion.setTexturePosition(textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY());
            }
        });
        return tiledTextureRegion;
    }
    
    public static TiledTextureRegion createTiledFromSource(final Texture texture, final ITextureSource textureSource, final int n, final int n2, final int n3, final int n4) {
        final TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(texture, n, n2, textureSource.getWidth(), textureSource.getHeight(), n3, n4);
        texture.addTextureSource(textureSource, tiledTextureRegion.getTexturePositionX(), tiledTextureRegion.getTexturePositionY());
        return tiledTextureRegion;
    }
    
    public static TextureRegion extractFromTexture(final Texture texture, final int n, final int n2, final int n3, final int n4) {
        return new TextureRegion(texture, n, n2, n3, n4);
    }
    
    public static void setAssetBasePath(final String sAssetBasePath) {
        if (sAssetBasePath.endsWith("/") || sAssetBasePath.length() == 0) {
            TextureRegionFactory.sAssetBasePath = sAssetBasePath;
            return;
        }
        throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
    }
}
