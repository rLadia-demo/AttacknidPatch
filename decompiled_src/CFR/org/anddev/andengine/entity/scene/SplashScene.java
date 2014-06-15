/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.shape.modifier.ScaleModifier;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class SplashScene
extends Scene {
    public SplashScene(Camera camera, TextureRegion textureRegion) {
        this(camera, textureRegion, -1.0f, 1.0f, 1.0f);
    }

    public SplashScene(Camera camera, TextureRegion textureRegion, float f, float f2, float f3) {
        super(1);
        Sprite sprite = new Sprite(camera.getMinX(), camera.getMinY(), camera.getWidth(), camera.getHeight(), textureRegion);
        if (f2 != 1.0f || f3 != 1.0f) {
            sprite.setScale(f2);
            sprite.addShapeModifier((IModifier)new ScaleModifier(f, f2, f3, IEaseFunction.DEFAULT));
        }
        this.getTopLayer().addEntity(sprite);
    }
}

