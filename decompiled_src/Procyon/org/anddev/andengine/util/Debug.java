package org.anddev.andengine.util;

import org.anddev.andengine.util.constants.*;
import android.util.*;

public class Debug implements Constants
{
    private static DebugLevel DEBUGLEVEL;
    
    static {
        Debug.DEBUGLEVEL = DebugLevel.VERBOSE;
    }
    
    public static void d(final String s) {
        d(s, null);
    }
    
    public static void d(final String s, final Throwable t) {
        if (Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.DEBUG)) {
            Log.d("AndEngine", s, t);
        }
    }
    
    public static void e(final String s) {
        e(s, null);
    }
    
    public static void e(final String s, final Throwable t) {
        if (Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.ERROR)) {
            if (t != null) {
                Log.e("AndEngine", s, t);
                return;
            }
            Log.e("AndEngine", s, (Throwable)new Exception());
        }
    }
    
    public static void e(final Throwable t) {
        e("AndEngine", t);
    }
    
    public static DebugLevel getDebugLevel() {
        return Debug.DEBUGLEVEL;
    }
    
    public static void i(final String s) {
        i(s, null);
    }
    
    public static void i(final String s, final Throwable t) {
        if (Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.INFO)) {
            Log.i("AndEngine", s, t);
        }
    }
    
    public static void setDebugLevel(final DebugLevel debuglevel) {
        if (debuglevel == null) {
            throw new IllegalArgumentException("pDebugLevel must not be null!");
        }
        Debug.DEBUGLEVEL = debuglevel;
    }
    
    public static void v(final String s) {
        v(s, null);
    }
    
    public static void v(final String s, final Throwable t) {
        if (Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.VERBOSE)) {
            Log.v("AndEngine", s, t);
        }
    }
    
    public static void w(final String s) {
        w(s, null);
    }
    
    public static void w(final String s, final Throwable t) {
        if (Debug.DEBUGLEVEL.isSameOrLessThan(DebugLevel.WARNING)) {
            if (t != null) {
                Log.w("AndEngine", s, t);
                return;
            }
            Log.w("AndEngine", s, (Throwable)new Exception());
        }
    }
    
    public static void w(final Throwable t) {
        w("AndEngine", t);
    }
    
    public enum DebugLevel implements Comparable<DebugLevel>
    {
        public static DebugLevel ALL;
        
        DEBUG("DEBUG", 4), 
        ERROR("ERROR", 1), 
        INFO("INFO", 3), 
        NONE("NONE", 0), 
        VERBOSE("VERBOSE", 5), 
        WARNING("WARNING", 2);
        
        static {
            DebugLevel.ALL = DebugLevel.VERBOSE;
        }
        
        private boolean isSameOrLessThan(final DebugLevel debugLevel) {
            return this.compareTo(debugLevel) >= 0;
        }
    }
}
