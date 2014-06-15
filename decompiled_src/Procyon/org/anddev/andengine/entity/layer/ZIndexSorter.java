package org.anddev.andengine.entity.layer;

import org.anddev.andengine.util.sort.*;
import org.anddev.andengine.entity.*;
import java.util.*;

public class ZIndexSorter extends InsertionSorter<IEntity>
{
    private static ZIndexSorter INSTANCE;
    private final Comparator<IEntity> mZIndexComparator;
    
    private ZIndexSorter() {
        super();
        this.mZIndexComparator = new Comparator<IEntity>() {
            @Override
            public int compare(final IEntity entity, final IEntity entity2) {
                return entity.getZIndex() - entity2.getZIndex();
            }
        };
    }
    
    public static ZIndexSorter getInstance() {
        if (ZIndexSorter.INSTANCE == null) {
            ZIndexSorter.INSTANCE = new ZIndexSorter();
        }
        return ZIndexSorter.INSTANCE;
    }
    
    public void sort(final List<IEntity> list) {
        this.sort(list, this.mZIndexComparator);
    }
    
    public void sort(final List<IEntity> list, final int n, final int n2) {
        this.sort(list, n, n2, this.mZIndexComparator);
    }
    
    public void sort(final IEntity[] array) {
        this.sort(array, this.mZIndexComparator);
    }
    
    public void sort(final IEntity[] array, final int n, final int n2) {
        this.sort(array, n, n2, this.mZIndexComparator);
    }
}
