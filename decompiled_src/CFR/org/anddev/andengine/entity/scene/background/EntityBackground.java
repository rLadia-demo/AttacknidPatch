/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene.background;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.background.ColorBackground;

public class EntityBackground
extends ColorBackground {
    protected IEntity mEntity;

    public EntityBackground(float f, float f2, float f3, IEntity iEntity) {
        super(f, f2, f3);
        this.mEntity = iEntity;
    }

    public EntityBackground(IEntity iEntity) {
        this.mEntity = iEntity;
    }

    @Override
    public void onDraw(GL10 gL10, Camera camera) {
        super.onDraw(gL10, camera);
        this.mEntity.onDraw(gL10, camera);
    }
}

