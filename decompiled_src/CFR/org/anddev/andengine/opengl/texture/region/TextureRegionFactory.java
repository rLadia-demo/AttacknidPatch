/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 */
package org.anddev.andengine.opengl.texture.region;

import android.content.Context;
import org.anddev.andengine.opengl.texture.BuildableTexture;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.opengl.texture.source.AssetTextureSource;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.ResourceTextureSource;
import org.anddev.andengine.util.Callback;

public class TextureRegionFactory {
    private static String sAssetBasePath = "";

    public static TextureRegion createFromAsset(BuildableTexture buildableTexture, Context context, String string) {
        return TextureRegionFactory.createFromSource(buildableTexture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + string));
    }

    public static TextureRegion createFromAsset(Texture texture, Context context, String string, int n, int n2) {
        return TextureRegionFactory.createFromSource(texture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + string), n, n2);
    }

    public static TextureRegion createFromResource(BuildableTexture buildableTexture, Context context, int n) {
        return TextureRegionFactory.createFromSource(buildableTexture, new ResourceTextureSource(context, n));
    }

    public static TextureRegion createFromResource(Texture texture, Context context, int n, int n2, int n3) {
        return TextureRegionFactory.createFromSource(texture, new ResourceTextureSource(context, n), n2, n3);
    }

    public static TextureRegion createFromSource(BuildableTexture buildableTexture, ITextureSource iTextureSource) {
        TextureRegion textureRegion = new TextureRegion(buildableTexture, 0, 0, iTextureSource.getWidth(), iTextureSource.getHeight());
        buildableTexture.addTextureSource(iTextureSource, new Callback<Texture.TextureSourceWithLocation>(textureRegion){
            private final /* synthetic */ TextureRegion val$textureRegion;

            @Override
            public void onCallback(Texture.TextureSourceWithLocation textureSourceWithLocation) {
                this.val$textureRegion.setTexturePosition(textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY());
            }
        });
        return textureRegion;
    }

    public static TextureRegion createFromSource(Texture texture, ITextureSource iTextureSource, int n, int n2) {
        TextureRegion textureRegion = new TextureRegion(texture, n, n2, iTextureSource.getWidth(), iTextureSource.getHeight());
        texture.addTextureSource(iTextureSource, textureRegion.getTexturePositionX(), textureRegion.getTexturePositionY());
        return textureRegion;
    }

    public static TiledTextureRegion createTiledFromAsset(BuildableTexture buildableTexture, Context context, String string, int n, int n2) {
        return TextureRegionFactory.createTiledFromSource(buildableTexture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + string), n, n2);
    }

    public static TiledTextureRegion createTiledFromAsset(Texture texture, Context context, String string, int n, int n2, int n3, int n4) {
        return TextureRegionFactory.createTiledFromSource(texture, new AssetTextureSource(context, String.valueOf(TextureRegionFactory.sAssetBasePath) + string), n, n2, n3, n4);
    }

    public static TiledTextureRegion createTiledFromResource(BuildableTexture buildableTexture, Context context, int n, int n2, int n3) {
        return TextureRegionFactory.createTiledFromSource(buildableTexture, new ResourceTextureSource(context, n), n2, n3);
    }

    public static TiledTextureRegion createTiledFromResource(Texture texture, Context context, int n, int n2, int n3, int n4, int n5) {
        return TextureRegionFactory.createTiledFromSource(texture, new ResourceTextureSource(context, n), n2, n3, n4, n5);
    }

    public static TiledTextureRegion createTiledFromSource(BuildableTexture buildableTexture, ITextureSource iTextureSource, int n, int n2) {
        TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(buildableTexture, 0, 0, iTextureSource.getWidth(), iTextureSource.getHeight(), n, n2);
        buildableTexture.addTextureSource(iTextureSource, new Callback<Texture.TextureSourceWithLocation>(tiledTextureRegion){
            private final /* synthetic */ TiledTextureRegion val$tiledTextureRegion;

            @Override
            public void onCallback(Texture.TextureSourceWithLocation textureSourceWithLocation) {
                this.val$tiledTextureRegion.setTexturePosition(textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY());
            }
        });
        return tiledTextureRegion;
    }

    public static TiledTextureRegion createTiledFromSource(Texture texture, ITextureSource iTextureSource, int n, int n2, int n3, int n4) {
        TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(texture, n, n2, iTextureSource.getWidth(), iTextureSource.getHeight(), n3, n4);
        texture.addTextureSource(iTextureSource, tiledTextureRegion.getTexturePositionX(), tiledTextureRegion.getTexturePositionY());
        return tiledTextureRegion;
    }

    public static TextureRegion extractFromTexture(Texture texture, int n, int n2, int n3, int n4) {
        return new TextureRegion(texture, n, n2, n3, n4);
    }

    public static void setAssetBasePath(String string) {
        if (!string.endsWith("/") && string.length() != 0) throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
        TextureRegionFactory.sAssetBasePath = string;
    }

}

