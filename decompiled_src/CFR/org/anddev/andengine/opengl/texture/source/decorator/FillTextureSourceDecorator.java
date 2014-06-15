/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Paint
 *  android.graphics.Paint$Style
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Paint;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.BaseShapeTextureSourceDecorator;

public class FillTextureSourceDecorator
extends BaseShapeTextureSourceDecorator {
    protected final int mFillColor;

    public FillTextureSourceDecorator(ITextureSource iTextureSource, int n) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n);
    }

    public FillTextureSourceDecorator(ITextureSource iTextureSource, int n, boolean bl) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, bl);
    }

    public FillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n) {
        this(iTextureSource, textureSourceDecoratorShape, n, false);
    }

    public FillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, boolean bl) {
        super(iTextureSource, textureSourceDecoratorShape, bl);
        this.mFillColor = n;
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(n);
    }

    @Override
    public FillTextureSourceDecorator clone() {
        return new FillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFillColor, this.mAntiAliasing);
    }
}

