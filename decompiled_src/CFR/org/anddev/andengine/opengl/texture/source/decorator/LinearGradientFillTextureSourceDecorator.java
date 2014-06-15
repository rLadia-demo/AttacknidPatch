/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.LinearGradient
 *  android.graphics.Paint
 *  android.graphics.Paint$Style
 *  android.graphics.Shader
 *  android.graphics.Shader$TileMode
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.BaseShapeTextureSourceDecorator;

public class LinearGradientFillTextureSourceDecorator
extends BaseShapeTextureSourceDecorator {
    protected final int mFromColor;
    protected final LinearGradientDirection mLinearGradientDirection;
    protected final int mToColor;

    public LinearGradientFillTextureSourceDecorator(ITextureSource iTextureSource, int n, int n2, LinearGradientDirection linearGradientDirection) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, n2, linearGradientDirection);
    }

    public LinearGradientFillTextureSourceDecorator(ITextureSource iTextureSource, int n, int n2, LinearGradientDirection linearGradientDirection, boolean bl) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, n2, linearGradientDirection, bl);
    }

    public LinearGradientFillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, int n2, LinearGradientDirection linearGradientDirection) {
        this(iTextureSource, textureSourceDecoratorShape, n, n2, linearGradientDirection, false);
    }

    public LinearGradientFillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, int n2, LinearGradientDirection linearGradientDirection, boolean bl) {
        super(iTextureSource, textureSourceDecoratorShape, bl);
        this.mFromColor = n;
        this.mToColor = n2;
        this.mLinearGradientDirection = linearGradientDirection;
        this.mPaint.setStyle(Paint.Style.FILL);
        int n3 = iTextureSource.getWidth();
        int n4 = iTextureSource.getHeight();
        float f = n3 * linearGradientDirection.getFromX();
        float f2 = n4 * linearGradientDirection.getFromY();
        float f3 = n3 * linearGradientDirection.getToX();
        float f4 = n4 * linearGradientDirection.getToY();
        this.mPaint.setShader((Shader)new LinearGradient(f, f2, f3, f4, n, n2, Shader.TileMode.CLAMP));
    }

    @Override
    public LinearGradientFillTextureSourceDecorator clone() {
        return new LinearGradientFillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFromColor, this.mToColor, this.mLinearGradientDirection, this.mAntiAliasing);
    }

    public static final class LinearGradientDirection
    extends Enum<LinearGradientDirection> {
        public static final /* enum */ LinearGradientDirection BOTTOMLEFT_TO_TOPRIGHT;
        public static final /* enum */ LinearGradientDirection BOTTOMRIGHT_TO_TOPLEFT;
        public static final /* enum */ LinearGradientDirection BOTTOM_TO_TOP;
        private static final /* synthetic */ LinearGradientDirection[] ENUM$VALUES;
        public static final /* enum */ LinearGradientDirection LEFT_TO_RIGHT;
        public static final /* enum */ LinearGradientDirection RIGHT_TO_LEFT;
        public static final /* enum */ LinearGradientDirection TOPLEFT_TO_BOTTOMRIGHT;
        public static final /* enum */ LinearGradientDirection TOPRIGHT_TO_BOTTOMLEFT;
        public static final /* enum */ LinearGradientDirection TOP_TO_BOTTOM;
        private final int mFromX;
        private final int mFromY;
        private final int mToX;
        private final int mToY;

        static {
            LinearGradientDirection.LEFT_TO_RIGHT = new LinearGradientDirection("LEFT_TO_RIGHT", 0, 0, 0, 1, 0);
            LinearGradientDirection.RIGHT_TO_LEFT = new LinearGradientDirection("RIGHT_TO_LEFT", 1, 1, 0, 0, 0);
            LinearGradientDirection.BOTTOM_TO_TOP = new LinearGradientDirection("BOTTOM_TO_TOP", 2, 0, 0, 0, 1);
            LinearGradientDirection.TOP_TO_BOTTOM = new LinearGradientDirection("TOP_TO_BOTTOM", 3, 0, 1, 0, 0);
            LinearGradientDirection.TOPLEFT_TO_BOTTOMRIGHT = new LinearGradientDirection("TOPLEFT_TO_BOTTOMRIGHT", 4, 0, 0, 1, 1);
            LinearGradientDirection.BOTTOMRIGHT_TO_TOPLEFT = new LinearGradientDirection("BOTTOMRIGHT_TO_TOPLEFT", 5, 1, 1, 0, 0);
            LinearGradientDirection.TOPRIGHT_TO_BOTTOMLEFT = new LinearGradientDirection("TOPRIGHT_TO_BOTTOMLEFT", 6, 1, 0, 0, 1);
            LinearGradientDirection.BOTTOMLEFT_TO_TOPRIGHT = new LinearGradientDirection("BOTTOMLEFT_TO_TOPRIGHT", 7, 0, 1, 1, 0);
            LinearGradientDirection[] arrlinearGradientDirection = new LinearGradientDirection[]{LinearGradientDirection.LEFT_TO_RIGHT, LinearGradientDirection.RIGHT_TO_LEFT, LinearGradientDirection.BOTTOM_TO_TOP, LinearGradientDirection.TOP_TO_BOTTOM, LinearGradientDirection.TOPLEFT_TO_BOTTOMRIGHT, LinearGradientDirection.BOTTOMRIGHT_TO_TOPLEFT, LinearGradientDirection.TOPRIGHT_TO_BOTTOMLEFT, LinearGradientDirection.BOTTOMLEFT_TO_TOPRIGHT};
            LinearGradientDirection.ENUM$VALUES = arrlinearGradientDirection;
        }

        private LinearGradientDirection(String string2, int n2, int n3, int n4, int n52, int n52) {
            super(string, n);
            this.mFromX = string2;
            this.mFromY = n2;
            this.mToX = n3;
            this.mToY = n4;
        }

        public static LinearGradientDirection valueOf(String string) {
            return (LinearGradientDirection)Enum.valueOf(LinearGradientDirection.class, string);
        }

        public static LinearGradientDirection[] values() {
            LinearGradientDirection[] arrlinearGradientDirection = LinearGradientDirection.ENUM$VALUES;
            int n = arrlinearGradientDirection.length;
            LinearGradientDirection[] arrlinearGradientDirection2 = new LinearGradientDirection[n];
            System.arraycopy(arrlinearGradientDirection, 0, arrlinearGradientDirection2, 0, n);
            return arrlinearGradientDirection2;
        }

        final int getFromX() {
            return this.mFromX;
        }

        final int getFromY() {
            return this.mFromY;
        }

        final int getToX() {
            return this.mToX;
        }

        final int getToY() {
            return this.mToY;
        }
    }

}

