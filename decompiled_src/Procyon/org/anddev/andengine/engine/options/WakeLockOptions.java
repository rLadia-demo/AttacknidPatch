package org.anddev.andengine.engine.options;

public enum WakeLockOptions
{
    FULL("FULL", 0, 26), 
    SCREEN_BRIGHT("SCREEN_BRIGHT", 1, 10), 
    SCREEN_DIM("SCREEN_DIM", 2, 6);
    
    private final int mFlag;
    
    private WakeLockOptions(final String s, final int n, final int mFlag) {
        this.mFlag = mFlag;
    }
    
    public int getFlag() {
        return this.mFlag;
    }
}
