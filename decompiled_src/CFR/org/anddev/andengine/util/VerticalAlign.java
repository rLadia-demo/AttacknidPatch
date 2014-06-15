/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

public final class VerticalAlign
extends Enum<VerticalAlign> {
    public static final /* enum */ VerticalAlign BOTTOM;
    public static final /* enum */ VerticalAlign CENTER;
    private static final /* synthetic */ VerticalAlign[] ENUM$VALUES;
    public static final /* enum */ VerticalAlign TOP;

    static {
        VerticalAlign.TOP = new VerticalAlign("TOP", 0);
        VerticalAlign.CENTER = new VerticalAlign("CENTER", 1);
        VerticalAlign.BOTTOM = new VerticalAlign("BOTTOM", 2);
        VerticalAlign[] arrverticalAlign = new VerticalAlign[]{VerticalAlign.TOP, VerticalAlign.CENTER, VerticalAlign.BOTTOM};
        VerticalAlign.ENUM$VALUES = arrverticalAlign;
    }

    private VerticalAlign(String string22, int string22) {
        super(string, n);
    }

    public static VerticalAlign valueOf(String string) {
        return (VerticalAlign)Enum.valueOf(VerticalAlign.class, string);
    }

    public static VerticalAlign[] values() {
        VerticalAlign[] arrverticalAlign = VerticalAlign.ENUM$VALUES;
        int n = arrverticalAlign.length;
        VerticalAlign[] arrverticalAlign2 = new VerticalAlign[n];
        System.arraycopy(arrverticalAlign, 0, arrverticalAlign2, 0, n);
        return arrverticalAlign2;
    }
}

