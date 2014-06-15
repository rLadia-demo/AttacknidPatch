package org.anddev.andengine.entity.layer;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import java.util.*;

public class DynamicCapacityLayer extends BaseLayer
{
    private static final int CAPACITY_DEFAULT = 10;
    private final ArrayList<IEntity> mEntities;
    
    public DynamicCapacityLayer() {
        this(10);
    }
    
    public DynamicCapacityLayer(final int n) {
        super();
        this.mEntities = new ArrayList<IEntity>(n);
    }
    
    @Override
    public void addEntity(final IEntity entity) {
        this.mEntities.add(entity);
    }
    
    @Override
    public void clear() {
        this.mEntities.clear();
    }
    
    @Override
    public IEntity findEntity(final IEntityMatcher entityMatcher) {
        final ArrayList<IEntity> mEntities = this.mEntities;
        for (int i = -1 + mEntities.size(); i >= 0; --i) {
            final IEntity entity = mEntities.get(i);
            if (entityMatcher.matches(entity)) {
                return entity;
            }
        }
        return null;
    }
    
    @Override
    public IEntity getEntity(final int n) {
        return this.mEntities.get(n);
    }
    
    @Override
    public int getEntityCount() {
        return this.mEntities.size();
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        final ArrayList<IEntity> mEntities = this.mEntities;
        for (int size = mEntities.size(), i = 0; i < size; ++i) {
            mEntities.get(i).onDraw(gl10, camera);
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        final ArrayList<IEntity> mEntities = this.mEntities;
        for (int size = mEntities.size(), i = 0; i < size; ++i) {
            mEntities.get(i).onUpdate(n);
        }
    }
    
    @Override
    public IEntity removeEntity(final int n) {
        return this.mEntities.remove(n);
    }
    
    @Override
    public boolean removeEntity(final IEntity entity) {
        return this.mEntities.remove(entity);
    }
    
    @Override
    public boolean removeEntity(final IEntityMatcher entityMatcher) {
        final ArrayList<IEntity> mEntities = this.mEntities;
        for (int i = -1 + mEntities.size(); i >= 0; --i) {
            if (entityMatcher.matches(mEntities.get(i))) {
                mEntities.remove(i);
                return true;
            }
        }
        return false;
    }
    
    @Override
    public IEntity replaceEntity(final int n, final IEntity entity) {
        return this.mEntities.set(n, entity);
    }
    
    @Override
    public void reset() {
        super.reset();
        final ArrayList<IEntity> mEntities = this.mEntities;
        for (int i = -1 + mEntities.size(); i >= 0; --i) {
            mEntities.get(i).reset();
        }
    }
    
    @Override
    public void setEntity(final int n, final IEntity entity) {
        if (n == this.mEntities.size()) {
            this.addEntity(entity);
            return;
        }
        this.mEntities.set(n, entity);
    }
    
    @Override
    public void sortEntities() {
        ZIndexSorter.getInstance().sort(this.mEntities);
    }
    
    @Override
    public void sortEntities(final Comparator<IEntity> comparator) {
        ZIndexSorter.getInstance().sort(this.mEntities, comparator);
    }
    
    @Override
    public void swapEntities(final int n, final int n2) {
        final ArrayList<IEntity> mEntities = this.mEntities;
        mEntities.set(n, mEntities.set(n2, mEntities.get(n)));
    }
}
