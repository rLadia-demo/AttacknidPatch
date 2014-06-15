package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class FixedStepPhysicsWorld extends PhysicsWorld
{
    public static final int STEPSPERSECOND_DEFAULT = 60;
    private final int mMaximumStepsPerUpdate;
    private float mSecondsElapsedAccumulator;
    private final float mTimeStep;
    
    public FixedStepPhysicsWorld(final int n, final int mMaximumStepsPerUpdate, final Vector2 vector2, final boolean b) {
        super(vector2, b);
        this.mTimeStep = 1.0f / n;
        this.mMaximumStepsPerUpdate = mMaximumStepsPerUpdate;
    }
    
    public FixedStepPhysicsWorld(final int n, final int mMaximumStepsPerUpdate, final Vector2 vector2, final boolean b, final int n2, final int n3) {
        super(vector2, b, n2, n3);
        this.mTimeStep = 1.0f / n;
        this.mMaximumStepsPerUpdate = mMaximumStepsPerUpdate;
    }
    
    public FixedStepPhysicsWorld(final int n, final Vector2 vector2, final boolean b) {
        this(n, Integer.MAX_VALUE, vector2, b);
    }
    
    public FixedStepPhysicsWorld(final int n, final Vector2 vector2, final boolean b, final int n2, final int n3) {
        this(n, Integer.MAX_VALUE, vector2, b, n2, n3);
    }
    
    @Override
    public void onUpdate(final float n) {
        this.mRunnableHandler.onUpdate(n);
        this.mSecondsElapsedAccumulator += n;
        final int mVelocityIterations = this.mVelocityIterations;
        final int mPositionIterations = this.mPositionIterations;
        final World mWorld = this.mWorld;
        final float mTimeStep = this.mTimeStep;
        for (int mMaximumStepsPerUpdate = this.mMaximumStepsPerUpdate; this.mSecondsElapsedAccumulator >= mTimeStep && mMaximumStepsPerUpdate > 0; --mMaximumStepsPerUpdate) {
            mWorld.step(mTimeStep, mVelocityIterations, mPositionIterations);
            this.mSecondsElapsedAccumulator -= mTimeStep;
        }
        this.mPhysicsConnectorManager.onUpdate(n);
    }
}
