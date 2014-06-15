package org.anddev.andengine.entity.particle.modifier;

public class GravityInitializer extends AccelerationInitializer
{
    public GravityInitializer() {
        super(0.0f, 9.80665f);
    }
}
