/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.util;

import org.anddev.andengine.util.modifier.IModifier;

public class ModifierUtils {
    public static <T> IModifier<T> getModifierWithLongestDuration(IModifier<T>[] arriModifier) {
        IModifier<T> iModifier = null;
        float f = 1.4E-45f;
        int n = -1 + arriModifier.length;
        while (n >= 0) {
            float f2;
            if ((f2 = arriModifier[n].getDuration()) > f) {
                f = f2;
                iModifier = arriModifier[n];
            }
            --n;
        }
        return iModifier;
    }

    public static float getSequenceDurationOfModifier(IModifier<?>[] arriModifier) {
        float f = 1.4E-45f;
        int n = -1 + arriModifier.length;
        while (n >= 0) {
            f+=arriModifier[n].getDuration();
            --n;
        }
        return f;
    }
}

