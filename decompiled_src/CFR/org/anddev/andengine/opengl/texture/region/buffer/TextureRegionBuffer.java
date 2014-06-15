/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;

public class TextureRegionBuffer
extends BaseTextureRegionBuffer {
    public TextureRegionBuffer(TextureRegion textureRegion, int n) {
        super(textureRegion, n);
    }

    @Override
    public TextureRegion getTextureRegion() {
        return (TextureRegion)super.getTextureRegion();
    }

    @Override
    protected float getX1() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (float)baseTextureRegion.getTexturePositionX() / (float)baseTextureRegion.getTexture().getWidth();
    }

    @Override
    protected float getX2() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (float)(baseTextureRegion.getTexturePositionX() + baseTextureRegion.getWidth()) / (float)baseTextureRegion.getTexture().getWidth();
    }

    @Override
    protected float getY1() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (float)baseTextureRegion.getTexturePositionY() / (float)baseTextureRegion.getTexture().getHeight();
    }

    @Override
    protected float getY2() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (float)(baseTextureRegion.getTexturePositionY() + baseTextureRegion.getHeight()) / (float)baseTextureRegion.getTexture().getHeight();
    }
}

