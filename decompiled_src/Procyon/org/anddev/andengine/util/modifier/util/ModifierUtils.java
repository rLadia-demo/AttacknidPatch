package org.anddev.andengine.util.modifier.util;

import org.anddev.andengine.util.modifier.*;

public class ModifierUtils
{
    public static <T> IModifier<T> getModifierWithLongestDuration(final IModifier<T>[] array) {
        IModifier<T> modifier = null;
        float n = Float.MIN_VALUE;
        for (int i = -1 + array.length; i >= 0; --i) {
            final float duration = array[i].getDuration();
            if (duration > n) {
                n = duration;
                modifier = array[i];
            }
        }
        return modifier;
    }
    
    public static float getSequenceDurationOfModifier(final IModifier<?>[] array) {
        float n = Float.MIN_VALUE;
        for (int i = -1 + array.length; i >= 0; --i) {
            n += array[i].getDuration();
        }
        return n;
    }
}
