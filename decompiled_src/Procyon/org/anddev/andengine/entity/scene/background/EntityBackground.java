package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class EntityBackground extends ColorBackground
{
    protected IEntity mEntity;
    
    public EntityBackground(final float n, final float n2, final float n3, final IEntity mEntity) {
        super(n, n2, n3);
        this.mEntity = mEntity;
    }
    
    public EntityBackground(final IEntity mEntity) {
        super();
        this.mEntity = mEntity;
    }
    
    @Override
    public void onDraw(final GL10 gl10, final Camera camera) {
        super.onDraw(gl10, camera);
        this.mEntity.onDraw(gl10, camera);
    }
}
