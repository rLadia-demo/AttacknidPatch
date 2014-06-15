/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util;

import android.util.FloatMath;
import java.util.Random;
import org.anddev.andengine.util.constants.MathConstants;

public class MathUtils
implements MathConstants {
    public static Random RANDOM = new Random(System.nanoTime());

    public static final float arrayAverage(float[] arrf) {
        return MathUtils.arraySum(arrf) / (float)arrf.length;
    }

    public static final float arraySum(float[] arrf) {
        float f = 0.0f;
        int n = arrf.length;
        int n2 = 0;
        while (n2 < n) {
            f+=arrf[n2];
            ++n2;
        }
        return f;
    }

    public static final void arraySumInternal(int[] arrn) {
        int n = arrn.length;
        int n2 = 1;
        while (n2 < n) {
            arrn[n2] = arrn[n2 - 1] + arrn[n2];
            ++n2;
        }
        return;
    }

    public static final void arraySumInternal(long[] arrl) {
        int n = arrl.length;
        int n2 = 1;
        while (n2 < n) {
            arrl[n2] = arrl[n2 - 1] + arrl[n2];
            ++n2;
        }
        return;
    }

    public static final void arraySumInternal(long[] arrl, long l) {
        arrl[0] = l * arrl[0];
        int n = arrl.length;
        int n2 = 1;
        while (n2 < n) {
            arrl[n2] = arrl[n2 - 1] + l * arrl[n2];
            ++n2;
        }
        return;
    }

    public static final void arraySumInto(long[] arrl, long[] arrl2, long l) {
        arrl2[0] = l * arrl[0];
        int n = arrl.length;
        int n2 = 1;
        while (n2 < n) {
            arrl2[n2] = arrl2[n2 - 1] + l * arrl[n2];
            ++n2;
        }
        return;
    }

    public static float bringToBounds(float f, float f2, float f3) {
        return Math.max(f, Math.min(f2, f3));
    }

    public static int bringToBounds(int n, int n2, int n3) {
        return Math.max(n, Math.min(n2, n3));
    }

    public static final float degToRad(float f) {
        return 0.017453292f * f;
    }

    public static final boolean isPowerOfTwo(int n) {
        if (n == 0 || (n & n - 1) != 0) return false;
        return true;
    }

    public static final int nextPowerOfTwo(int n) {
        if (n == 0) {
            return 1;
        }
        int n2 = n - 1;
        int n3 = 1;
        while (n3 < 32) {
            n2|=n2 >> n3;
            --n3;
        }
        return n2 + 1;
    }

    public static final float radToDeg(float f) {
        return 57.295776f * f;
    }

    public static final float random(float f, float f2) {
        return f + MathUtils.RANDOM.nextFloat() * (f2 - f);
    }

    public static final int random(int n, int n2) {
        return n + MathUtils.RANDOM.nextInt(1 + n2 - n);
    }

    public static final int randomSign() {
        if (!MathUtils.RANDOM.nextBoolean()) return -1;
        return 1;
    }

    public static float[] revertRotateAndScaleAroundCenter(float[] arrf, float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        MathUtils.revertScaleAroundCenter(arrf, f4, f5, f6, f7);
        return MathUtils.revertRotateAroundCenter(arrf, f, f2, f3);
    }

    public static float[] revertRotateAroundCenter(float[] arrf, float f, float f2, float f3) {
        return MathUtils.rotateAroundCenter(arrf, - f, f2, f3);
    }

    public static float[] revertScaleAroundCenter(float[] arrf, float f, float f2, float f3, float f4) {
        return MathUtils.scaleAroundCenter(arrf, 1.0f / f, 1.0f / f2, f3, f4);
    }

    public static float[] rotateAndScaleAroundCenter(float[] arrf, float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        MathUtils.rotateAroundCenter(arrf, f, f2, f3);
        return MathUtils.scaleAroundCenter(arrf, f4, f5, f6, f7);
    }

    public static float[] rotateAroundCenter(float[] arrf, float f, float f2, float f3) {
        if (f == 0.0f) return arrf;
        float f4 = MathUtils.degToRad(f);
        float f5 = FloatMath.sin((float)f4);
        float f6 = FloatMath.cos((float)f4);
        int n = -2 + arrf.length;
        while (n >= 0) {
            float f7 = arrf[n];
            float f8 = arrf[n + 1];
            arrf[n] = f2 + f6 * (f7 - f2) - f5 * (f8 - f3);
            arrf[n + 1] = f3 + f5 * (f7 - f2) + f6 * (f8 - f3);
            n-=2;
        }
        return arrf;
    }

    public static float[] scaleAroundCenter(float[] arrf, float f, float f2, float f3, float f4) {
        if (f == 1.0f && f2 == 1.0f) return arrf;
        int n = -2 + arrf.length;
        while (n >= 0) {
            arrf[n] = f3 + f * (arrf[n] - f3);
            arrf[n + 1] = f4 + f2 * (arrf[n + 1] - f4);
            n-=2;
        }
        return arrf;
    }

    public static final int sum(int[] arrn) {
        int n = 0;
        int n2 = -1 + arrn.length;
        while (n2 >= 0) {
            n+=arrn[n2];
            --n2;
        }
        return n;
    }

    public float distance(float f, float f2, float f3, float f4) {
        float f5 = f3 - f;
        float f6 = f4 - f2;
        return FloatMath.sqrt((float)(f5 * f5 + f6 * f6));
    }
}

