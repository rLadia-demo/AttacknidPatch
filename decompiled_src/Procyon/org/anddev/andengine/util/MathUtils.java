package org.anddev.andengine.util;

import org.anddev.andengine.util.constants.*;
import java.util.*;
import android.util.*;

public class MathUtils implements MathConstants
{
    public static Random RANDOM;
    
    static {
        MathUtils.RANDOM = new Random(System.nanoTime());
    }
    
    public static final float arrayAverage(final float[] array) {
        return arraySum(array) / array.length;
    }
    
    public static final float arraySum(final float[] array) {
        float n = 0.0f;
        for (int length = array.length, i = 0; i < length; ++i) {
            n += array[i];
        }
        return n;
    }
    
    public static final void arraySumInternal(final int[] array) {
        for (int length = array.length, i = 1; i < length; ++i) {
            array[i] += array[i - 1];
        }
    }
    
    public static final void arraySumInternal(final long[] array) {
        for (int length = array.length, i = 1; i < length; ++i) {
            array[i] += array[i - 1];
        }
    }
    
    public static final void arraySumInternal(final long[] array, final long n) {
        array[0] *= n;
        for (int length = array.length, i = 1; i < length; ++i) {
            array[i] = array[i - 1] + n * array[i];
        }
    }
    
    public static final void arraySumInto(final long[] array, final long[] array2, final long n) {
        array2[0] = n * array[0];
        for (int length = array.length, i = 1; i < length; ++i) {
            array2[i] = array2[i - 1] + n * array[i];
        }
    }
    
    public static float bringToBounds(final float n, final float n2, final float n3) {
        return Math.max(n, Math.min(n2, n3));
    }
    
    public static int bringToBounds(final int n, final int n2, final int n3) {
        return Math.max(n, Math.min(n2, n3));
    }
    
    public static final float degToRad(final float n) {
        return 0.017453292f * n;
    }
    
    public static final boolean isPowerOfTwo(final int n) {
        return n != 0 && (n & n - 1) == 0x0;
    }
    
    public static final int nextPowerOfTwo(final int n) {
        if (n == 0) {
            return 1;
        }
        int n2 = n - 1;
        for (int i = 1; i < 32; i <<= 1) {
            n2 |= n2 >> i;
        }
        return n2 + 1;
    }
    
    public static final float radToDeg(final float n) {
        return 57.295776f * n;
    }
    
    public static final float random(final float n, final float n2) {
        return n + MathUtils.RANDOM.nextFloat() * (n2 - n);
    }
    
    public static final int random(final int n, final int n2) {
        return n + MathUtils.RANDOM.nextInt(1 + (n2 - n));
    }
    
    public static final int randomSign() {
        if (MathUtils.RANDOM.nextBoolean()) {
            return 1;
        }
        return -1;
    }
    
    public static float[] revertRotateAndScaleAroundCenter(final float[] array, final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7) {
        revertScaleAroundCenter(array, n4, n5, n6, n7);
        return revertRotateAroundCenter(array, n, n2, n3);
    }
    
    public static float[] revertRotateAroundCenter(final float[] array, final float n, final float n2, final float n3) {
        return rotateAroundCenter(array, -n, n2, n3);
    }
    
    public static float[] revertScaleAroundCenter(final float[] array, final float n, final float n2, final float n3, final float n4) {
        return scaleAroundCenter(array, 1.0f / n, 1.0f / n2, n3, n4);
    }
    
    public static float[] rotateAndScaleAroundCenter(final float[] array, final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7) {
        rotateAroundCenter(array, n, n2, n3);
        return scaleAroundCenter(array, n4, n5, n6, n7);
    }
    
    public static float[] rotateAroundCenter(final float[] array, final float n, final float n2, final float n3) {
        if (n != 0.0f) {
            final float degToRad = degToRad(n);
            final float sin = FloatMath.sin(degToRad);
            final float cos = FloatMath.cos(degToRad);
            for (int i = -2 + array.length; i >= 0; i -= 2) {
                final float n4 = array[i];
                final float n5 = array[i + 1];
                array[i] = n2 + (cos * (n4 - n2) - sin * (n5 - n3));
                array[i + 1] = n3 + (sin * (n4 - n2) + cos * (n5 - n3));
            }
        }
        return array;
    }
    
    public static float[] scaleAroundCenter(final float[] array, final float n, final float n2, final float n3, final float n4) {
        if (n != 1.0f || n2 != 1.0f) {
            for (int i = -2 + array.length; i >= 0; i -= 2) {
                array[i] = n3 + n * (array[i] - n3);
                array[i + 1] = n4 + n2 * (array[i + 1] - n4);
            }
        }
        return array;
    }
    
    public static final int sum(final int[] array) {
        int n = 0;
        for (int i = -1 + array.length; i >= 0; --i) {
            n += array[i];
        }
        return n;
    }
    
    public float distance(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n3 - n;
        final float n6 = n4 - n2;
        return FloatMath.sqrt(n5 * n5 + n6 * n6);
    }
}
