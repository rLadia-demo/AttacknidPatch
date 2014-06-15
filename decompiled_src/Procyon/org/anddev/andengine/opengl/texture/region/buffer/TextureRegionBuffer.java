package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.region.*;

public class TextureRegionBuffer extends BaseTextureRegionBuffer
{
    public TextureRegionBuffer(final TextureRegion textureRegion, final int n) {
        super(textureRegion, n);
    }
    
    @Override
    public TextureRegion getTextureRegion() {
        return (TextureRegion)super.getTextureRegion();
    }
    
    @Override
    protected float getX1() {
        final TextureRegion textureRegion = this.getTextureRegion();
        return textureRegion.getTexturePositionX() / textureRegion.getTexture().getWidth();
    }
    
    @Override
    protected float getX2() {
        final TextureRegion textureRegion = this.getTextureRegion();
        return (textureRegion.getTexturePositionX() + textureRegion.getWidth()) / textureRegion.getTexture().getWidth();
    }
    
    @Override
    protected float getY1() {
        final TextureRegion textureRegion = this.getTextureRegion();
        return textureRegion.getTexturePositionY() / textureRegion.getTexture().getHeight();
    }
    
    @Override
    protected float getY2() {
        final TextureRegion textureRegion = this.getTextureRegion();
        return (textureRegion.getTexturePositionY() + textureRegion.getHeight()) / textureRegion.getTexture().getHeight();
    }
}
