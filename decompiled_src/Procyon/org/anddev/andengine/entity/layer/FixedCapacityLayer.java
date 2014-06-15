package org.anddev.andengine.entity.layer;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import java.util.*;

public class FixedCapacityLayer extends BaseLayer
{
    private final int mCapacity;
    private final IEntity[] mEntities;
    private int mEntityCount;
    
    public FixedCapacityLayer(final int mCapacity) {
        super();
        this.mCapacity = mCapacity;
        this.mEntities = new IEntity[mCapacity];
        this.mEntityCount = 0;
    }
    
    private void checkIndex(final int n) {
        if (n < 0 || n >= this.mEntityCount) {
            throw new IndexOutOfBoundsException("Invalid index: " + n + " (Size: " + this.mEntityCount + " | Capacity: " + this.mCapacity + ")");
        }
    }
    
    private int indexOfEntity(final IEntity entity) {
        final IEntity[] mEntities = this.mEntities;
        for (int i = -1 + mEntities.length; i >= 0; --i) {
            if (mEntities[i] == entity) {
                return i;
            }
        }
        return -1;
    }
    
    @Override
    public void addEntity(final IEntity entity) {
        if (this.mEntityCount < this.mCapacity) {
            this.mEntities[this.mEntityCount] = entity;
            ++this.mEntityCount;
        }
    }
    
    @Override
    public void clear() {
        final IEntity[] mEntities = this.mEntities;
        for (int i = -1 + this.mEntityCount; i >= 0; --i) {
            mEntities[i] = null;
        }
        this.mEntityCount = 0;
    }
    
    @Override
    public IEntity findEntity(final IEntityMatcher entityMatcher) {
        final IEntity[] mEntities = this.mEntities;
        for (int i = -1 + mEntities.length; i >= 0; --i) {
            final IEntity entity = mEntities[i];
            if (entityMatcher.matches(entity)) {
                return entity;
            }
        }
        return null;
    }
    
    @Override
    public IEntity getEntity(final int n) {
        this.checkIndex(n);
        return this.mEntities[n];
    }
    
    @Override
    public int getEntityCount() {
        return this.mEntityCount;
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        final IEntity[] mEntities = this.mEntities;
        for (int mEntityCount = this.mEntityCount, i = 0; i < mEntityCount; ++i) {
            mEntities[i].onDraw(gl10, camera);
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        final IEntity[] mEntities = this.mEntities;
        for (int mEntityCount = this.mEntityCount, i = 0; i < mEntityCount; ++i) {
            mEntities[i].onUpdate(n);
        }
    }
    
    @Override
    public IEntity removeEntity(final int n) {
        this.checkIndex(n);
        final IEntity[] mEntities = this.mEntities;
        final IEntity entity = mEntities[n];
        final int mEntityCount = -1 + this.mEntityCount;
        if (n == mEntityCount) {
            this.mEntities[mEntityCount] = null;
        }
        else {
            mEntities[n] = mEntities[mEntityCount];
            mEntities[this.mEntityCount] = null;
        }
        this.mEntityCount = mEntityCount;
        return entity;
    }
    
    @Override
    public boolean removeEntity(final IEntity entity) {
        return this.removeEntity(this.indexOfEntity(entity)) != null;
    }
    
    @Override
    public boolean removeEntity(final IEntityMatcher entityMatcher) {
        final IEntity[] mEntities = this.mEntities;
        for (int i = -1 + mEntities.length; i >= 0; --i) {
            if (entityMatcher.matches(mEntities[i])) {
                this.removeEntity(i);
                return true;
            }
        }
        return false;
    }
    
    @Override
    public IEntity replaceEntity(final int n, final IEntity entity) {
        this.checkIndex(n);
        final IEntity[] mEntities = this.mEntities;
        final IEntity entity2 = mEntities[n];
        mEntities[n] = entity;
        return entity2;
    }
    
    @Override
    public void reset() {
        super.reset();
        final IEntity[] mEntities = this.mEntities;
        for (int i = -1 + this.mEntityCount; i >= 0; --i) {
            mEntities[i].reset();
        }
    }
    
    @Override
    public void setEntity(final int n, final IEntity entity) {
        this.checkIndex(n);
        if (n == this.mEntityCount) {
            this.addEntity(entity);
        }
        else if (n < this.mEntityCount) {
            this.mEntities[n] = entity;
        }
    }
    
    @Override
    public void sortEntities() {
        ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount);
    }
    
    @Override
    public void sortEntities(final Comparator<IEntity> comparator) {
        ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount, comparator);
    }
    
    @Override
    public void swapEntities(final int n, final int n2) {
        if (n > this.mEntityCount) {
            throw new IndexOutOfBoundsException("pEntityIndexA was bigger than the EntityCount.");
        }
        if (n > this.mEntityCount) {
            throw new IndexOutOfBoundsException("pEntityIndexB was bigger than the EntityCount.");
        }
        final IEntity[] mEntities = this.mEntities;
        final IEntity entity = mEntities[n];
        mEntities[n] = mEntities[n2];
        mEntities[n2] = entity;
    }
}
