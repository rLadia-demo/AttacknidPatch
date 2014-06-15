/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.physics.box2d.WorldManifold;
import com.badlogic.gdx.utils.LongHashMap;

public class Contact {
    protected long addr;
    private final float[] tmp = new float[6];
    protected World world;
    protected final WorldManifold worldManifold = new WorldManifold();

    protected Contact(World world, long l) {
        this.addr = l;
        this.world = world;
    }

    private native long jniGetFixtureA(long var1);

    private native long jniGetFixtureB(long var1);

    private native int jniGetWorldManifold(long var1, float[] var3);

    private native boolean jniIsEnabled(long var1);

    private native boolean jniIsTouching(long var1);

    private native void jniSetEnabled(long var1, boolean var3);

    public WorldManifold GetWorldManifold() {
        int n;
        this.worldManifold.numContactPoints = n = this.jniGetWorldManifold(this.addr, this.tmp);
        this.worldManifold.normal.set(this.tmp[0], this.tmp[1]);
        int n2 = 0;
        while (n2 < n) {
            Vector2 vector2 = this.worldManifold.points[n2];
            vector2.x = this.tmp[2 + n2 * 2];
            vector2.y = this.tmp[1 + 2 + n2 * 2];
            ++n2;
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

    public void setEnabled(boolean bl) {
        this.jniSetEnabled(this.addr, bl);
    }
}

