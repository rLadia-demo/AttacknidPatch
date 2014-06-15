/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor;

public final class SensorDelay
extends Enum<SensorDelay> {
    private static final /* synthetic */ SensorDelay[] ENUM$VALUES;
    public static final /* enum */ SensorDelay FASTEST;
    public static final /* enum */ SensorDelay GAME;
    public static final /* enum */ SensorDelay NORMAL;
    public static final /* enum */ SensorDelay UI;
    private final int mDelay;

    static {
        SensorDelay.NORMAL = new SensorDelay("NORMAL", 0, 3);
        SensorDelay.UI = new SensorDelay("UI", 1, 2);
        SensorDelay.GAME = new SensorDelay("GAME", 2, 1);
        SensorDelay.FASTEST = new SensorDelay("FASTEST", 3, 0);
        SensorDelay[] arrsensorDelay = new SensorDelay[]{SensorDelay.NORMAL, SensorDelay.UI, SensorDelay.GAME, SensorDelay.FASTEST};
        SensorDelay.ENUM$VALUES = arrsensorDelay;
    }

    private SensorDelay(String string2, int n22, int n22) {
        super(string, n);
        this.mDelay = string2;
    }

    public static SensorDelay valueOf(String string) {
        return (SensorDelay)Enum.valueOf(SensorDelay.class, string);
    }

    public static SensorDelay[] values() {
        SensorDelay[] arrsensorDelay = SensorDelay.ENUM$VALUES;
        int n = arrsensorDelay.length;
        SensorDelay[] arrsensorDelay2 = new SensorDelay[n];
        System.arraycopy(arrsensorDelay, 0, arrsensorDelay2, 0, n);
        return arrsensorDelay2;
    }

    public int getDelay() {
        return this.mDelay;
    }
}

