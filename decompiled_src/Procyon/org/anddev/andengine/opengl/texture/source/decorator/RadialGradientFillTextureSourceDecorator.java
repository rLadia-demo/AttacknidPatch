package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public class RadialGradientFillTextureSourceDecorator extends BaseShapeTextureSourceDecorator
{
    protected final int mFromColor;
    protected final RadialGradientDirection mRadialGradientDirection;
    protected final int mToColor;
    
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection() {
        final int[] $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection = RadialGradientFillTextureSourceDecorator.$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
        if ($switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection != null) {
            return $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
        }
        final int[] $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection2 = new int[RadialGradientDirection.values().length];
        while (true) {
            try {
                $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection2[RadialGradientDirection.INSIDE_OUT.ordinal()] = 1;
                try {
                    $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection2[RadialGradientDirection.OUTSIDE_IN.ordinal()] = 2;
                    return RadialGradientFillTextureSourceDecorator.$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection = $switch_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection2;
                }
                catch (NoSuchFieldError noSuchFieldError) {}
            }
            catch (NoSuchFieldError noSuchFieldError2) {
                continue;
            }
            break;
        }
    }
    
    public RadialGradientFillTextureSourceDecorator(final ITextureSource textureSource, final int n, final int n2, final RadialGradientDirection radialGradientDirection) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, n2, radialGradientDirection);
    }
    
    public RadialGradientFillTextureSourceDecorator(final ITextureSource textureSource, final int n, final int n2, final RadialGradientDirection radialGradientDirection, final boolean b) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, n2, radialGradientDirection, b);
    }
    
    public RadialGradientFillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n, final int n2, final RadialGradientDirection radialGradientDirection) {
        this(textureSource, textureSourceDecoratorShape, n, n2, radialGradientDirection, false);
    }
    
    public RadialGradientFillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int mFromColor, final int mToColor, final RadialGradientDirection mRadialGradientDirection, final boolean b) {
        super(textureSource, textureSourceDecoratorShape, b);
        this.mFromColor = mFromColor;
        this.mToColor = mToColor;
        this.mRadialGradientDirection = mRadialGradientDirection;
        this.mPaint.setStyle(Paint$Style.FILL);
        final int width = textureSource.getWidth();
        final int height = textureSource.getHeight();
        final float n = 0.5f * width;
        final float n2 = 0.5f * height;
        final float max = Math.max(n, n2);
        switch ($SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection()[mRadialGradientDirection.ordinal()]) {
            default: {}
            case 1: {
                this.mPaint.setShader((Shader)new RadialGradient(n, n2, max, mFromColor, mToColor, Shader$TileMode.CLAMP));
            }
            case 2: {
                this.mPaint.setShader((Shader)new RadialGradient(n, n2, max, mToColor, mFromColor, Shader$TileMode.CLAMP));
            }
        }
    }
    
    @Override
    public RadialGradientFillTextureSourceDecorator clone() {
        return new RadialGradientFillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFromColor, this.mToColor, this.mRadialGradientDirection, this.mAntiAliasing);
    }
    
    public enum RadialGradientDirection
    {
        INSIDE_OUT("INSIDE_OUT", 0), 
        OUTSIDE_IN("OUTSIDE_IN", 1);
    }
}
