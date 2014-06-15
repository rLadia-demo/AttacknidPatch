/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;
import org.anddev.andengine.extension.physics.box2d.PhysicsConnectorManager;
import org.anddev.andengine.extension.physics.box2d.PhysicsWorld;

public class FixedStepPhysicsWorld
extends PhysicsWorld {
    public static final int STEPSPERSECOND_DEFAULT = 60;
    private final int mMaximumStepsPerUpdate;
    private float mSecondsElapsedAccumulator;
    private final float mTimeStep;

    public FixedStepPhysicsWorld(int n, int n2, Vector2 vector2, boolean bl) {
        super(vector2, bl);
        this.mTimeStep = 1.0f / (float)n;
        this.mMaximumStepsPerUpdate = n2;
    }

    public FixedStepPhysicsWorld(int n, int n2, Vector2 vector2, boolean bl, int n3, int n4) {
        super(vector2, bl, n3, n4);
        this.mTimeStep = 1.0f / (float)n;
        this.mMaximumStepsPerUpdate = n2;
    }

    public FixedStepPhysicsWorld(int n, Vector2 vector2, boolean bl) {
        this(n, Integer.MAX_VALUE, vector2, bl);
    }

    public FixedStepPhysicsWorld(int n, Vector2 vector2, boolean bl, int n2, int n3) {
        this(n, Integer.MAX_VALUE, vector2, bl, n2, n3);
    }

    @Override
    public void onUpdate(float f) {
        this.mRunnableHandler.onUpdate(f);
        this.mSecondsElapsedAccumulator = f + this.mSecondsElapsedAccumulator;
        int n = this.mVelocityIterations;
        int n2 = this.mPositionIterations;
        World world = this.mWorld;
        float f2 = this.mTimeStep;
        int n3 = this.mMaximumStepsPerUpdate;
        do {
            if (this.mSecondsElapsedAccumulator < f2 || n3 <= 0) {
                this.mPhysicsConnectorManager.onUpdate(f);
                return;
            }
            world.step(f2, n, n2);
            this.mSecondsElapsedAccumulator-=f2;
            --n3;
        } while (true);
    }
}

