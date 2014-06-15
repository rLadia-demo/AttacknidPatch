/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.background.SpriteBackground;
import org.anddev.andengine.entity.sprite.BaseSprite;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class RepeatingSpriteBackground
extends SpriteBackground {
    private Texture mTexture;

    public RepeatingSpriteBackground(float f, float f2, float f3, float f4, float f5, TextureManager textureManager, ITextureSource iTextureSource) throws IllegalArgumentException {
        super(f, f2, f3, null);
        this.mEntity = this.loadSprite(f4, f5, textureManager, iTextureSource);
    }

    public RepeatingSpriteBackground(float f, float f2, TextureManager textureManager, ITextureSource iTextureSource) throws IllegalArgumentException {
        super(null);
        this.mEntity = this.loadSprite(f, f2, textureManager, iTextureSource);
    }

    private Sprite loadSprite(float f, float f2, TextureManager textureManager, ITextureSource iTextureSource) throws IllegalArgumentException {
        this.mTexture = new Texture(iTextureSource.getWidth(), iTextureSource.getHeight(), TextureOptions.REPEATING_PREMULTIPLYALPHA);
        TextureRegion textureRegion = TextureRegionFactory.createFromSource(this.mTexture, iTextureSource, 0, 0);
        int n = Math.round(f);
        int n2 = Math.round(f2);
        textureRegion.setWidth(n);
        textureRegion.setHeight(n2);
        textureManager.loadTexture(this.mTexture);
        return new Sprite(0.0f, 0.0f, n, n2, textureRegion);
    }

    public Texture getTexture() {
        return this.mTexture;
    }
}

