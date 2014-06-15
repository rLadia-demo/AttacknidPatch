package org.anddev.andengine.opengl.font;

import org.anddev.andengine.opengl.texture.*;
import android.graphics.*;
import android.content.*;

public class FontFactory
{
    private static String sAssetBasePath;
    
    static {
        FontFactory.sAssetBasePath = "";
    }
    
    public static Font create(final Texture texture, final Typeface typeface, final float n, final boolean b, final int n2) {
        return new Font(texture, typeface, n, b, n2);
    }
    
    public static Font createFromAsset(final Texture texture, final Context context, final String s, final float n, final boolean b, final int n2) {
        return new Font(texture, Typeface.createFromAsset(context.getAssets(), String.valueOf(FontFactory.sAssetBasePath) + s), n, b, n2);
    }
    
    public static StrokeFont createStroke(final Texture texture, final Typeface typeface, final float n, final boolean b, final int n2, final int n3, final int n4) {
        return new StrokeFont(texture, typeface, n, b, n2, n3, n4);
    }
    
    public static StrokeFont createStroke(final Texture texture, final Typeface typeface, final float n, final boolean b, final int n2, final int n3, final int n4, final boolean b2) {
        return new StrokeFont(texture, typeface, n, b, n2, n3, n4, b2);
    }
    
    public static StrokeFont createStrokeFromAsset(final Texture texture, final Context context, final String s, final float n, final boolean b, final int n2, final int n3, final int n4) {
        return new StrokeFont(texture, Typeface.createFromAsset(context.getAssets(), String.valueOf(FontFactory.sAssetBasePath) + s), n, b, n2, n3, n4);
    }
    
    public static StrokeFont createStrokeFromAsset(final Texture texture, final Context context, final String s, final float n, final boolean b, final int n2, final int n3, final int n4, final boolean b2) {
        return new StrokeFont(texture, Typeface.createFromAsset(context.getAssets(), String.valueOf(FontFactory.sAssetBasePath) + s), n, b, n2, n3, n4, b2);
    }
    
    public static void setAssetBasePath(final String sAssetBasePath) {
        if (sAssetBasePath.endsWith("/") || sAssetBasePath.length() == 0) {
            FontFactory.sAssetBasePath = sAssetBasePath;
            return;
        }
        throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
    }
}
