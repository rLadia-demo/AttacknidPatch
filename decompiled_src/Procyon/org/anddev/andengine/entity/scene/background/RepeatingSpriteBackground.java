package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.region.*;

public class RepeatingSpriteBackground extends SpriteBackground
{
    private Texture mTexture;
    
    public RepeatingSpriteBackground(final float n, final float n2, final float n3, final float n4, final float n5, final TextureManager textureManager, final ITextureSource textureSource) throws IllegalArgumentException {
        super(n, n2, n3, null);
        this.mEntity = this.loadSprite(n4, n5, textureManager, textureSource);
    }
    
    public RepeatingSpriteBackground(final float n, final float n2, final TextureManager textureManager, final ITextureSource textureSource) throws IllegalArgumentException {
        super(null);
        this.mEntity = this.loadSprite(n, n2, textureManager, textureSource);
    }
    
    private Sprite loadSprite(final float n, final float n2, final TextureManager textureManager, final ITextureSource textureSource) throws IllegalArgumentException {
        this.mTexture = new Texture(textureSource.getWidth(), textureSource.getHeight(), TextureOptions.REPEATING_PREMULTIPLYALPHA);
        final TextureRegion fromSource = TextureRegionFactory.createFromSource(this.mTexture, textureSource, 0, 0);
        final int round = Math.round(n);
        final int round2 = Math.round(n2);
        fromSource.setWidth(round);
        fromSource.setHeight(round2);
        textureManager.loadTexture(this.mTexture);
        return new Sprite(0.0f, 0.0f, round, round2, fromSource);
    }
    
    public Texture getTexture() {
        return this.mTexture;
    }
}
