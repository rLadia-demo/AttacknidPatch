package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public class LinearGradientFillTextureSourceDecorator extends BaseShapeTextureSourceDecorator
{
    protected final int mFromColor;
    protected final LinearGradientDirection mLinearGradientDirection;
    protected final int mToColor;
    
    public LinearGradientFillTextureSourceDecorator(final ITextureSource textureSource, final int n, final int n2, final LinearGradientDirection linearGradientDirection) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, n2, linearGradientDirection);
    }
    
    public LinearGradientFillTextureSourceDecorator(final ITextureSource textureSource, final int n, final int n2, final LinearGradientDirection linearGradientDirection, final boolean b) {
        this(textureSource, TextureSourceDecoratorShape.RECTANGLE, n, n2, linearGradientDirection, b);
    }
    
    public LinearGradientFillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int n, final int n2, final LinearGradientDirection linearGradientDirection) {
        this(textureSource, textureSourceDecoratorShape, n, n2, linearGradientDirection, false);
    }
    
    public LinearGradientFillTextureSourceDecorator(final ITextureSource textureSource, final TextureSourceDecoratorShape textureSourceDecoratorShape, final int mFromColor, final int mToColor, final LinearGradientDirection mLinearGradientDirection, final boolean b) {
        super(textureSource, textureSourceDecoratorShape, b);
        this.mFromColor = mFromColor;
        this.mToColor = mToColor;
        this.mLinearGradientDirection = mLinearGradientDirection;
        this.mPaint.setStyle(Paint$Style.FILL);
        final int width = textureSource.getWidth();
        final int height = textureSource.getHeight();
        this.mPaint.setShader((Shader)new LinearGradient((float)(width * mLinearGradientDirection.getFromX()), (float)(height * mLinearGradientDirection.getFromY()), (float)(width * mLinearGradientDirection.getToX()), (float)(height * mLinearGradientDirection.getToY()), mFromColor, mToColor, Shader$TileMode.CLAMP));
    }
    
    @Override
    public LinearGradientFillTextureSourceDecorator clone() {
        return new LinearGradientFillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFromColor, this.mToColor, this.mLinearGradientDirection, this.mAntiAliasing);
    }
    
    public enum LinearGradientDirection
    {
        BOTTOMLEFT_TO_TOPRIGHT("BOTTOMLEFT_TO_TOPRIGHT", 7, 0, 1, 1, 0), 
        BOTTOMRIGHT_TO_TOPLEFT("BOTTOMRIGHT_TO_TOPLEFT", 5, 1, 1, 0, 0), 
        BOTTOM_TO_TOP("BOTTOM_TO_TOP", 2, 0, 0, 0, 1), 
        LEFT_TO_RIGHT("LEFT_TO_RIGHT", 0, 0, 0, 1, 0), 
        RIGHT_TO_LEFT("RIGHT_TO_LEFT", 1, 1, 0, 0, 0), 
        TOPLEFT_TO_BOTTOMRIGHT("TOPLEFT_TO_BOTTOMRIGHT", 4, 0, 0, 1, 1), 
        TOPRIGHT_TO_BOTTOMLEFT("TOPRIGHT_TO_BOTTOMLEFT", 6, 1, 0, 0, 1), 
        TOP_TO_BOTTOM("TOP_TO_BOTTOM", 3, 0, 1, 0, 0);
        
        private final int mFromX;
        private final int mFromY;
        private final int mToX;
        private final int mToY;
        
        private LinearGradientDirection(final String s, final int n, final int mFromX, final int mFromY, final int mToX, final int mToY) {
            this.mFromX = mFromX;
            this.mFromY = mFromY;
            this.mToX = mToX;
            this.mToY = mToY;
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
