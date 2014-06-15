/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.View
 *  android.view.View$MeasureSpec
 */
package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.View;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;

public abstract class BaseResolutionPolicy
implements IResolutionPolicy {
    protected static void throwOnNotMeasureSpecEXACTLY(int n, int n2) {
        int n3 = View.MeasureSpec.getMode((int)n);
        int n4 = View.MeasureSpec.getMode((int)n2);
        if (n3 == 1073741824 && n4 == 1073741824) return;
        throw new IllegalStateException("This IResolutionPolicy requires MeasureSpec.EXACTLY ! That means ");
    }
}

