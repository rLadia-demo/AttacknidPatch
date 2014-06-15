/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer;

import java.util.Comparator;
import java.util.List;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.util.sort.InsertionSorter;

public class ZIndexSorter
extends InsertionSorter<IEntity> {
    private static ZIndexSorter INSTANCE;
    private final Comparator<IEntity> mZIndexComparator;

    private ZIndexSorter() {
        this.mZIndexComparator = new Comparator<IEntity>(){

            @Override
            public int compare(IEntity iEntity, IEntity iEntity2) {
                return iEntity.getZIndex() - iEntity2.getZIndex();
            }
        };
    }

    public static ZIndexSorter getInstance() {
        if (ZIndexSorter.INSTANCE != null) return ZIndexSorter.INSTANCE;
        ZIndexSorter.INSTANCE = new ZIndexSorter();
        return ZIndexSorter.INSTANCE;
    }

    public void sort(List<IEntity> list) {
        this.sort(list, this.mZIndexComparator);
    }

    public void sort(List<IEntity> list, int n, int n2) {
        this.sort(list, n, n2, this.mZIndexComparator);
    }

    public void sort(IEntity[] arriEntity) {
        this.sort((Object[])arriEntity, this.mZIndexComparator);
    }

    public void sort(IEntity[] arriEntity, int n, int n2) {
        this.sort((Object[])arriEntity, n, n2, this.mZIndexComparator);
    }

}

