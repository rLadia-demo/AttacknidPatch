.class public Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;
.super Lorg/anddev/andengine/entity/particle/emitter/BaseRectangleParticleEmitter;
.source "RectangleParticleEmitter.java"


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pCenterX"
    .parameter "pCenterY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/emitter/BaseRectangleParticleEmitter;-><init>(FFFF)V

    .line 27
    return-void
.end method


# virtual methods
.method public getPositionOffset([F)V
    .locals 4
    .parameter "pOffset"

    .prologue
    .line 39
    const/4 v0, 0x0

    iget v1, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mCenterX:F

    iget v2, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mWidthHalf:F

    sub-float/2addr v1, v2

    sget-object v2, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextFloat()F

    move-result v2

    iget v3, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mWidth:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    .line 40
    const/4 v0, 0x1

    iget v1, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mCenterY:F

    iget v2, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mHeightHalf:F

    sub-float/2addr v1, v2

    sget-object v2, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextFloat()F

    move-result v2

    iget v3, p0, Lorg/anddev/andengine/entity/particle/emitter/RectangleParticleEmitter;->mHeight:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    .line 41
    return-void
.end method
