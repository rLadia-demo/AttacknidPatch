package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.region.buffer.*;

public class TextureRegion extends BaseTextureRegion
{
    public TextureRegion(final Texture texture, final int n, final int n2, final int n3, final int n4) {
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
