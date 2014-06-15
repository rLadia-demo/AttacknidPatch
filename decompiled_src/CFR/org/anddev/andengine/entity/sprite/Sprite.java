/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.entity.sprite.BaseSprite;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class Sprite
extends BaseSprite {
    public Sprite(float f, float f2, float f3, float f4, TextureRegion textureRegion) {
        super(f, f2, f3, f4, textureRegion);
    }

    public Sprite(float f, float f2, float f3, float f4, TextureRegion textureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, textureRegion, rectangleVertexBuffer);
    }

    public Sprite(float f, float f2, TextureRegion textureRegion) {
        super(f, f2, textureRegion.getWidth(), textureRegion.getHeight(), textureRegion);
    }

    public Sprite(float f, float f2, TextureRegion textureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, textureRegion.getWidth(), textureRegion.getHeight(), textureRegion, rectangleVertexBuffer);
    }

    @Override
    public TextureRegion getTextureRegion() {
        return (TextureRegion)this.mTextureRegion;
    }
}

