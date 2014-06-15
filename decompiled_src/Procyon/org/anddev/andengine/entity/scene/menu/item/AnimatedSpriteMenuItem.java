package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.opengl.texture.region.*;

public class AnimatedSpriteMenuItem extends AnimatedSprite implements IMenuItem
{
    private final int mID;
    
    public AnimatedSpriteMenuItem(final int mid, final TiledTextureRegion tiledTextureRegion) {
        super(0.0f, 0.0f, tiledTextureRegion);
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
