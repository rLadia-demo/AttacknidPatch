/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.sort;

import java.util.Comparator;
import java.util.List;
import org.anddev.andengine.util.sort.Sorter;

public class InsertionSorter<T>
extends Sorter<T> {
    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    @Override
    public void sort(List<T> var1_1, int var2_2, int var3_3, Comparator<T> var4_4) {
        var5_5 = var2_2 + 1;
        block0 : do {
            if (var5_5 >= var3_3) return;
            var6_6 = var1_1.get(var5_5);
            var7_7 = var1_1.get(var5_5 - 1);
            ** if (var4_4.compare(var6_6, var7_7) >= 0) goto lbl13
lbl7: // 1 sources:
            var8_8 = var5_5;
            do {
                var9_9 = var8_8 - 1;
                var1_1.set(var8_8, var7_7);
                if (var9_9 <= var2_2 || var4_4.compare(var6_6, var7_7 = var1_1.get(var9_9 - 1)) >= 0) {
                    var1_1.set(var9_9, var6_6);
                } else {
                    ** GOTO lbl15
                }
lbl13: // 2 sources:
                ++var5_5;
                continue block0;
lbl15: // 2 sources:
                var8_8 = var9_9;
            } while (true);
            break;
        } while (true);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    @Override
    public void sort(T[] var1_1, int var2_2, int var3_3, Comparator<T> var4_4) {
        var5_5 = var2_2 + 1;
        block0 : do {
            if (var5_5 >= var3_3) return;
            var6_6 = var1_1[var5_5];
            var7_7 = var1_1[var5_5 - 1];
            ** if (var4_4.compare(var6_6, var7_7) >= 0) goto lbl13
lbl7: // 1 sources:
            var8_8 = var5_5;
            do {
                var9_9 = var8_8 - 1;
                var1_1[var8_8] = var7_7;
                if (var9_9 <= var2_2 || var4_4.compare(var6_6, var7_7 = var1_1[var9_9 - 1]) >= 0) {
                    var1_1[var9_9] = var6_6;
                } else {
                    ** GOTO lbl15
                }
lbl13: // 2 sources:
                ++var5_5;
                continue block0;
lbl15: // 2 sources:
                var8_8 = var9_9;
            } while (true);
            break;
        } while (true);
    }
}

