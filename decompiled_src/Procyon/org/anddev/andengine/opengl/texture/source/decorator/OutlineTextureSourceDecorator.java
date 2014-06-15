package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public class OutlineTextureSourceDecorator extends BaseShapeTextureSourceDecorator
{
    protected final int mOutlineColor;
    
    public OutlineTextureSourceDecorator(final ITextureSource textureSource, final int n) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n);
    }
    
    public OutlineTextureSourceDecorator(final ITextureSource textureSource, final int n, final boolean b) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, b);
    }
    
    public OutlineTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n) {
        this(textureSource, textureSourceDecoratorShape, n, false);
    }
    
    public OutlineTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n, final boolean b) {
        super(textureSource, textureSourceDecoratorShape, b);
        this.mOutlineColor = n;
        this.mPaint.setStyle(Paint$Style.STROKE);
        this.mPaint.setColor(n);
    }
    
    @Override
    public OutlineTextureSourceDecorator clone() {
        return new OutlineTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mOutlineColor, this.mAntiAliasing);
    }
}
