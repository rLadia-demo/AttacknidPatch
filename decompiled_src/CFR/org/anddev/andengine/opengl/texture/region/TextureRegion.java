/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;
import org.anddev.andengine.opengl.texture.region.buffer.TextureRegionBuffer;

public class TextureRegion
extends BaseTextureRegion {
    public TextureRegion(Texture texture, int n, int n2, int n3, int n4) {
        super(texture, n, n2, n3, n4);
    }

    public TextureRegion clone() {
        return new TextureRegion(this.mTexture, this.mTexturePositionX, this.mTexturePositionY, this.mWidth, this.mHeight);
    }

    @Override
    public TextureRegionBuffer getTextureBuffer() {
        return (TextureRegionBuffer)this.mTextureRegionBuffer;
    }

    @Override
    protected BaseTextureRegionBuffer onCreateTextureRegionBuffer() {
        return new TextureRegionBuffer(this, 35044);
    }
}

