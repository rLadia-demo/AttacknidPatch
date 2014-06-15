/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.animator.BaseMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.shape.modifier.AlphaModifier;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class AlphaMenuAnimator
extends BaseMenuAnimator {
    private static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
    private static final float ALPHA_FROM = 0.0f;
    private static final float ALPHA_TO = 1.0f;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        int[] arrn;
        int[] arrn2 = AlphaMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
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
        AlphaMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = arrn;
        return arrn;
    }

    public AlphaMenuAnimator() {
    }

    public AlphaMenuAnimator(float f) {
        super(f);
    }

    public AlphaMenuAnimator(float f, IEaseFunction iEaseFunction) {
        super(f, iEaseFunction);
    }

    public AlphaMenuAnimator(HorizontalAlign horizontalAlign) {
        super(horizontalAlign);
    }

    public AlphaMenuAnimator(HorizontalAlign horizontalAlign, float f) {
        super(horizontalAlign, f);
    }

    public AlphaMenuAnimator(HorizontalAlign horizontalAlign, float f, IEaseFunction iEaseFunction) {
        super(horizontalAlign, f, iEaseFunction);
    }

    public AlphaMenuAnimator(HorizontalAlign horizontalAlign, IEaseFunction iEaseFunction) {
        super(horizontalAlign, iEaseFunction);
    }

    public AlphaMenuAnimator(IEaseFunction iEaseFunction) {
        super(iEaseFunction);
    }

    @Override
    public void buildAnimations(ArrayList<IMenuItem> arrayList, float f, float f2) {
        IEaseFunction iEaseFunction = this.mEaseFunction;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            AlphaModifier alphaModifier = new AlphaModifier(1.0f, 0.0f, 1.0f, iEaseFunction);
            alphaModifier.setRemoveWhenFinished(false);
            arrayList.get(n).addShapeModifier((IModifier)alphaModifier);
            --n;
        }
        return;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void prepareAnimations(ArrayList<IMenuItem> arrayList, float f, float f2) {
        float f3 = this.getMaximumWidth(arrayList);
        float f4 = this.getOverallHeight(arrayList);
        float f5 = 0.5f * (f - f3);
        float f6 = 0.5f * (f2 - f4);
        float f7 = this.mMenuItemSpacing;
        float f8 = 0.0f;
        int n = arrayList.size();
        for (int i = 0; i < n; ++i) {
            float f9;
            IMenuItem iMenuItem = arrayList.get(i);
            switch (AlphaMenuAnimator.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[this.mHorizontalAlign.ordinal()]) {
                default: {
                    f9 = 0.5f * (f3 - iMenuItem.getWidthScaled());
                    break;
                }
                case 1: {
                    f9 = 0.0f;
                    break;
                }
                case 3: {
                    f9 = f3 - iMenuItem.getWidthScaled();
                }
            }
            iMenuItem.setPosition(f5 + f9, f6 + f8);
            iMenuItem.setAlpha(0.0f);
            f8+=f7 + iMenuItem.getHeight();
        }
    }
}

