package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.opengl.texture.region.*;

public class SpriteMenuItem extends Sprite implements IMenuItem
{
    private final int mID;
    
    public SpriteMenuItem(final int mid, final TextureRegion textureRegion) {
        super(0.0f, 0.0f, textureRegion);
        this.mID = mid;
    }
    
    @Override
    public int getID() {
        return this.mID;
    }
    
    @Override
    public void onSelected() {
    }
    
    @Override
    public void onUnselected() {
    }
}
