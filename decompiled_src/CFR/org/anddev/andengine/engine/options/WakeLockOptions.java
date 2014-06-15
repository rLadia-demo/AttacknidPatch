/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.options;

public final class WakeLockOptions
extends Enum<WakeLockOptions> {
    private static final /* synthetic */ WakeLockOptions[] ENUM$VALUES;
    public static final /* enum */ WakeLockOptions FULL = new WakeLockOptions("FULL", 0, 26);
    public static final /* enum */ WakeLockOptions SCREEN_BRIGHT = new WakeLockOptions("SCREEN_BRIGHT", 1, 10);
    public static final /* enum */ WakeLockOptions SCREEN_DIM = new WakeLockOptions("SCREEN_DIM", 2, 6);
    private final int mFlag;

    static {
        WakeLockOptions[] arrwakeLockOptions = new WakeLockOptions[]{WakeLockOptions.FULL, WakeLockOptions.SCREEN_BRIGHT, WakeLockOptions.SCREEN_DIM};
        WakeLockOptions.ENUM$VALUES = arrwakeLockOptions;
    }

    private WakeLockOptions(String string2, int n22, int n22) {
        super(string, n);
        this.mFlag = string2;
    }

    public static WakeLockOptions valueOf(String string) {
        return (WakeLockOptions)Enum.valueOf(WakeLockOptions.class, string);
    }

    public static WakeLockOptions[] values() {
        WakeLockOptions[] arrwakeLockOptions = WakeLockOptions.ENUM$VALUES;
        int n = arrwakeLockOptions.length;
        WakeLockOptions[] arrwakeLockOptions2 = new WakeLockOptions[n];
        System.arraycopy(arrwakeLockOptions, 0, arrwakeLockOptions2, 0, n);
        return arrwakeLockOptions2;
    }

    public int getFlag() {
        return this.mFlag;
    }
}

