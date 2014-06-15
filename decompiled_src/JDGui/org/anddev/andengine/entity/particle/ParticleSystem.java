package org.anddev.andengine.entity.particle;

import android.util.FloatMath;
import java.util.ArrayList;
import java.util.Random;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.particle.emitter.IParticleEmitter;
import org.anddev.andengine.entity.particle.emitter.RectangleParticleEmitter;
import org.anddev.andengine.entity.particle.modifier.IParticleInitializer;
import org.anddev.andengine.entity.particle.modifier.IParticleModifier;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.MathUtils;

public class ParticleSystem
  extends Entity
{
  private static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
  private static final int BLENDFUNCTION_SOURCE_DEFAULT = 1;
  private final float[] POSITION_OFFSET = new float[2];
  private int mDestinationBlendFunction = 771;
  private final int mMaxParticles;
  private final float mMaxRate;
  private final float mMinRate;
  private final IParticleEmitter mParticleEmitter;
  private int mParticleInitializerCount;
  private final ArrayList<IParticleInitializer> mParticleInitializers = new ArrayList();
  private int mParticleModifierCount;
  private final ArrayList<IParticleModifier> mParticleModifiers = new ArrayList();
  private final Particle[] mParticles;
  private int mParticlesAlive;
  private float mParticlesDueToSpawn;
  private boolean mParticlesSpawnEnabled = true;
  private RectangleVertexBuffer mSharedParticleVertexBuffer;
  private int mSourceBlendFunction = 1;
  private final TextureRegion mTextureRegion;
  
  @Deprecated
  public ParticleSystem(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, int paramInt, TextureRegion paramTextureRegion)
  {
    this(new RectangleParticleEmitter(paramFloat1 + paramFloat3 * 0.5F, paramFloat2 + 0.5F * paramFloat4, paramFloat3, paramFloat4), paramFloat5, paramFloat6, paramInt, paramTextureRegion);
  }
  
  public ParticleSystem(IParticleEmitter paramIParticleEmitter, float paramFloat1, float paramFloat2, int paramInt, TextureRegion paramTextureRegion)
  {
    this.mParticleEmitter = paramIParticleEmitter;
    this.mParticles = new Particle[paramInt];
    this.mMinRate = paramFloat1;
    this.mMaxRate = paramFloat2;
    this.mMaxParticles = paramInt;
    this.mTextureRegion = paramTextureRegion;
  }
  
  private float determineCurrentRate()
  {
    if (this.mMinRate == this.mMaxRate) {
      return this.mMinRate;
    }
    return MathUtils.RANDOM.nextFloat() * (this.mMaxRate - this.mMinRate) + this.mMinRate;
  }
  
  private void spawnParticle()
  {
    Particle[] arrayOfParticle = this.mParticles;
    int i = this.mParticlesAlive;
    Particle localParticle;
    float f1;
    float f2;
    ArrayList localArrayList1;
    int j;
    label93:
    ArrayList localArrayList2;
    if (i < this.mMaxParticles)
    {
      localParticle = arrayOfParticle[i];
      this.mParticleEmitter.getPositionOffset(this.POSITION_OFFSET);
      f1 = this.POSITION_OFFSET[0];
      f2 = this.POSITION_OFFSET[1];
      if (localParticle == null) {
        break label128;
      }
      localParticle.reset();
      localParticle.setPosition(f1, f2);
      localParticle.setBlendFunction(this.mSourceBlendFunction, this.mDestinationBlendFunction);
      localArrayList1 = this.mParticleInitializers;
      j = -1 + this.mParticleInitializerCount;
      if (j >= 0) {
        break label186;
      }
      localArrayList2 = this.mParticleModifiers;
    }
    for (int k = -1 + this.mParticleModifierCount;; k--)
    {
      if (k < 0)
      {
        this.mParticlesAlive = (1 + this.mParticlesAlive);
        return;
        label128:
        if (i == 0)
        {
          localParticle = new Particle(f1, f2, this.mTextureRegion);
          this.mSharedParticleVertexBuffer = localParticle.getVertexBuffer();
        }
        for (;;)
        {
          arrayOfParticle[i] = localParticle;
          break;
          localParticle = new Particle(f1, f2, this.mTextureRegion, this.mSharedParticleVertexBuffer);
        }
        label186:
        ((IParticleInitializer)localArrayList1.get(j)).onInitializeParticle(localParticle);
        j--;
        break label93;
      }
      ((IParticleModifier)localArrayList2.get(k)).onInitializeParticle(localParticle);
    }
  }
  
  private void spawnParticles(float paramFloat)
  {
    this.mParticlesDueToSpawn = (paramFloat * determineCurrentRate() + this.mParticlesDueToSpawn);
    int i = Math.min(this.mMaxParticles - this.mParticlesAlive, (int)FloatMath.floor(this.mParticlesDueToSpawn));
    this.mParticlesDueToSpawn -= i;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      spawnParticle();
    }
  }
  
  public void addParticleInitializer(IParticleInitializer paramIParticleInitializer)
  {
    this.mParticleInitializers.add(paramIParticleInitializer);
    this.mParticleInitializerCount = (1 + this.mParticleInitializerCount);
  }
  
  public void addParticleModifier(IParticleModifier paramIParticleModifier)
  {
    this.mParticleModifiers.add(paramIParticleModifier);
    this.mParticleModifierCount = (1 + this.mParticleModifierCount);
  }
  
  public IParticleEmitter getParticleEmitter()
  {
    return this.mParticleEmitter;
  }
  
  public boolean isParticlesSpawnEnabled()
  {
    return this.mParticlesSpawnEnabled;
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    Particle[] arrayOfParticle = this.mParticles;
    for (int i = -1 + this.mParticlesAlive;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfParticle[i].onDraw(paramGL10, paramCamera);
    }
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    if (this.mParticlesSpawnEnabled) {
      spawnParticles(paramFloat);
    }
    Particle[] arrayOfParticle = this.mParticles;
    ArrayList localArrayList = this.mParticleModifiers;
    int i = -1 + this.mParticleModifierCount;
    int j = -1 + this.mParticlesAlive;
    if (j < 0) {
      return;
    }
    Particle localParticle = arrayOfParticle[j];
    for (int k = i;; k--)
    {
      if (k < 0)
      {
        localParticle.onUpdate(paramFloat);
        if (localParticle.mDead)
        {
          this.mParticlesAlive = (-1 + this.mParticlesAlive);
          int m = this.mParticlesAlive;
          arrayOfParticle[j] = arrayOfParticle[m];
          arrayOfParticle[m] = localParticle;
        }
        j--;
        break;
      }
      ((IParticleModifier)localArrayList.get(k)).onUpdateParticle(localParticle);
    }
  }
  
  public void removeParticleInitializer(IParticleInitializer paramIParticleInitializer)
  {
    this.mParticleInitializerCount = (-1 + this.mParticleInitializerCount);
    this.mParticleInitializers.remove(paramIParticleInitializer);
  }
  
  public void removeParticleModifier(IParticleModifier paramIParticleModifier)
  {
    this.mParticleModifierCount = (-1 + this.mParticleModifierCount);
    this.mParticleModifiers.remove(paramIParticleModifier);
  }
  
  public void setBlendFunction(int paramInt1, int paramInt2)
  {
    this.mSourceBlendFunction = paramInt1;
    this.mDestinationBlendFunction = paramInt2;
  }
  
  public void setParticlesSpawnEnabled(boolean paramBoolean)
  {
    this.mParticlesSpawnEnabled = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.ParticleSystem
 * JD-Core Version:    0.7.0.1
 */