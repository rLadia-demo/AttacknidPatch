/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.AvoidXfermode
 *  android.graphics.AvoidXfermode$Mode
 *  android.graphics.Paint
 *  android.graphics.Xfermode
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.AvoidXfermode;
import android.graphics.Paint;
import android.graphics.Xfermode;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.BaseShapeTextureSourceDecorator;

public class ColorKeyTextureSourceDecorator
extends BaseShapeTextureSourceDecorator {
    private static final int TOLERANCE_DEFAULT;
    private final int mColorKeyColor;

    public ColorKeyTextureSourceDecorator(ITextureSource iTextureSource, int n) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n);
    }

    public ColorKeyTextureSourceDecorator(ITextureSource iTextureSource, int n, int n2) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, n2);
    }

    public ColorKeyTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n) {
        this(iTextureSource, textureSourceDecoratorShape, n, 0);
    }

    public ColorKeyTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, int n2) {
        super(iTextureSource, textureSourceDecoratorShape);
        this.mColorKeyColor = n;
        this.mPaint.setXfermode((Xfermode)new AvoidXfermode(n, n2, AvoidXfermode.Mode.TARGET));
        this.mPaint.setColor(0);
    }

    @Override
    public ColorKeyTextureSourceDecorator clone() {
        return new ColorKeyTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mColorKeyColor);
    }
}

