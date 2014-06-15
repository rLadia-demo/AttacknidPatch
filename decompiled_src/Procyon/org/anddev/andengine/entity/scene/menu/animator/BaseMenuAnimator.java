package org.anddev.andengine.entity.scene.menu.animator;

import org.anddev.andengine.util.*;
import org.anddev.andengine.util.modifier.ease.*;
import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;

public abstract class BaseMenuAnimator implements IMenuAnimator
{
    protected static final float DURATION = 1.0f;
    private static final HorizontalAlign HORIZONTALALIGN_DEFAULT;
    private static final float MENUITEMSPACING_DEFAULT = 1.0f;
    protected final IEaseFunction mEaseFunction;
    protected final HorizontalAlign mHorizontalAlign;
    protected final float mMenuItemSpacing;
    
    static {
        HORIZONTALALIGN_DEFAULT = HorizontalAlign.CENTER;
    }
    
    public BaseMenuAnimator() {
        this(1.0f);
    }
    
    public BaseMenuAnimator(final float n) {
        this(BaseMenuAnimator.HORIZONTALALIGN_DEFAULT, n);
    }
    
    public BaseMenuAnimator(final float n, final IEaseFunction easeFunction) {
        this(BaseMenuAnimator.HORIZONTALALIGN_DEFAULT, n, easeFunction);
    }
    
    public BaseMenuAnimator(final HorizontalAlign horizontalAlign) {
        this(horizontalAlign, 1.0f);
    }
    
    public BaseMenuAnimator(final HorizontalAlign horizontalAlign, final float n) {
        this(horizontalAlign, n, IEaseFunction.DEFAULT);
    }
    
    public BaseMenuAnimator(final HorizontalAlign mHorizontalAlign, final float mMenuItemSpacing, final IEaseFunction mEaseFunction) {
        super();
        this.mHorizontalAlign = mHorizontalAlign;
        this.mMenuItemSpacing = mMenuItemSpacing;
        this.mEaseFunction = mEaseFunction;
    }
    
    public BaseMenuAnimator(final HorizontalAlign horizontalAlign, final IEaseFunction easeFunction) {
        this(horizontalAlign, 1.0f, easeFunction);
    }
    
    public BaseMenuAnimator(final IEaseFunction easeFunction) {
        this(1.0f, easeFunction);
    }
    
    protected float getMaximumWidth(final ArrayList<IMenuItem> list) {
        float max = Float.MIN_VALUE;
        for (int i = -1 + list.size(); i >= 0; --i) {
            max = Math.max(max, list.get(i).getWidthScaled());
        }
        return max;
    }
    
    protected float getOverallHeight(final ArrayList<IMenuItem> list) {
        float n = 0.0f;
        for (int i = -1 + list.size(); i >= 0; --i) {
            n += list.get(i).getHeight();
        }
        return n + (-1 + list.size()) * this.mMenuItemSpacing;
    }
}
