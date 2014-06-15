package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;

public class Sprite extends BaseSprite
{
    public Sprite(final float n, final float n2, final float n3, final float n4, final TextureRegion textureRegion) {
        super(n, n2, n3, n4, textureRegion);
    }
    
    public Sprite(final float n, final float n2, final float n3, final float n4, final TextureRegion textureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, textureRegion, rectangleVertexBuffer);
    }
    
    public Sprite(final float n, final float n2, final TextureRegion textureRegion) {
        super(n, n2, textureRegion.getWidth(), textureRegion.getHeight(), textureRegion);
    }
    
    public Sprite(final float n, final float n2, final TextureRegion textureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, textureRegion.getWidth(), textureRegion.getHeight(), textureRegion, rectangleVertexBuffer);
    }
    
    @Override
    public TextureRegion getTextureRegion() {
        return (TextureRegion)this.mTextureRegion;
    }
}
