/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Paint
 *  android.graphics.Paint$Style
 *  android.graphics.RadialGradient
 *  android.graphics.Shader
 *  android.graphics.Shader$TileMode
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.BaseShapeTextureSourceDecorator;

public class RadialGradientFillTextureSourceDecorator
extends BaseShapeTextureSourceDecorator {
    private static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
    protected final int mFromColor;
    protected final RadialGradientDirection mRadialGradientDirection;
    protected final int mToColor;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection() {
        int[] arrn;
        int[] arrn2 = RadialGradientFillTextureSourceDecorator.$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
        if (arrn2 != null) {
            return arrn2;
        }
        arrn = new int[RadialGradientDirection.values().length];
        try {
            arrn[RadialGradientDirection.INSIDE_OUT.ordinal()] = 1;
        }
        catch (NoSuchFieldError var2_3) {}
        try {
            arrn[RadialGradientDirection.OUTSIDE_IN.ordinal()] = 2;
        }
        catch (NoSuchFieldError var3_2) {}
        RadialGradientFillTextureSourceDecorator.$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection = arrn;
        return arrn;
    }

    public RadialGradientFillTextureSourceDecorator(ITextureSource iTextureSource, int n, int n2, RadialGradientDirection radialGradientDirection) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, n2, radialGradientDirection);
    }

    public RadialGradientFillTextureSourceDecorator(ITextureSource iTextureSource, int n, int n2, RadialGradientDirection radialGradientDirection, boolean bl) {
        this(iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, n, n2, radialGradientDirection, bl);
    }

    public RadialGradientFillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, int n2, RadialGradientDirection radialGradientDirection) {
        this(iTextureSource, textureSourceDecoratorShape, n, n2, radialGradientDirection, false);
    }

    public RadialGradientFillTextureSourceDecorator(ITextureSource iTextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape textureSourceDecoratorShape, int n, int n2, RadialGradientDirection radialGradientDirection, boolean bl) {
        super(iTextureSource, textureSourceDecoratorShape, bl);
        this.mFromColor = n;
        this.mToColor = n2;
        this.mRadialGradientDirection = radialGradientDirection;
        this.mPaint.setStyle(Paint.Style.FILL);
        int n3 = iTextureSource.getWidth();
        int n4 = iTextureSource.getHeight();
        float f = 0.5f * (float)n3;
        float f2 = 0.5f * (float)n4;
        float f3 = Math.max(f, f2);
        switch (RadialGradientFillTextureSourceDecorator.$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection()[radialGradientDirection.ordinal()]) {
            default: {
                return;
            }
            case 1: {
                this.mPaint.setShader((Shader)new RadialGradient(f, f2, f3, n, n2, Shader.TileMode.CLAMP));
                return;
            }
            case 2: 
        }
        this.mPaint.setShader((Shader)new RadialGradient(f, f2, f3, n2, n, Shader.TileMode.CLAMP));
    }

    @Override
    public RadialGradientFillTextureSourceDecorator clone() {
        return new RadialGradientFillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFromColor, this.mToColor, this.mRadialGradientDirection, this.mAntiAliasing);
    }

    public static final class RadialGradientDirection
    extends Enum<RadialGradientDirection> {
        private static final /* synthetic */ RadialGradientDirection[] ENUM$VALUES;
        public static final /* enum */ RadialGradientDirection INSIDE_OUT = new RadialGradientDirection("INSIDE_OUT", 0);
        public static final /* enum */ RadialGradientDirection OUTSIDE_IN = new RadialGradientDirection("OUTSIDE_IN", 1);

        static {
            RadialGradientDirection[] arrradialGradientDirection = new RadialGradientDirection[]{RadialGradientDirection.INSIDE_OUT, RadialGradientDirection.OUTSIDE_IN};
            RadialGradientDirection.ENUM$VALUES = arrradialGradientDirection;
        }

        private RadialGradientDirection(String string22, int string22) {
            super(string, n);
        }

        public static RadialGradientDirection valueOf(String string) {
            return (RadialGradientDirection)Enum.valueOf(RadialGradientDirection.class, string);
        }

        public static RadialGradientDirection[] values() {
            RadialGradientDirection[] arrradialGradientDirection = RadialGradientDirection.ENUM$VALUES;
            int n = arrradialGradientDirection.length;
            RadialGradientDirection[] arrradialGradientDirection2 = new RadialGradientDirection[n];
            System.arraycopy(arrradialGradientDirection, 0, arrradialGradientDirection2, 0, n);
            return arrradialGradientDirection2;
        }
    }

}

