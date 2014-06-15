package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;

public class FixedStepPhysicsWorld
  extends PhysicsWorld
{
  public static final int STEPSPERSECOND_DEFAULT = 60;
  private final int mMaximumStepsPerUpdate;
  private float mSecondsElapsedAccumulator;
  private final float mTimeStep;
  
  public FixedStepPhysicsWorld(int paramInt1, int paramInt2, Vector2 paramVector2, boolean paramBoolean)
  {
    super(paramVector2, paramBoolean);
    this.mTimeStep = (1.0F / paramInt1);
    this.mMaximumStepsPerUpdate = paramInt2;
  }
  
  public FixedStepPhysicsWorld(int paramInt1, int paramInt2, Vector2 paramVector2, boolean paramBoolean, int paramInt3, int paramInt4)
  {
    super(paramVector2, paramBoolean, paramInt3, paramInt4);
    this.mTimeStep = (1.0F / paramInt1);
    this.mMaximumStepsPerUpdate = paramInt2;
  }
  
  public FixedStepPhysicsWorld(int paramInt, Vector2 paramVector2, boolean paramBoolean)
  {
    this(paramInt, 2147483647, paramVector2, paramBoolean);
  }
  
  public FixedStepPhysicsWorld(int paramInt1, Vector2 paramVector2, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    this(paramInt1, 2147483647, paramVector2, paramBoolean, paramInt2, paramInt3);
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mRunnableHandler.onUpdate(paramFloat);
    this.mSecondsElapsedAccumulator = (paramFloat + this.mSecondsElapsedAccumulator);
    int i = this.mVelocityIterations;
    int j = this.mPositionIterations;
    World localWorld = this.mWorld;
    float f = this.mTimeStep;
    for (int k = this.mMaximumStepsPerUpdate;; k--)
    {
      if ((this.mSecondsElapsedAccumulator < f) || (k <= 0))
      {
        this.mPhysicsConnectorManager.onUpdate(paramFloat);
        return;
      }
      localWorld.step(f, i, j);
      this.mSecondsElapsedAccumulator -= f;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.FixedStepPhysicsWorld
 * JD-Core Version:    0.7.0.1
 */