package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.entity.*;

public class SpriteBackground extends EntityBackground
{
    public SpriteBackground(final float n, final float n2, final float n3, final BaseSprite baseSprite) {
        super(n, n2, n3, baseSprite);
    }
    
    public SpriteBackground(final BaseSprite baseSprite) {
        super(baseSprite);
    }
}
