package com.badlogic.gdx.physics.box2d;

public interface ContactFilter
{
    boolean shouldCollide(Fixture p0, Fixture p1);
}
