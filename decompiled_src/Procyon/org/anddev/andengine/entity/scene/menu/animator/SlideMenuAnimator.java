package org.anddev.andengine.entity.scene.menu.animator;

import org.anddev.andengine.util.*;
import org.anddev.andengine.util.modifier.ease.*;
import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;
import org.anddev.andengine.entity.shape.modifier.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class SlideMenuAnimator extends BaseMenuAnimator
{
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign = SlideMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
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
                        return SlideMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2;
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
    
    public SlideMenuAnimator() {
        super();
    }
    
    public SlideMenuAnimator(final float n) {
        super(n);
    }
    
    public SlideMenuAnimator(final float n, final IEaseFunction easeFunction) {
        super(n, easeFunction);
    }
    
    public SlideMenuAnimator(final HorizontalAlign horizontalAlign) {
        super(horizontalAlign);
    }
    
    public SlideMenuAnimator(final HorizontalAlign horizontalAlign, final float n) {
        super(horizontalAlign, n);
    }
    
    public SlideMenuAnimator(final HorizontalAlign horizontalAlign, final float n, final IEaseFunction easeFunction) {
        super(horizontalAlign, n, easeFunction);
    }
    
    public SlideMenuAnimator(final HorizontalAlign horizontalAlign, final IEaseFunction easeFunction) {
        super(horizontalAlign, easeFunction);
    }
    
    public SlideMenuAnimator(final IEaseFunction easeFunction) {
        super(easeFunction);
    }
    
    @Override
    public void buildAnimations(final ArrayList<IMenuItem> list, final float n, final float n2) {
        final IEaseFunction mEaseFunction = this.mEaseFunction;
        final float maximumWidth = this.getMaximumWidth(list);
        final float overallHeight = this.getOverallHeight(list);
        final float n3 = 0.5f * (n - maximumWidth);
        final float n4 = 0.5f * (n2 - overallHeight);
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
            final MoveModifier moveModifier = new MoveModifier(1.0f, -maximumWidth, n3 + n6, n4 + n5, n4 + n5, mEaseFunction);
            moveModifier.setRemoveWhenFinished(false);
            menuItem.addShapeModifier(moveModifier);
            n5 += menuItem.getHeight() + this.mMenuItemSpacing;
        }
    }
    
    @Override
    public void prepareAnimations(final ArrayList<IMenuItem> list, final float n, final float n2) {
        final float maximumWidth = this.getMaximumWidth(list);
        final float n3 = 0.5f * (n2 - this.getOverallHeight(list));
        final float mMenuItemSpacing = this.mMenuItemSpacing;
        float n4 = 0.0f;
        for (int size = list.size(), i = 0; i < size; ++i) {
            final IMenuItem menuItem = list.get(i);
            menuItem.setPosition(-maximumWidth, n3 + n4);
            n4 += mMenuItemSpacing + menuItem.getHeight();
        }
    }
}
