/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.animator.BaseMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.shape.modifier.MoveModifier;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class SlideMenuAnimator
extends BaseMenuAnimator {
    private static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        int[] arrn;
        int[] arrn2 = SlideMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
        if (arrn2 != null) {
            return arrn2;
        }
        arrn = new int[HorizontalAlign.values().length];
        try {
            arrn[HorizontalAlign.CENTER.ordinal()] = 2;
        }
        catch (NoSuchFieldError var2_4) {}
        try {
            arrn[HorizontalAlign.LEFT.ordinal()] = 1;
        }
        catch (NoSuchFieldError var3_3) {}
        try {
            arrn[HorizontalAlign.RIGHT.ordinal()] = 3;
        }
        catch (NoSuchFieldError var4_2) {}
        SlideMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = arrn;
        return arrn;
    }

    public SlideMenuAnimator() {
    }

    public SlideMenuAnimator(float f) {
        super(f);
    }

    public SlideMenuAnimator(float f, IEaseFunction iEaseFunction) {
        super(f, iEaseFunction);
    }

    public SlideMenuAnimator(HorizontalAlign horizontalAlign) {
        super(horizontalAlign);
    }

    public SlideMenuAnimator(HorizontalAlign horizontalAlign, float f) {
        super(horizontalAlign, f);
    }

    public SlideMenuAnimator(HorizontalAlign horizontalAlign, float f, IEaseFunction iEaseFunction) {
        super(horizontalAlign, f, iEaseFunction);
    }

    public SlideMenuAnimator(HorizontalAlign horizontalAlign, IEaseFunction iEaseFunction) {
        super(horizontalAlign, iEaseFunction);
    }

    public SlideMenuAnimator(IEaseFunction iEaseFunction) {
        super(iEaseFunction);
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void buildAnimations(ArrayList<IMenuItem> arrayList, float f, float f2) {
        IEaseFunction iEaseFunction = this.mEaseFunction;
        float f3 = this.getMaximumWidth(arrayList);
        float f4 = this.getOverallHeight(arrayList);
        float f5 = 0.5f * (f - f3);
        float f6 = 0.5f * (f2 - f4);
        float f7 = 0.0f;
        int n = arrayList.size();
        for (int i = 0; i < n; ++i) {
            float f8;
            IMenuItem iMenuItem = arrayList.get(i);
            switch (SlideMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[this.mHorizontalAlign.ordinal()]) {
                default: {
                    f8 = 0.5f * (f3 - iMenuItem.getWidthScaled());
                    break;
                }
                case 1: {
                    f8 = 0.0f;
                    break;
                }
                case 3: {
                    f8 = f3 - iMenuItem.getWidthScaled();
                }
            }
            MoveModifier moveModifier = new MoveModifier(1.0f, - f3, f5 + f8, f6 + f7, f6 + f7, iEaseFunction);
            moveModifier.setRemoveWhenFinished(false);
            iMenuItem.addShapeModifier((IModifier)moveModifier);
            f7+=iMenuItem.getHeight() + this.mMenuItemSpacing;
        }
    }

    @Override
    public void prepareAnimations(ArrayList<IMenuItem> arrayList, float f, float f2) {
        float f3 = this.getMaximumWidth(arrayList);
        float f4 = 0.5f * (f2 - this.getOverallHeight(arrayList));
        float f5 = this.mMenuItemSpacing;
        float f6 = 0.0f;
        int n = arrayList.size();
        int n2 = 0;
        while (n2 < n) {
            IMenuItem iMenuItem = arrayList.get(n2);
            iMenuItem.setPosition(- f3, f4 + f6);
            f6+=f5 + iMenuItem.getHeight();
            ++n2;
        }
        return;
    }
}

