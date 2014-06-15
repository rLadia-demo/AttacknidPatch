package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public abstract class BaseShapeTextureSourceDecorator extends BaseTextureSourceDecorator
{
    protected final TextureSourceDecoratorShape mTextureSourceDecoratorShape;
    
    public BaseShapeTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape mTextureSourceDecoratorShape) {
        super(textureSource);
        this.mTextureSourceDecoratorShape = mTextureSourceDecoratorShape;
    }
    
    public BaseShapeTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape mTextureSourceDecoratorShape, final boolean b) {
        super(textureSource, b);
        this.mTextureSourceDecoratorShape = mTextureSourceDecoratorShape;
    }
    
    @Override
    public abstract BaseShapeTextureSourceDecorator clone();
    
    @Override
    protected void onDecorateBitmap(final Canvas canvas) {
        this.mTextureSourceDecoratorShape.onDecorateBitmap(canvas, this.mPaint);
    }
    
    public enum TextureSourceDecoratorShape
    {
        CIRCLE(0) {
            @Override
            public void onDecorateBitmap(final Canvas canvas, final Paint paint) {
                final float n = canvas.getWidth() / 2;
                final float n2 = canvas.getHeight() / 2;
                canvas.drawCircle(n - 0.5f, n2 - 0.5f, Math.min(n, n2), paint);
            }
        }, 
        ELLIPSE(1) {
            private final RectF mRectF;
            
            {
                this.mRectF = new RectF();
            }
            
            @Override
            public void onDecorateBitmap(final Canvas canvas, final Paint paint) {
                this.mRectF.set(0.0f, 0.0f, (float)(-1 + canvas.getWidth()), (float)(-1 + canvas.getWidth()));
                canvas.drawOval(this.mRectF, paint);
            }
        }, 
        RECTANGLE(2) {
            @Override
            public void onDecorateBitmap(final Canvas canvas, final Paint paint) {
                canvas.drawRect(0.0f, 0.0f, (float)(-1 + canvas.getWidth()), (float)(-1 + canvas.getHeight()), paint);
            }
        };
        
        public abstract void onDecorateBitmap(final Canvas p0, final Paint p1);
    }
}
