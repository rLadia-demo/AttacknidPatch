/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import java.util.Comparator;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.util.IEntityMatcher;

public interface ILayer
extends IEntity {
    public void addEntity(IEntity var1);

    public void clear();

    public IEntity findEntity(IEntityMatcher var1);

    public IEntity getEntity(int var1);

    public int getEntityCount();

    public ArrayList<Scene.ITouchArea> getTouchAreas();

    public void registerTouchArea(Scene.ITouchArea var1);

    public IEntity removeEntity(int var1);

    public boolean removeEntity(IEntity var1);

    public boolean removeEntity(IEntityMatcher var1);

    public IEntity replaceEntity(int var1, IEntity var2);

    public void setEntity(int var1, IEntity var2);

    public void sortEntities();

    public void sortEntities(Comparator<IEntity> var1);

    public void swapEntities(int var1, int var2);

    public void unregisterTouchArea(Scene.ITouchArea var1);
}

