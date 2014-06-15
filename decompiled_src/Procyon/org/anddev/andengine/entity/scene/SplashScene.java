package org.anddev.andengine.entity.scene;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.entity.shape.modifier.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.entity.*;

public class SplashScene extends Scene
{
    public SplashScene(final Camera camera, final TextureRegion textureRegion) {
        this(camera, textureRegion, -1.0f, 1.0f, 1.0f);
    }
    
    public SplashScene(final Camera camera, final TextureRegion textureRegion, final float n, final float scale, final float n2) {
        super(1);
        final Sprite sprite = new Sprite(camera.getMinX(), camera.getMinY(), camera.getWidth(), camera.getHeight(), textureRegion);
        if (scale != 1.0f || n2 != 1.0f) {
            sprite.setScale(scale);
            sprite.addShapeModifier(new ScaleModifier(n, scale, n2, IEaseFunction.DEFAULT));
        }
        this.getTopLayer().addEntity(sprite);
    }
}
