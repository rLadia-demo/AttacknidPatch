/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 */
package org.anddev.andengine.opengl.texture.source;

import android.graphics.Bitmap;

public interface ITextureSource
extends Cloneable {
    public ITextureSource clone();

    public int getHeight();

    public int getWidth();

    public Bitmap onLoadBitmap();
}

