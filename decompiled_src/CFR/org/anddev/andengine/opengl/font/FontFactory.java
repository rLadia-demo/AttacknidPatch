/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetManager
 *  android.graphics.Typeface
 */
package org.anddev.andengine.opengl.font;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Typeface;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.StrokeFont;
import org.anddev.andengine.opengl.texture.Texture;

public class FontFactory {
    private static String sAssetBasePath = "";

    public static Font create(Texture texture, Typeface typeface, float f, boolean bl, int n) {
        return new Font(texture, typeface, f, bl, n);
    }

    public static Font createFromAsset(Texture texture, Context context, String string, float f, boolean bl, int n) {
        return new Font(texture, Typeface.createFromAsset((AssetManager)context.getAssets(), (String)(String.valueOf(FontFactory.sAssetBasePath) + string)), f, bl, n);
    }

    public static StrokeFont createStroke(Texture texture, Typeface typeface, float f, boolean bl, int n, int n2, int n3) {
        return new StrokeFont(texture, typeface, f, bl, n, n2, n3);
    }

    public static StrokeFont createStroke(Texture texture, Typeface typeface, float f, boolean bl, int n, int n2, int n3, boolean bl2) {
        return new StrokeFont(texture, typeface, f, bl, n, n2, n3, bl2);
    }

    public static StrokeFont createStrokeFromAsset(Texture texture, Context context, String string, float f, boolean bl, int n, int n2, int n3) {
        return new StrokeFont(texture, Typeface.createFromAsset((AssetManager)context.getAssets(), (String)(String.valueOf(FontFactory.sAssetBasePath) + string)), f, bl, n, n2, n3);
    }

    public static StrokeFont createStrokeFromAsset(Texture texture, Context context, String string, float f, boolean bl, int n, int n2, int n3, boolean bl2) {
        return new StrokeFont(texture, Typeface.createFromAsset((AssetManager)context.getAssets(), (String)(String.valueOf(FontFactory.sAssetBasePath) + string)), f, bl, n, n2, n3, bl2);
    }

    public static void setAssetBasePath(String string) {
        if (!string.endsWith("/") && string.length() != 0) throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
        FontFactory.sAssetBasePath = string;
    }
}

