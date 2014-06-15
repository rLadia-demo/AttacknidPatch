package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.util.*;

public class TextureRegionLibrary extends Library<BaseTextureRegion>
{
    public TextureRegionLibrary() {
        super();
    }
    
    public TextureRegionLibrary(final int n) {
        super(n);
    }
    
    @Override
    public TextureRegion get(final int n) {
        return super.get(n);
    }
    
    public TiledTextureRegion getTiled(final int n) {
        return (TiledTextureRegion)this.mItems.get(n);
    }
}
