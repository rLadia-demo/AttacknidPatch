/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

public final class HorizontalAlign
extends Enum<HorizontalAlign> {
    public static final /* enum */ HorizontalAlign CENTER;
    private static final /* synthetic */ HorizontalAlign[] ENUM$VALUES;
    public static final /* enum */ HorizontalAlign LEFT;
    public static final /* enum */ HorizontalAlign RIGHT;

    static {
        HorizontalAlign.LEFT = new HorizontalAlign("LEFT", 0);
        HorizontalAlign.CENTER = new HorizontalAlign("CENTER", 1);
        HorizontalAlign.RIGHT = new HorizontalAlign("RIGHT", 2);
        HorizontalAlign[] arrhorizontalAlign = new HorizontalAlign[]{HorizontalAlign.LEFT, HorizontalAlign.CENTER, HorizontalAlign.RIGHT};
        HorizontalAlign.ENUM$VALUES = arrhorizontalAlign;
    }

    private HorizontalAlign(String string22, int string22) {
        super(string, n);
    }

    public static HorizontalAlign valueOf(String string) {
        return (HorizontalAlign)Enum.valueOf(HorizontalAlign.class, string);
    }

    public static HorizontalAlign[] values() {
        HorizontalAlign[] arrhorizontalAlign = HorizontalAlign.ENUM$VALUES;
        int n = arrhorizontalAlign.length;
        HorizontalAlign[] arrhorizontalAlign2 = new HorizontalAlign[n];
        System.arraycopy(arrhorizontalAlign, 0, arrhorizontalAlign2, 0, n);
        return arrhorizontalAlign2;
    }
}

