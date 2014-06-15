package org.anddev.andengine.sensor;

public enum SensorDelay
{
    FASTEST("FASTEST", 3, 0), 
    GAME("GAME", 2, 1), 
    NORMAL("NORMAL", 0, 3), 
    UI("UI", 1, 2);
    
    private final int mDelay;
    
    private SensorDelay(final String s, final int n, final int mDelay) {
        this.mDelay = mDelay;
    }
    
    public int getDelay() {
        return this.mDelay;
    }
}
