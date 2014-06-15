package org.anddev.andengine.entity.scene.menu.animator;

import org.anddev.andengine.util.*;
import org.anddev.andengine.util.modifier.ease.*;
import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;
import org.anddev.andengine.entity.shape.modifier.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class AlphaMenuAnimator extends BaseMenuAnimator
{
    private static final float ALPHA_FROM = 0.0f;
    private static final float ALPHA_TO = 1.0f;
    
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign = AlphaMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
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
                        return AlphaMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2;
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
    
    public AlphaMenuAnimator() {
        super();
    }
    
    public AlphaMenuAnimator(final float n) {
        super(n);
    }
    
    public AlphaMenuAnimator(final float n, final IEaseFunction easeFunction) {
        super(n, easeFunction);
    }
    
    public AlphaMenuAnimator(final HorizontalAlign horizontalAlign) {
        super(horizontalAlign);
    }
    
    public AlphaMenuAnimator(final HorizontalAlign horizontalAlign, final float n) {
        super(horizontalAlign, n);
    }
    
    public AlphaMenuAnimator(final HorizontalAlign horizontalAlign, final float n, final IEaseFunction easeFunction) {
        super(horizontalAlign, n, easeFunction);
    }
    
    public AlphaMenuAnimator(final HorizontalAlign horizontalAlign, final IEaseFunction easeFunction) {
        super(horizontalAlign, easeFunction);
    }
    
    public AlphaMenuAnimator(final IEaseFunction easeFunction) {
        super(easeFunction);
    }
    
    @Override
    public void buildAnimations(final ArrayList<IMenuItem> list, final float n, final float n2) {
        final IEaseFunction mEaseFunction = this.mEaseFunction;
        for (int i = -1 + list.size(); i >= 0; --i) {
            final AlphaModifier alphaModifier = new AlphaModifier(1.0f, 0.0f, 1.0f, mEaseFunction);
            alphaModifier.setRemoveWhenFinished(false);
            list.get(i).addShapeModifier(alphaModifier);
        }
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
            menuItem.setAlpha(0.0f);
            n5 += mMenuItemSpacing + menuItem.getHeight();
        }
    }
}
