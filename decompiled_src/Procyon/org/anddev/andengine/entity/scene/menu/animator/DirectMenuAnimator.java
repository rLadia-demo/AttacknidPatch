package org.anddev.andengine.entity.scene.menu.animator;

import org.anddev.andengine.util.*;
import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;

public class DirectMenuAnimator extends BaseMenuAnimator
{
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign = DirectMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
        if ($switch_TABLE$org$anddev$andengine$util$HorizontalAlign != null) {
            return $switch_TABLE$org$anddev$andengine$util$HorizontalAlign;
        }
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2 = new int[HorizontalAlign.values().length];
        while (true) {
            try {
                $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.CENTER.ordinal()] = 2;
                try {
                    $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.LEFT.ordinal()] = 1;
                    try {
                        $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.RIGHT.ordinal()] = 3;
                        return DirectMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2;
                    }
                    catch (NoSuchFieldError noSuchFieldError) {}
                }
                catch (NoSuchFieldError noSuchFieldError2) {}
            }
            catch (NoSuchFieldError noSuchFieldError3) {
                continue;
            }
            break;
        }
    }
    
    public DirectMenuAnimator() {
        super();
    }
    
    public DirectMenuAnimator(final float n) {
        super(n);
    }
    
    public DirectMenuAnimator(final HorizontalAlign horizontalAlign) {
        super(horizontalAlign);
    }
    
    public DirectMenuAnimator(final HorizontalAlign horizontalAlign, final float n) {
        super(horizontalAlign, n);
    }
    
    @Override
    public void buildAnimations(final ArrayList<IMenuItem> list, final float n, final float n2) {
    }
    
    @Override
    public void prepareAnimations(final ArrayList<IMenuItem> list, final float n, final float n2) {
        final float maximumWidth = this.getMaximumWidth(list);
        final float overallHeight = this.getOverallHeight(list);
        final float n3 = 0.5f * (n - maximumWidth);
        final float n4 = 0.5f * (n2 - overallHeight);
        final float mMenuItemSpacing = this.mMenuItemSpacing;
        float n5 = 0.0f;
        for (int size = list.size(), i = 0; i < size; ++i) {
            final IMenuItem menuItem = list.get(i);
            float n6 = 0.0f;
            switch ($SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[this.mHorizontalAlign.ordinal()]) {
                default: {
                    n6 = 0.5f * (maximumWidth - menuItem.getWidthScaled());
                    break;
                }
                case 1: {
                    n6 = 0.0f;
                    break;
                }
                case 3: {
                    n6 = maximumWidth - menuItem.getWidthScaled();
                    break;
                }
            }
            menuItem.setPosition(n3 + n6, n4 + n5);
            n5 += mMenuItemSpacing + menuItem.getHeight();
        }
    }
}
