package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.*;

public abstract class BaseResolutionPolicy implements IResolutionPolicy
{
    protected static void throwOnNotMeasureSpecEXACTLY(final int n, final int n2) {
        final int mode = View$MeasureSpec.getMode(n);
        final int mode2 = View$MeasureSpec.getMode(n2);
        if (mode != 1073741824 || mode2 != 1073741824) {
            throw new IllegalStateException("This IResolutionPolicy requires MeasureSpec.EXACTLY ! That means ");
        }
    }
}
