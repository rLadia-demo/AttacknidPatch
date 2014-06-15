package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public class FillTextureSourceDecorator extends BaseShapeTextureSourceDecorator
{
    protected final int mFillColor;
    
    public FillTextureSourceDecorator(final ITextureSource textureSource, final int n) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n);
    }
    
    public FillTextureSourceDecorator(final ITextureSource textureSource, final int n, final boolean b) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, b);
    }
    
    public FillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n) {
        this(textureSource, textureSourceDecoratorShape, n, false);
    }
    
    public FillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n, final boolean b) {
        super(textureSource, textureSourceDecoratorShape, b);
        this.mFillColor = n;
        this.mPaint.setStyle(Paint$Style.FILL);
        this.mPaint.setColor(n);
    }
    
    @Override
    public FillTextureSourceDecorator clone() {
        return new FillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFillColor, this.mAntiAliasing);
    }
}
