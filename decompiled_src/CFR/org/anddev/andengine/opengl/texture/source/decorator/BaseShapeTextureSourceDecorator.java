/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Canvas
 *  android.graphics.Paint
 *  android.graphics.RectF
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.BaseTextureSourceDecorator;

public abstract class BaseShapeTextureSourceDecorator
extends BaseTextureSourceDecorator {
    protected final TextureSourceDecoratorShape mTextureSourceDecoratorShape;

    public BaseShapeTextureSourceDecorator(ITextureSource iTextureSource, TextureSourceDecoratorShape textureSourceDecoratorShape) {
        super(iTextureSource);
        this.mTextureSourceDecoratorShape = textureSourceDecoratorShape;
    }

    public BaseShapeTextureSourceDecorator(ITextureSource iTextureSource, TextureSourceDecoratorShape textureSourceDecoratorShape, boolean bl) {
        super(iTextureSource, bl);
        this.mTextureSourceDecoratorShape = textureSourceDecoratorShape;
    }

    @Override
    public abstract BaseShapeTextureSourceDecorator clone();

    @Override
    protected void onDecorateBitmap(Canvas canvas) {
        this.mTextureSourceDecoratorShape.onDecorateBitmap(canvas, this.mPaint);
    }

    public static abstract class TextureSourceDecoratorShape
    extends Enum<TextureSourceDecoratorShape> {
        public static final /* enum */ TextureSourceDecoratorShape CIRCLE = new TextureSourceDecoratorShape("CIRCLE", 0){

            @Override
            public void onDecorateBitmap(Canvas canvas, Paint paint) {
                float f = canvas.getWidth() / 2;
                float f2 = canvas.getHeight() / 2;
                float f3 = Math.min(f, f2);
                canvas.drawCircle(f - 0.5f, f2 - 0.5f, f3, paint);
            }
        };
        public static final /* enum */ TextureSourceDecoratorShape ELLIPSE = new TextureSourceDecoratorShape("ELLIPSE", 1){
            private final RectF mRectF = new RectF();

            @Override
            public void onDecorateBitmap(Canvas canvas, Paint paint) {
                this.mRectF.set(0.0f, 0.0f, (float)(-1 + canvas.getWidth()), (float)(-1 + canvas.getWidth()));
                canvas.drawOval(this.mRectF, paint);
            }
        };
        private static final /* synthetic */ TextureSourceDecoratorShape[] ENUM$VALUES;
        public static final /* enum */ TextureSourceDecoratorShape RECTANGLE = new TextureSourceDecoratorShape("RECTANGLE", 2){

            @Override
            public void onDecorateBitmap(Canvas canvas, Paint paint) {
                canvas.drawRect(0.0f, 0.0f, (float)(-1 + canvas.getWidth()), (float)(-1 + canvas.getHeight()), paint);
            }
        };

        static {
            TextureSourceDecoratorShape[] arrtextureSourceDecoratorShape = new TextureSourceDecoratorShape[]{TextureSourceDecoratorShape.CIRCLE, TextureSourceDecoratorShape.ELLIPSE, TextureSourceDecoratorShape.RECTANGLE};
            TextureSourceDecoratorShape.ENUM$VALUES = arrtextureSourceDecoratorShape;
        }

        private TextureSourceDecoratorShape(String string22, int string22) {
            super(string, n);
        }

        /* synthetic */ TextureSourceDecoratorShape(String string222, int string222, TextureSourceDecoratorShape string222) {
            this(string, n);
        }

        public static TextureSourceDecoratorShape valueOf(String string) {
            return (TextureSourceDecoratorShape)Enum.valueOf(TextureSourceDecoratorShape.class, string);
        }

        public static TextureSourceDecoratorShape[] values() {
            TextureSourceDecoratorShape[] arrtextureSourceDecoratorShape = TextureSourceDecoratorShape.ENUM$VALUES;
            int n = arrtextureSourceDecoratorShape.length;
            TextureSourceDecoratorShape[] arrtextureSourceDecoratorShape2 = new TextureSourceDecoratorShape[n];
            System.arraycopy(arrtextureSourceDecoratorShape, 0, arrtextureSourceDecoratorShape2, 0, n);
            return arrtextureSourceDecoratorShape2;
        }

        public abstract void onDecorateBitmap(Canvas var1, Paint var2);

    }

}

