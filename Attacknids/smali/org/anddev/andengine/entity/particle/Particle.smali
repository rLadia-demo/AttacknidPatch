.class public Lorg/anddev/andengine/entity/particle/Particle;
.super Lorg/anddev/andengine/entity/sprite/Sprite;
.source "Particle.java"


# instance fields
.field mDead:Z

.field private mDeathTime:F

.field private mLifeTime:F


# direct methods
.method public constructor <init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .parameter "pTextureRegion"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    .line 21
    const/high16 v0, -0x4080

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    .line 31
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .parameter "pTextureRegion"
    .parameter "pRectangleVertexBuffer"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .line 21
    const/high16 v0, -0x4080

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    .line 36
    return-void
.end method


# virtual methods
.method public getDeathTime()F
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    return v0
.end method

.method public getLifeTime()F
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    return v0
.end method

.method public isDead()Z
    .locals 1

    .prologue
    .line 55
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    return v0
.end method

.method protected onManagedUpdate(F)V
    .locals 2
    .parameter "pSecondsElapsed"

    .prologue
    .line 68
    iget-boolean v1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    if-nez v1, :cond_0

    .line 69
    iget v1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    add-float/2addr v1, p1

    iput v1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    .line 70
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/sprite/Sprite;->onManagedUpdate(F)V

    .line 71
    iget v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    .line 72
    .local v0, deathTime:F
    const/high16 v1, -0x4080

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    iget v1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    cmpl-float v1, v1, v0

    if-lez v1, :cond_0

    .line 73
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/entity/particle/Particle;->setDead(Z)V

    .line 76
    .end local v0           #deathTime:F
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 84
    invoke-super {p0}, Lorg/anddev/andengine/entity/sprite/Sprite;->reset()V

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    .line 86
    const/high16 v0, -0x4080

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    .line 87
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/particle/Particle;->mLifeTime:F

    .line 88
    return-void
.end method

.method public setDead(Z)V
    .locals 0
    .parameter "pDead"

    .prologue
    .line 59
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDead:Z

    .line 60
    return-void
.end method

.method public setDeathTime(F)V
    .locals 0
    .parameter "pDeathTime"

    .prologue
    .line 51
    iput p1, p0, Lorg/anddev/andengine/entity/particle/Particle;->mDeathTime:F

    .line 52
    return-void
.end method
