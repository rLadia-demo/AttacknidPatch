package org.anddev.andengine.entity.particle;

import org.anddev.andengine.entity.*;
import java.util.*;
import org.anddev.andengine.entity.particle.modifier.*;
import org.anddev.andengine.opengl.vertex.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.entity.particle.emitter.*;
import org.anddev.andengine.util.*;
import android.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class ParticleSystem extends Entity
{
    private static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
    private static final int BLENDFUNCTION_SOURCE_DEFAULT = 1;
    private final float[] POSITION_OFFSET;
    private int mDestinationBlendFunction;
    private final int mMaxParticles;
    private final float mMaxRate;
    private final float mMinRate;
    private final IParticleEmitter mParticleEmitter;
    private int mParticleInitializerCount;
    private final ArrayList<IParticleInitializer> mParticleInitializers;
    private int mParticleModifierCount;
    private final ArrayList<IParticleModifier> mParticleModifiers;
    private final Particle[] mParticles;
    private int mParticlesAlive;
    private float mParticlesDueToSpawn;
    private boolean mParticlesSpawnEnabled;
    private RectangleVertexBuffer mSharedParticleVertexBuffer;
    private int mSourceBlendFunction;
    private final TextureRegion mTextureRegion;
    
    public ParticleSystem(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final int n7, final TextureRegion textureRegion) {
        this(new RectangleParticleEmitter(n + n3 * 0.5f, n2 + 0.5f * n4, n3, n4), n5, n6, n7, textureRegion);
    }
    
    public ParticleSystem(final IParticleEmitter mParticleEmitter, final float mMinRate, final float mMaxRate, final int mMaxParticles, final TextureRegion mTextureRegion) {
        super();
        this.POSITION_OFFSET = new float[2];
        this.mSourceBlendFunction = 1;
        this.mDestinationBlendFunction = 771;
        this.mParticleInitializers = new ArrayList<IParticleInitializer>();
        this.mParticleModifiers = new ArrayList<IParticleModifier>();
        this.mParticlesSpawnEnabled = true;
        this.mParticleEmitter = mParticleEmitter;
        this.mParticles = new Particle[mMaxParticles];
        this.mMinRate = mMinRate;
        this.mMaxRate = mMaxRate;
        this.mMaxParticles = mMaxParticles;
        this.mTextureRegion = mTextureRegion;
    }
    
    private float determineCurrentRate() {
        if (this.mMinRate == this.mMaxRate) {
            return this.mMinRate;
        }
        return MathUtils.RANDOM.nextFloat() * (this.mMaxRate - this.mMinRate) + this.mMinRate;
    }
    
    private void spawnParticle() {
        final Particle[] mParticles = this.mParticles;
        final int mParticlesAlive = this.mParticlesAlive;
        if (mParticlesAlive < this.mMaxParticles) {
            Particle particle = mParticles[mParticlesAlive];
            this.mParticleEmitter.getPositionOffset(this.POSITION_OFFSET);
            final float n = this.POSITION_OFFSET[0];
            final float n2 = this.POSITION_OFFSET[1];
            if (particle != null) {
                particle.reset();
                particle.setPosition(n, n2);
            }
            else {
                if (mParticlesAlive == 0) {
                    particle = new Particle(n, n2, this.mTextureRegion);
                    this.mSharedParticleVertexBuffer = particle.getVertexBuffer();
                }
                else {
                    particle = new Particle(n, n2, this.mTextureRegion, this.mSharedParticleVertexBuffer);
                }
                mParticles[mParticlesAlive] = particle;
            }
            particle.setBlendFunction(this.mSourceBlendFunction, this.mDestinationBlendFunction);
            final ArrayList<IParticleInitializer> mParticleInitializers = this.mParticleInitializers;
            for (int i = -1 + this.mParticleInitializerCount; i >= 0; --i) {
                mParticleInitializers.get(i).onInitializeParticle(particle);
            }
            final ArrayList<IParticleModifier> mParticleModifiers = this.mParticleModifiers;
            for (int j = -1 + this.mParticleModifierCount; j >= 0; --j) {
                mParticleModifiers.get(j).onInitializeParticle(particle);
            }
            ++this.mParticlesAlive;
        }
    }
    
    private void spawnParticles(final float n) {
        this.mParticlesDueToSpawn += n * this.determineCurrentRate();
        final int min = Math.min(this.mMaxParticles - this.mParticlesAlive, (int)FloatMath.floor(this.mParticlesDueToSpawn));
        this.mParticlesDueToSpawn -= min;
        for (int i = 0; i < min; ++i) {
            this.spawnParticle();
        }
    }
    
    public void addParticleInitializer(final IParticleInitializer particleInitializer) {
        this.mParticleInitializers.add(particleInitializer);
        ++this.mParticleInitializerCount;
    }
    
    public void addParticleModifier(final IParticleModifier particleModifier) {
        this.mParticleModifiers.add(particleModifier);
        ++this.mParticleModifierCount;
    }
    
    public IParticleEmitter getParticleEmitter() {
        return this.mParticleEmitter;
    }
    
    public boolean isParticlesSpawnEnabled() {
        return this.mParticlesSpawnEnabled;
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        final Particle[] mParticles = this.mParticles;
        for (int i = -1 + this.mParticlesAlive; i >= 0; --i) {
            mParticles[i].onDraw(gl10, camera);
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        if (this.mParticlesSpawnEnabled) {
            this.spawnParticles(n);
        }
        final Particle[] mParticles = this.mParticles;
        final ArrayList<IParticleModifier> mParticleModifiers = this.mParticleModifiers;
        final int n2 = -1 + this.mParticleModifierCount;
        for (int i = -1 + this.mParticlesAlive; i >= 0; --i) {
            final Particle particle = mParticles[i];
            for (int j = n2; j >= 0; --j) {
                mParticleModifiers.get(j).onUpdateParticle(particle);
            }
            particle.onUpdate(n);
            if (particle.mDead) {
                --this.mParticlesAlive;
                final int mParticlesAlive = this.mParticlesAlive;
                mParticles[i] = mParticles[mParticlesAlive];
                mParticles[mParticlesAlive] = particle;
            }
        }
    }
    
    public void removeParticleInitializer(final IParticleInitializer particleInitializer) {
        --this.mParticleInitializerCount;
        this.mParticleInitializers.remove(particleInitializer);
    }
    
    public void removeParticleModifier(final IParticleModifier particleModifier) {
        --this.mParticleModifierCount;
        this.mParticleModifiers.remove(particleModifier);
    }
    
    public void setBlendFunction(final int mSourceBlendFunction, final int mDestinationBlendFunction) {
        this.mSourceBlendFunction = mSourceBlendFunction;
        this.mDestinationBlendFunction = mDestinationBlendFunction;
    }
    
    public void setParticlesSpawnEnabled(final boolean mParticlesSpawnEnabled) {
        this.mParticlesSpawnEnabled = mParticlesSpawnEnabled;
    }
}
