package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class Contact
{
    protected long addr;
    private final float[] tmp;
    protected World world;
    protected final WorldManifold worldManifold;
    
    protected Contact(final World world, final long addr) {
        super();
        this.worldManifold = new WorldManifold();
        this.tmp = new float[6];
        this.addr = addr;
        this.world = world;
    }
    
    private native long jniGetFixtureA(final long p0);
    
    private native long jniGetFixtureB(final long p0);
    
    private native int jniGetWorldManifold(final long p0, final float[] p1);
    
    private native boolean jniIsEnabled(final long p0);
    
    private native boolean jniIsTouching(final long p0);
    
    private native void jniSetEnabled(final long p0, final boolean p1);
    
    public WorldManifold GetWorldManifold() {
        final int jniGetWorldManifold = this.jniGetWorldManifold(this.addr, this.tmp);
        this.worldManifold.numContactPoints = jniGetWorldManifold;
        this.worldManifold.normal.set(this.tmp[0], this.tmp[1]);
        for (int i = 0; i < jniGetWorldManifold; ++i) {
            final Vector2 vector2 = this.worldManifold.points[i];
            vector2.x = this.tmp[2 + i * 2];
            vector2.y = this.tmp[1 + (2 + i * 2)];
        }
        return this.worldManifold;
    }
    
    public Fixture getFixtureA() {
        return this.world.fixtures.get(this.jniGetFixtureA(this.addr));
    }
    
    public Fixture getFixtureB() {
        return this.world.fixtures.get(this.jniGetFixtureB(this.addr));
    }
    
    public boolean isEnabled() {
        return this.jniIsEnabled(this.addr);
    }
    
    public boolean isTouching() {
        return this.jniIsTouching(this.addr);
    }
    
    public void setEnabled(final boolean b) {
        this.jniSetEnabled(this.addr, b);
    }
}
