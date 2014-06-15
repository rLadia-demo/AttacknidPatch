/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.EaseLinear;

public interface IEaseFunction {
    public static final IEaseFunction DEFAULT = EaseLinear.getInstance();

    public float getPercentageDone(float var1, float var2, float var3, float var4);
}

