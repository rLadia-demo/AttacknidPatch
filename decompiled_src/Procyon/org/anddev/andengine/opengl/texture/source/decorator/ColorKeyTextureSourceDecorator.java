package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public class ColorKeyTextureSourceDecorator extends BaseShapeTextureSourceDecorator
{
    private static final int TOLERANCE_DEFAULT;
    private final int mColorKeyColor;
    
    public ColorKeyTextureSourceDecorator(final ITextureSource textureSource, final int n) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n);
    }
    
    public ColorKeyTextureSourceDecorator(final ITextureSource textureSource, final int n, final int n2) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, n2);
    }
    
    public ColorKeyTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n) {
        this(textureSource, textureSourceDecoratorShape, n, 0);
    }
    
    public ColorKeyTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int mColorKeyColor, final int n) {
        super(textureSource, textureSourceDecoratorShape);
        this.mColorKeyColor = mColorKeyColor;
        this.mPaint.setXfermode((Xfermode)new AvoidXfermode(mColorKeyColor, n, AvoidXfermode$Mode.TARGET));
        this.mPaint.setColor(0);
    }
    
    @Override
    public ColorKeyTextureSourceDecorator clone() {
        return new ColorKeyTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mColorKeyColor);
    }
}
