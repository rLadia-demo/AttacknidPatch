.class public Lorg/anddev/andengine/entity/particle/ParticleSystem;
.super Lorg/anddev/andengine/entity/Entity;
.source "ParticleSystem.java"


# static fields
.field private static final BLENDFUNCTION_DESTINATION_DEFAULT:I = 0x303

.field private static final BLENDFUNCTION_SOURCE_DEFAULT:I = 0x1


# instance fields
.field private final POSITION_OFFSET:[F

.field private mDestinationBlendFunction:I

.field private final mMaxParticles:I

.field private final mMaxRate:F

.field private final mMinRate:F

.field private final mParticleEmitter:Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;

.field private mParticleInitializerCount:I

.field private final mParticleInitializers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;",
            ">;"
        }
    .end annotation
.end field

.field private mParticleModifierCount:I

.field private final mParticleModifiers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;",
            ">;"
        }
    .end annotation
.end field

.field private final mParticles:[Lorg/anddev/andengine/entity/particle/Particle;

.field private mParticlesAlive:I

.field private mParticlesDueToSpawn:F

.field private mParticlesSpawnEnabled:Z

.field private mSharedParticleVertexBuffer:Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

.field private mSourceBlendFunction:I

.field private final mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;


# direct methods
.method public constructor <init>(FFFFFFILorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 6
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pMinRate"
    .parameter "pMaxRate"
    .parameter "pMaxParticles"
    .parameter "pTextureRegion"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/high16 v2, 0x3f00

    .line 75
    new-instance v1, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;

    mul-float v0, p3, v2

    add-float/2addr v0, p1

    mul-float/2addr v2, p4

    add-float/2addr v2, p2

    invoke-direct {v1, v0, v2, p3, p4}, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;-><init>(FFFF)V

    move-object v0, p0

    move v2, p5

    move v3, p6

    move v4, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/particle/ParticleSystem;-><init>(Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;FFILorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;FFILorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 2
    .parameter "pParticleEmitter"
    .parameter "pMinRate"
    .parameter "pMaxRate"
    .parameter "pMaxParticles"
    .parameter "pTextureRegion"

    .prologue
    const/4 v1, 0x1

    .line 78
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 34
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->POSITION_OFFSET:[F

    .line 44
    iput v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mSourceBlendFunction:I

    .line 45
    const/16 v0, 0x303

    iput v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mDestinationBlendFunction:I

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializers:Ljava/util/ArrayList;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifiers:Ljava/util/ArrayList;

    .line 55
    iput-boolean v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesSpawnEnabled:Z

    .line 79
    iput-object p1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleEmitter:Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;

    .line 80
    new-array v0, p4, [Lorg/anddev/andengine/entity/particle/Particle;

    iput-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticles:[Lorg/anddev/andengine/entity/particle/Particle;

    .line 81
    iput p2, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMinRate:F

    .line 82
    iput p3, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxRate:F

    .line 83
    iput p4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxParticles:I

    .line 84
    iput-object p5, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 85
    return-void
.end method

.method private determineCurrentRate()F
    .locals 3

    .prologue
    .line 233
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMinRate:F

    iget v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxRate:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 234
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMinRate:F

    .line 236
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxRate:F

    iget v2, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMinRate:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    iget v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMinRate:F

    add-float/2addr v0, v1

    goto :goto_0
.end method

.method private spawnParticle()V
    .locals 10

    .prologue
    .line 188
    iget-object v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticles:[Lorg/anddev/andengine/entity/particle/Particle;

    .line 190
    .local v4, particles:[Lorg/anddev/andengine/entity/particle/Particle;
    iget v5, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    .line 191
    .local v5, particlesAlive:I
    iget v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxParticles:I

    if-ge v5, v8, :cond_0

    .line 192
    aget-object v1, v4, v5

    .line 195
    .local v1, particle:Lorg/anddev/andengine/entity/particle/Particle;
    iget-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleEmitter:Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;

    iget-object v9, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->POSITION_OFFSET:[F

    invoke-interface {v8, v9}, Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;->getPositionOffset([F)V

    .line 197
    iget-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->POSITION_OFFSET:[F

    const/4 v9, 0x0

    aget v6, v8, v9

    .line 198
    .local v6, x:F
    iget-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->POSITION_OFFSET:[F

    const/4 v9, 0x1

    aget v7, v8, v9

    .line 200
    .local v7, y:F
    if-eqz v1, :cond_1

    .line 201
    invoke-virtual {v1}, Lorg/anddev/andengine/entity/particle/Particle;->reset()V

    .line 202
    invoke-virtual {v1, v6, v7}, Lorg/anddev/andengine/entity/particle/Particle;->setPosition(FF)V

    .line 213
    :goto_0
    iget v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mSourceBlendFunction:I

    iget v9, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mDestinationBlendFunction:I

    invoke-virtual {v1, v8, v9}, Lorg/anddev/andengine/entity/particle/Particle;->setBlendFunction(II)V

    .line 217
    iget-object v2, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializers:Ljava/util/ArrayList;

    .line 218
    .local v2, particleInitializers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;>;"
    iget v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializerCount:I

    add-int/lit8 v0, v8, -0x1

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_3

    .line 222
    iget-object v3, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifiers:Ljava/util/ArrayList;

    .line 223
    .local v3, particleModifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;>;"
    iget v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    add-int/lit8 v0, v8, -0x1

    :goto_2
    if-gez v0, :cond_4

    .line 228
    iget v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    .line 230
    .end local v0           #i:I
    .end local v1           #particle:Lorg/anddev/andengine/entity/particle/Particle;
    .end local v2           #particleInitializers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;>;"
    .end local v3           #particleModifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;>;"
    .end local v6           #x:F
    .end local v7           #y:F
    :cond_0
    return-void

    .line 204
    .restart local v1       #particle:Lorg/anddev/andengine/entity/particle/Particle;
    .restart local v6       #x:F
    .restart local v7       #y:F
    :cond_1
    if-nez v5, :cond_2

    .line 206
    new-instance v1, Lorg/anddev/andengine/entity/particle/Particle;

    .end local v1           #particle:Lorg/anddev/andengine/entity/particle/Particle;
    iget-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-direct {v1, v6, v7, v8}, Lorg/anddev/andengine/entity/particle/Particle;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    .line 207
    .restart local v1       #particle:Lorg/anddev/andengine/entity/particle/Particle;
    invoke-virtual {v1}, Lorg/anddev/andengine/entity/particle/Particle;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

    move-result-object v8

    iput-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mSharedParticleVertexBuffer:Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

    .line 211
    :goto_3
    aput-object v1, v4, v5

    goto :goto_0

    .line 209
    :cond_2
    new-instance v1, Lorg/anddev/andengine/entity/particle/Particle;

    .end local v1           #particle:Lorg/anddev/andengine/entity/particle/Particle;
    iget-object v8, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    iget-object v9, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mSharedParticleVertexBuffer:Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;

    invoke-direct {v1, v6, v7, v8, v9}, Lorg/anddev/andengine/entity/particle/Particle;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .restart local v1       #particle:Lorg/anddev/andengine/entity/particle/Particle;
    goto :goto_3

    .line 219
    .restart local v0       #i:I
    .restart local v2       #particleInitializers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;>;"
    :cond_3
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;

    invoke-interface {v8, v1}, Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;->onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;)V

    .line 218
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 224
    .restart local v3       #particleModifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;>;"
    :cond_4
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;

    invoke-interface {v8, v1}, Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;->onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;)V

    .line 223
    add-int/lit8 v0, v0, -0x1

    goto :goto_2
.end method

.method private spawnParticles(F)V
    .locals 6
    .parameter "pSecondsElapsed"

    .prologue
    .line 174
    invoke-direct {p0}, Lorg/anddev/andengine/entity/particle/ParticleSystem;->determineCurrentRate()F

    move-result v0

    .line 175
    .local v0, currentRate:F
    mul-float v2, v0, p1

    .line 177
    .local v2, newParticlesThisFrame:F
    iget v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesDueToSpawn:F

    add-float/2addr v4, v2

    iput v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesDueToSpawn:F

    .line 179
    iget v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mMaxParticles:I

    iget v5, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    sub-int/2addr v4, v5

    iget v5, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesDueToSpawn:F

    invoke-static {v5}, Landroid/util/FloatMath;->floor(F)F

    move-result v5

    float-to-int v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 180
    .local v3, particlesToSpawnThisFrame:I
    iget v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesDueToSpawn:F

    int-to-float v5, v3

    sub-float/2addr v4, v5

    iput v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesDueToSpawn:F

    .line 182
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v3, :cond_0

    .line 185
    return-void

    .line 183
    :cond_0
    invoke-direct {p0}, Lorg/anddev/andengine/entity/particle/ParticleSystem;->spawnParticle()V

    .line 182
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addParticleInitializer(Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;)V
    .locals 1
    .parameter "pParticleInitializer"

    .prologue
    .line 164
    iget-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializerCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializerCount:I

    .line 166
    return-void
.end method

.method public addParticleModifier(Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;)V
    .locals 1
    .parameter "pParticleModifier"

    .prologue
    .line 154
    iget-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifiers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    .line 156
    return-void
.end method

.method public getParticleEmitter()Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleEmitter:Lorg/anddev/andengine/entity/particle/emitter/IParticleEmitter;

    return-object v0
.end method

.method public isParticlesSpawnEnabled()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesSpawnEnabled:Z

    return v0
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 3
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 114
    iget-object v1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticles:[Lorg/anddev/andengine/entity/particle/Particle;

    .line 115
    .local v1, particles:[Lorg/anddev/andengine/entity/particle/Particle;
    iget v2, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 118
    return-void

    .line 116
    :cond_0
    aget-object v2, v1, v0

    invoke-virtual {v2, p1, p2}, Lorg/anddev/andengine/entity/particle/Particle;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 115
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method protected onManagedUpdate(F)V
    .locals 8
    .parameter "pSecondsElapsed"

    .prologue
    .line 122
    iget-boolean v7, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesSpawnEnabled:Z

    if-eqz v7, :cond_0

    .line 123
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/particle/ParticleSystem;->spawnParticles(F)V

    .line 126
    :cond_0
    iget-object v5, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticles:[Lorg/anddev/andengine/entity/particle/Particle;

    .line 128
    .local v5, particles:[Lorg/anddev/andengine/entity/particle/Particle;
    iget-object v4, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifiers:Ljava/util/ArrayList;

    .line 129
    .local v4, particleModifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;>;"
    iget v7, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    add-int/lit8 v3, v7, -0x1

    .line 131
    .local v3, particleModifierCountMinusOne:I
    iget v7, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    add-int/lit8 v0, v7, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 147
    return-void

    .line 132
    :cond_1
    aget-object v2, v5, v0

    .line 135
    .local v2, particle:Lorg/anddev/andengine/entity/particle/Particle;
    move v1, v3

    .local v1, j:I
    :goto_1
    if-gez v1, :cond_3

    .line 139
    invoke-virtual {v2, p1}, Lorg/anddev/andengine/entity/particle/Particle;->onUpdate(F)V

    .line 140
    iget-boolean v7, v2, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    if-eqz v7, :cond_2

    .line 141
    iget v7, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    .line 142
    iget v6, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesAlive:I

    .line 143
    .local v6, particlesAlive:I
    aget-object v7, v5, v6

    aput-object v7, v5, v0

    .line 144
    aput-object v2, v5, v6

    .line 131
    .end local v6           #particlesAlive:I
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 136
    :cond_3
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;

    invoke-interface {v7, v2}, Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;->onUpdateParticle(Lorg/anddev/andengine/entity/particle/Particle;)V

    .line 135
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method public removeParticleInitializer(Lorg/anddev/andengine/entity/particle/modifier/IParticleInitializer;)V
    .locals 1
    .parameter "pParticleInitializer"

    .prologue
    .line 169
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializerCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializerCount:I

    .line 170
    iget-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleInitializers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 171
    return-void
.end method

.method public removeParticleModifier(Lorg/anddev/andengine/entity/particle/modifier/IParticleModifier;)V
    .locals 1
    .parameter "pParticleModifier"

    .prologue
    .line 159
    iget v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifierCount:I

    .line 160
    iget-object v0, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticleModifiers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 161
    return-void
.end method

.method public setBlendFunction(II)V
    .locals 0
    .parameter "pSourceBlendFunction"
    .parameter "pDestinationBlendFunction"

    .prologue
    .line 100
    iput p1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mSourceBlendFunction:I

    .line 101
    iput p2, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mDestinationBlendFunction:I

    .line 102
    return-void
.end method

.method public setParticlesSpawnEnabled(Z)V
    .locals 0
    .parameter "pParticlesSpawnEnabled"

    .prologue
    .line 96
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/particle/ParticleSystem;->mParticlesSpawnEnabled:Z

    .line 97
    return-void
.end method
