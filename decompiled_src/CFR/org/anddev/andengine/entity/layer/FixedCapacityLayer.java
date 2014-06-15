/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.layer;

import java.util.Comparator;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.BaseLayer;
import org.anddev.andengine.entity.layer.ZIndexSorter;
import org.anddev.andengine.util.IEntityMatcher;

public class FixedCapacityLayer
extends BaseLayer {
    private final int mCapacity;
    private final IEntity[] mEntities;
    private int mEntityCount;

    public FixedCapacityLayer(int n) {
        this.mCapacity = n;
        this.mEntities = new IEntity[n];
        this.mEntityCount = 0;
    }

    private void checkIndex(int n) {
        if (n >= 0 && n < this.mEntityCount) return;
        throw new IndexOutOfBoundsException("Invalid index: " + n + " (Size: " + this.mEntityCount + " | Capacity: " + this.mCapacity + ")");
    }

    /*
     * Enabled aggressive block sorting
     */
    private int indexOfEntity(IEntity iEntity) {
        IEntity[] arriEntity = this.mEntities;
        int n = -1 + arriEntity.length;
        for (; n >= 0; --n) {
            if (arriEntity[n] == iEntity) return n;
        }
        return -1;
    }

    @Override
    public void addEntity(IEntity iEntity) {
        if (this.mEntityCount >= this.mCapacity) return;
        this.mEntities[this.mEntityCount] = iEntity;
        this.mEntityCount = 1 + this.mEntityCount;
    }

    @Override
    public void clear() {
        IEntity[] arriEntity = this.mEntities;
        int n = -1 + this.mEntityCount;
        do {
            if (n < 0) {
                this.mEntityCount = 0;
                return;
            }
            arriEntity[n] = null;
            --n;
        } while (true);
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public IEntity findEntity(IEntityMatcher iEntityMatcher) {
        IEntity[] arriEntity = this.mEntities;
        int n = -1 + arriEntity.length;
        for (; n >= 0; --n) {
            IEntity iEntity = arriEntity[n];
            if (iEntityMatcher.matches(iEntity)) return iEntity;
        }
        return null;
    }

    @Override
    public IEntity getEntity(int n) {
        this.checkIndex(n);
        return this.mEntities[n];
    }

    @Override
    public int getEntityCount() {
        return this.mEntityCount;
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        IEntity[] arriEntity = this.mEntities;
        int n = this.mEntityCount;
        int n2 = 0;
        while (n2 < n) {
            arriEntity[n2].onDraw(gL10, camera);
            ++n2;
        }
        return;
    }

    @Override
    protected void onManagedUpdate(float f) {
        IEntity[] arriEntity = this.mEntities;
        int n = this.mEntityCount;
        int n2 = 0;
        while (n2 < n) {
            arriEntity[n2].onUpdate(f);
            ++n2;
        }
        return;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public IEntity removeEntity(int n) {
        this.checkIndex(n);
        IEntity[] arriEntity = this.mEntities;
        IEntity iEntity = arriEntity[n];
        int n2 = -1 + this.mEntityCount;
        if (n == n2) {
            this.mEntities[n2] = null;
        } else {
            arriEntity[n] = arriEntity[n2];
            arriEntity[this.mEntityCount] = null;
        }
        this.mEntityCount = n2;
        return iEntity;
    }

    @Override
    public boolean removeEntity(IEntity iEntity) {
        if (this.removeEntity(this.indexOfEntity(iEntity)) == null) return false;
        return true;
    }

    @Override
    public boolean removeEntity(IEntityMatcher iEntityMatcher) {
        IEntity[] arriEntity = this.mEntities;
        int n = -1 + arriEntity.length;
        while (n >= 0) {
            if (iEntityMatcher.matches(arriEntity[n])) {
                this.removeEntity(n);
                return true;
            }
            --n;
        }
        return false;
    }

    @Override
    public IEntity replaceEntity(int n, IEntity iEntity) {
        this.checkIndex(n);
        IEntity[] arriEntity = this.mEntities;
        IEntity iEntity2 = arriEntity[n];
        arriEntity[n] = iEntity;
        return iEntity2;
    }

    @Override
    public void reset() {
        super.reset();
        IEntity[] arriEntity = this.mEntities;
        int n = -1 + this.mEntityCount;
        while (n >= 0) {
            arriEntity[n].reset();
            --n;
        }
        return;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void setEntity(int n, IEntity iEntity) {
        this.checkIndex(n);
        if (n == this.mEntityCount) {
            this.addEntity(iEntity);
            return;
        }
        if (n >= this.mEntityCount) return;
        this.mEntities[n] = iEntity;
    }

    @Override
    public void sortEntities() {
        ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount);
    }

    @Override
    public void sortEntities(Comparator<IEntity> comparator) {
        ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount, comparator);
    }

    @Override
    public void swapEntities(int n, int n2) {
        if (n > this.mEntityCount) {
            throw new IndexOutOfBoundsException("pEntityIndexA was bigger than the EntityCount.");
        }
        if (n > this.mEntityCount) {
            throw new IndexOutOfBoundsException("pEntityIndexB was bigger than the EntityCount.");
        }
        IEntity[] arriEntity = this.mEntities;
        IEntity iEntity = arriEntity[n];
        arriEntity[n] = arriEntity[n2];
        arriEntity[n2] = iEntity;
    }
}

