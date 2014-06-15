/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.animator.IMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseMenuAnimator
implements IMenuAnimator {
    protected static final float DURATION = 1.0f;
    private static final HorizontalAlign HORIZONTALALIGN_DEFAULT = HorizontalAlign.CENTER;
    private static final float MENUITEMSPACING_DEFAULT = 1.0f;
    protected final IEaseFunction mEaseFunction;
    protected final HorizontalAlign mHorizontalAlign;
    protected final float mMenuItemSpacing;

    public BaseMenuAnimator() {
        this(1.0f);
    }

    public BaseMenuAnimator(float f) {
        this(BaseMenuAnimator.HORIZONTALALIGN_DEFAULT, f);
    }

    public BaseMenuAnimator(float f, IEaseFunction iEaseFunction) {
        this(BaseMenuAnimator.HORIZONTALALIGN_DEFAULT, f, iEaseFunction);
    }

    public BaseMenuAnimator(HorizontalAlign horizontalAlign) {
        this(horizontalAlign, 1.0f);
    }

    public BaseMenuAnimator(HorizontalAlign horizontalAlign, float f) {
        this(horizontalAlign, f, IEaseFunction.DEFAULT);
    }

    public BaseMenuAnimator(HorizontalAlign horizontalAlign, float f, IEaseFunction iEaseFunction) {
        this.mHorizontalAlign = horizontalAlign;
        this.mMenuItemSpacing = f;
        this.mEaseFunction = iEaseFunction;
    }

    public BaseMenuAnimator(HorizontalAlign horizontalAlign, IEaseFunction iEaseFunction) {
        this(horizontalAlign, 1.0f, iEaseFunction);
    }

    public BaseMenuAnimator(IEaseFunction iEaseFunction) {
        this(1.0f, iEaseFunction);
    }

    protected float getMaximumWidth(ArrayList<IMenuItem> arrayList) {
        float f = 1.4E-45f;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            f = Math.max(f, arrayList.get(n).getWidthScaled());
            --n;
        }
        return f;
    }

    protected float getOverallHeight(ArrayList<IMenuItem> arrayList) {
        float f = 0.0f;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            f+=arrayList.get(n).getHeight();
            --n;
        }
        return f + (float)(-1 + arrayList.size()) * this.mMenuItemSpacing;
    }
}

