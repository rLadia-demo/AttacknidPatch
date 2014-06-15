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

public class OutlineTextureSourceDecorator
extends BaseShapeTextureSourceDecorator {
    protected final int mOutlineColor;

    public OutlineTextureSourceDecorator(ITextureSource iTextureSource, int n) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n);
    }

    public OutlineTextureSourceDecorator(ITextureSource iTextureSource, int n, boolean bl) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, bl);
    }

    public OutlineTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n) {
        this(iTextureSource, textureSourceDecoratorShape, n, false);
    }

    public OutlineTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, boolean bl) {
        super(iTextureSource, textureSourceDecoratorShape, bl);
        this.mOutlineColor = n;
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setColor(n);
    }

    @Override
    public OutlineTextureSourceDecorator clone() {
        return new OutlineTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mOutlineColor, this.mAntiAliasing);
    }
}

