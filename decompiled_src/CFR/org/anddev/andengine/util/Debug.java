/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.Log
 */
package org.anddev.andengine.util;

import android.util.Log;
import org.anddev.andengine.util.constants.Constants;

public class Debug
implements Constants {
    private static DebugLevel DEBUGLEVEL = DebugLevel.VERBOSE;

    public static void d(String string) {
        Debug.d(string, null);
    }

    public static void d(String string, Throwable throwable) {
        if (!Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.DEBUG)) return;
        Log.d((String)"AndEngine", (String)string, (Throwable)throwable);
    }

    public static void e(String string) {
        Debug.e(string, null);
    }

    public static void e(String string, Throwable throwable) {
        if (!Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.ERROR)) return;
        if (throwable == null) {
            Log.e((String)"AndEngine", (String)string, (Throwable)new Exception());
            return;
        }
        Log.e((String)"AndEngine", (String)string, (Throwable)throwable);
    }

    public static void e(Throwable throwable) {
        Debug.e("AndEngine", throwable);
    }

    public static DebugLevel getDebugLevel() {
        return Debug.DEBUGLEVEL;
    }

    public static void i(String string) {
        Debug.i(string, null);
    }

    public static void i(String string, Throwable throwable) {
        if (!Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.INFO)) return;
        Log.i((String)"AndEngine", (String)string, (Throwable)throwable);
    }

    public static void setDebugLevel(DebugLevel debugLevel) {
        if (debugLevel == null) {
            throw new IllegalArgumentException("pDebugLevel must not be null!");
        }
        Debug.DEBUGLEVEL = debugLevel;
    }

    public static void v(String string) {
        Debug.v(string, null);
    }

    public static void v(String string, Throwable throwable) {
        if (!Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.VERBOSE)) return;
        Log.v((String)"AndEngine", (String)string, (Throwable)throwable);
    }

    public static void w(String string) {
        Debug.w(string, null);
    }

    public static void w(String string, Throwable throwable) {
        if (!Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.WARNING)) return;
        if (throwable == null) {
            Log.w((String)"AndEngine", (String)string, (Throwable)new Exception());
            return;
        }
        Log.w((String)"AndEngine", (String)string, (Throwable)throwable);
    }

    public static void w(Throwable throwable) {
        Debug.w("AndEngine", throwable);
    }

    public static final class DebugLevel
    extends Enum<DebugLevel>
    implements Comparable<DebugLevel> {
        public static DebugLevel ALL;
        public static final /* enum */ DebugLevel DEBUG;
        private static final /* synthetic */ DebugLevel[] ENUM$VALUES;
        public static final /* enum */ DebugLevel ERROR;
        public static final /* enum */ DebugLevel INFO;
        public static final /* enum */ DebugLevel NONE;
        public static final /* enum */ DebugLevel VERBOSE;
        public static final /* enum */ DebugLevel WARNING;

        static {
            DebugLevel.NONE = new DebugLevel("NONE", 0);
            DebugLevel.ERROR = new DebugLevel("ERROR", 1);
            DebugLevel.WARNING = new DebugLevel("WARNING", 2);
            DebugLevel.INFO = new DebugLevel("INFO", 3);
            DebugLevel.DEBUG = new DebugLevel("DEBUG", 4);
            DebugLevel.VERBOSE = new DebugLevel("VERBOSE", 5);
            DebugLevel[] arrdebugLevel = new DebugLevel[]{DebugLevel.NONE, DebugLevel.ERROR, DebugLevel.WARNING, DebugLevel.INFO, DebugLevel.DEBUG, DebugLevel.VERBOSE};
            DebugLevel.ENUM$VALUES = arrdebugLevel;
            DebugLevel.ALL = DebugLevel.VERBOSE;
        }

        private DebugLevel(String string22, int string22) {
            super(string, n);
        }

        private boolean isSameOrLessThan(DebugLevel debugLevel) {
            if (this.compareTo((Enum)debugLevel) < 0) return false;
            return true;
        }

        public static DebugLevel valueOf(String string) {
            return (DebugLevel)Enum.valueOf(DebugLevel.class, string);
        }

        public static DebugLevel[] values() {
            DebugLevel[] arrdebugLevel = DebugLevel.ENUM$VALUES;
            int n = arrdebugLevel.length;
            DebugLevel[] arrdebugLevel2 = new DebugLevel[n];
            System.arraycopy(arrdebugLevel, 0, arrdebugLevel2, 0, n);
            return arrdebugLevel2;
        }
    }

}

