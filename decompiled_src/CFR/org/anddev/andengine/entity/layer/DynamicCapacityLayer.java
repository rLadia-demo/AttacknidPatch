/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.BaseLayer;
import org.anddev.andengine.entity.layer.ZIndexSorter;
import org.anddev.andengine.util.IEntityMatcher;

public class DynamicCapacityLayer
extends BaseLayer {
    private static final int CAPACITY_DEFAULT = 10;
    private final ArrayList<IEntity> mEntities;

    public DynamicCapacityLayer() {
        this(10);
    }

    public DynamicCapacityLayer(int n) {
        this.mEntities = new ArrayList<IEntity>(n);
    }

    @Override
    public void addEntity(IEntity iEntity) {
        this.mEntities.add(iEntity);
    }

    @Override
    public void clear() {
        this.mEntities.clear();
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public IEntity findEntity(IEntityMatcher iEntityMatcher) {
        ArrayList<IEntity> arrayList = this.mEntities;
        int n = -1 + arrayList.size();
        for (; n >= 0; --n) {
            IEntity iEntity = arrayList.get(n);
            if (iEntityMatcher.matches(iEntity)) return iEntity;
        }
        return null;
    }

    @Override
    public IEntity getEntity(int n) {
        return this.mEntities.get(n);
    }

    @Override
    public int getEntityCount() {
        return this.mEntities.size();
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        ArrayList<IEntity> arrayList = this.mEntities;
        int n = arrayList.size();
        int n2 = 0;
        while (n2 < n) {
            arrayList.get(n2).onDraw(gL10, camera);
            ++n2;
        }
        return;
    }

    @Override
    protected void onManagedUpdate(float f) {
        ArrayList<IEntity> arrayList = this.mEntities;
        int n = arrayList.size();
        int n2 = 0;
        while (n2 < n) {
            arrayList.get(n2).onUpdate(f);
            ++n2;
        }
        return;
    }

    @Override
    public IEntity removeEntity(int n) {
        return this.mEntities.remove(n);
    }

    @Override
    public boolean removeEntity(IEntity iEntity) {
        return this.mEntities.remove(iEntity);
    }

    @Override
    public boolean removeEntity(IEntityMatcher iEntityMatcher) {
        ArrayList<IEntity> arrayList = this.mEntities;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            if (iEntityMatcher.matches(arrayList.get(n))) {
                arrayList.remove(n);
                return true;
            }
            --n;
        }
        return false;
    }

    @Override
    public IEntity replaceEntity(int n, IEntity iEntity) {
        return this.mEntities.set(n, iEntity);
    }

    @Override
    public void reset() {
        super.reset();
        ArrayList<IEntity> arrayList = this.mEntities;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            arrayList.get(n).reset();
            --n;
        }
        return;
    }

    @Override
    public void setEntity(int n, IEntity iEntity) {
        if (n == this.mEntities.size()) {
            this.addEntity(iEntity);
            return;
        }
        this.mEntities.set(n, iEntity);
    }

    @Override
    public void sortEntities() {
        ZIndexSorter.getInstance().sort((List<IEntity>)this.mEntities);
    }

    @Override
    public void sortEntities(Comparator<IEntity> comparator) {
        ZIndexSorter.getInstance().sort(this.mEntities, comparator);
    }

    @Override
    public void swapEntities(int n, int n2) {
        ArrayList<IEntity> arrayList = this.mEntities;
        arrayList.set(n, arrayList.set(n2, arrayList.get(n)));
    }
}

