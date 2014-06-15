/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.particle;

import android.util.FloatMath;
import java.util.ArrayList;
import java.util.Random;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.emitter.IParticleEmitter;
import org.anddev.andengine.entity.particle.emitter.RectangleParticleEmitter;
import org.anddev.andengine.entity.particle.modifier.IParticleInitializer;
import org.anddev.andengine.entity.particle.modifier.IParticleModifier;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.MathUtils;

public class ParticleSystem
extends Entity {
    private static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
    private static final int BLENDFUNCTION_SOURCE_DEFAULT = 1;
    private final float[] POSITION_OFFSET = new float[2];
    private int mDestinationBlendFunction = 771;
    private final int mMaxParticles;
    private final float mMaxRate;
    private final float mMinRate;
    private final IParticleEmitter mParticleEmitter;
    private int mParticleInitializerCount;
    private final ArrayList<IParticleInitializer> mParticleInitializers = new ArrayList<IParticleInitializer>();
    private int mParticleModifierCount;
    private final ArrayList<IParticleModifier> mParticleModifiers = new ArrayList<IParticleModifier>();
    private final Particle[] mParticles;
    private int mParticlesAlive;
    private float mParticlesDueToSpawn;
    private boolean mParticlesSpawnEnabled = true;
    private RectangleVertexBuffer mSharedParticleVertexBuffer;
    private int mSourceBlendFunction = 1;
    private final TextureRegion mTextureRegion;

    @Deprecated
    public ParticleSystem(float f, float f2, float f3, float f4, float f5, float f6, int n, TextureRegion textureRegion) {
        this(new RectangleParticleEmitter(f + f3 * 0.5f, f2 + 0.5f * f4, f3, f4), f5, f6, n, textureRegion);
    }

    public ParticleSystem(IParticleEmitter iParticleEmitter, float f, float f2, int n, TextureRegion textureRegion) {
        this.mParticleEmitter = iParticleEmitter;
        this.mParticles = new Particle[n];
        this.mMinRate = f;
        this.mMaxRate = f2;
        this.mMaxParticles = n;
        this.mTextureRegion = textureRegion;
    }

    private float determineCurrentRate() {
        if (this.mMinRate != this.mMaxRate) return MathUtils.RANDOM.nextFloat() * (this.mMaxRate - this.mMinRate) + this.mMinRate;
        return this.mMinRate;
    }

    /*
     * Enabled aggressive block sorting
     */
    private void spawnParticle() {
        Particle[] arrparticle = this.mParticles;
        int n = this.mParticlesAlive;
        if (n >= this.mMaxParticles) return;
        Particle particle = arrparticle[n];
        this.mParticleEmitter.getPositionOffset(this.POSITION_OFFSET);
        float f = this.POSITION_OFFSET[0];
        float f2 = this.POSITION_OFFSET[1];
        if (particle != null) {
            particle.reset();
            particle.setPosition(f, f2);
        } else {
            if (n == 0) {
                particle = new Particle(f, f2, this.mTextureRegion);
                this.mSharedParticleVertexBuffer = particle.getVertexBuffer();
            } else {
                particle = new Particle(f, f2, this.mTextureRegion, this.mSharedParticleVertexBuffer);
            }
            arrparticle[n] = particle;
        }
        particle.setBlendFunction(this.mSourceBlendFunction, this.mDestinationBlendFunction);
        ArrayList<IParticleInitializer> arrayList = this.mParticleInitializers;
        int n2 = -1 + this.mParticleInitializerCount;
        do {
            if (n2 < 0) break;
            arrayList.get(n2).onInitializeParticle(particle);
            --n2;
        } while (true);
        ArrayList<IParticleModifier> arrayList2 = this.mParticleModifiers;
        for (int i = -1 + this.mParticleModifierCount; i >= 0; --i) {
            arrayList2.get(i).onInitializeParticle(particle);
        }
        this.mParticlesAlive = 1 + this.mParticlesAlive;
    }

    private void spawnParticles(float f) {
        this.mParticlesDueToSpawn = f * this.determineCurrentRate() + this.mParticlesDueToSpawn;
        int n = Math.min(this.mMaxParticles - this.mParticlesAlive, (int)FloatMath.floor((float)this.mParticlesDueToSpawn));
        this.mParticlesDueToSpawn-=(float)n;
        int n2 = 0;
        while (n2 < n) {
            this.spawnParticle();
            ++n2;
        }
        return;
    }

    public void addParticleInitializer(IParticleInitializer iParticleInitializer) {
        this.mParticleInitializers.add(iParticleInitializer);
        this.mParticleInitializerCount = 1 + this.mParticleInitializerCount;
    }

    public void addParticleModifier(IParticleModifier iParticleModifier) {
        this.mParticleModifiers.add(iParticleModifier);
        this.mParticleModifierCount = 1 + this.mParticleModifierCount;
    }

    public IParticleEmitter getParticleEmitter() {
        return this.mParticleEmitter;
    }

    public boolean isParticlesSpawnEnabled() {
        return this.mParticlesSpawnEnabled;
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        Particle[] arrparticle = this.mParticles;
        int n = -1 + this.mParticlesAlive;
        while (n >= 0) {
            arrparticle[n].onDraw(gL10, camera);
            --n;
        }
        return;
    }

    @Override
    protected void onManagedUpdate(float f) {
        if (this.mParticlesSpawnEnabled) {
            this.spawnParticles(f);
        }
        Particle[] arrparticle = this.mParticles;
        ArrayList<IParticleModifier> arrayList = this.mParticleModifiers;
        int n = -1 + this.mParticleModifierCount;
        int n2 = -1 + this.mParticlesAlive;
        block0 : while (n2 >= 0) {
            Particle particle = arrparticle[n2];
            int n3 = n;
            do {
                if (n3 < 0) {
                    particle.onUpdate(f);
                    if (particle.mDead) {
                        int n4 = this.mParticlesAlive = -1 + this.mParticlesAlive;
                        arrparticle[n2] = arrparticle[n4];
                        arrparticle[n4] = particle;
                    }
                    --n2;
                    continue block0;
                }
                arrayList.get(n3).onUpdateParticle(particle);
                --n3;
            } while (true);
            break;
        }
        return;
    }

    public void removeParticleInitializer(IParticleInitializer iParticleInitializer) {
        this.mParticleInitializerCount = -1 + this.mParticleInitializerCount;
        this.mParticleInitializers.remove(iParticleInitializer);
    }

    public void removeParticleModifier(IParticleModifier iParticleModifier) {
        this.mParticleModifierCount = -1 + this.mParticleModifierCount;
        this.mParticleModifiers.remove(iParticleModifier);
    }

    public void setBlendFunction(int n, int n2) {
        this.mSourceBlendFunction = n;
        this.mDestinationBlendFunction = n2;
    }

    public void setParticlesSpawnEnabled(boolean bl) {
        this.mParticlesSpawnEnabled = bl;
    }
}

