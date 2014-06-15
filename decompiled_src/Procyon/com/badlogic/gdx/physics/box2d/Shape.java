package com.badlogic.gdx.physics.box2d;

public abstract class Shape
{
    protected long addr;
    
    private native void jniDispose(final long p0);
    
    private native float jniGetRadius(final long p0);
    
    protected static native int jniGetType(final long p0);
    
    private native void jniSetRadius(final long p0, final float p1);
    
    public void dispose() {
        this.jniDispose(this.addr);
    }
    
    public float getRadius() {
        return this.jniGetRadius(this.addr);
    }
    
    public abstract Type getType();
    
    public void setRadius(final float n) {
        this.jniSetRadius(this.addr, n);
    }
    
    public enum Type
    {
        Circle("Circle", 0), 
        Polygon("Polygon", 1);
    }
}
