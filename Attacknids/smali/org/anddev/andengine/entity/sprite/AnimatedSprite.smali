.class public Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
.super Lorg/anddev/andengine/entity/sprite/TiledSprite;
.source "AnimatedSprite.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/TimeConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;
    }
.end annotation


# static fields
.field private static final LOOP_CONTINUOUS:I = -0x1


# instance fields
.field private mAnimationDuration:J

.field private mAnimationListener:Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;

.field private mAnimationProgress:J

.field private mAnimationRunning:Z

.field private mFirstTileIndex:I

.field private mFrameCount:I

.field private mFrameEndsInNanoseconds:[J

.field private mInitialLoopCount:I

.field private mLoopCount:I


# direct methods
.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pTileWidth"
    .parameter "pTileHeight"
    .parameter "pTiledTextureRegion"

    .prologue
    .line 47
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/entity/sprite/TiledSprite;-><init>(FFFFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    .line 48
    return-void
.end method

.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pTileWidth"
    .parameter "pTileHeight"
    .parameter "pTiledTextureRegion"
    .parameter "pRectangleVertexBuffer"

    .prologue
    .line 55
    invoke-direct/range {p0 .. p6}, Lorg/anddev/andengine/entity/sprite/TiledSprite;-><init>(FFFFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pTiledTextureRegion"

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/sprite/TiledSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    .line 44
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pTiledTextureRegion"
    .parameter "pRectangleVertexBuffer"

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/sprite/TiledSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .line 52
    return-void
.end method

.method private calculateCurrentFrameIndex()I
    .locals 7

    .prologue
    .line 110
    iget-wide v0, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    .line 111
    .local v0, animationProgress:J
    iget-object v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameEndsInNanoseconds:[J

    .line 112
    .local v3, frameEnds:[J
    iget v2, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameCount:I

    .line 113
    .local v2, frameCount:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-lt v4, v2, :cond_1

    .line 119
    add-int/lit8 v4, v2, -0x1

    .end local v4           #i:I
    :cond_0
    return v4

    .line 114
    .restart local v4       #i:I
    :cond_1
    aget-wide v5, v3, v4

    cmp-long v5, v5, v0

    if-gtz v5, :cond_0

    .line 113
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method


# virtual methods
.method public animate(J)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurationEach"

    .prologue
    .line 123
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate(JZ)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate(JI)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurationEach"
    .parameter "pLoopCount"

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate(JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate(JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 2
    .parameter "pFrameDurationEach"
    .parameter "pLoopCount"
    .parameter "pAnimationListener"

    .prologue
    .line 139
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileCount()I

    move-result v1

    new-array v0, v1, [J

    .line 140
    .local v0, frameDurations:[J
    invoke-static {v0, p1, p2}, Ljava/util/Arrays;->fill([JJ)V

    .line 141
    invoke-virtual {p0, v0, p3, p4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v1

    return-object v1
.end method

.method public animate(JZ)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 2
    .parameter "pFrameDurationEach"
    .parameter "pLoop"

    .prologue
    .line 127
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate(JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public animate(JZLorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurationEach"
    .parameter "pLoop"
    .parameter "pAnimationListener"

    .prologue
    .line 135
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p0, p1, p2, v0, p4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate(JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public animate([J)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurations"

    .prologue
    .line 145
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JZ)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate([JI)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurations"
    .parameter "pLoopCount"

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate([JIII)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 6
    .parameter "pFrameDurations"
    .parameter "pFirstTileIndex"
    .parameter "pLastTileIndex"
    .parameter "pLoopCount"

    .prologue
    .line 169
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JIIILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate([JIIILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 7
    .parameter "pFrameDurations"
    .parameter "pFirstTileIndex"
    .parameter "pLastTileIndex"
    .parameter "pLoopCount"
    .parameter "pAnimationListener"

    .prologue
    const/4 v6, 0x1

    .line 180
    sub-int v4, p3, p2

    if-ge v4, v6, :cond_0

    .line 181
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "An animation needs at least two tiles to animate between."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 184
    :cond_0
    sub-int v4, p3, p2

    add-int/lit8 v0, v4, 0x1

    .line 185
    .local v0, frameCount:I
    array-length v4, p1

    if-eq v4, v0, :cond_1

    .line 186
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "pFrameDurations must have the same length as pFirstTileIndex to pLastTileIndex."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 188
    :cond_1
    iput v0, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameCount:I

    .line 190
    iput-object p5, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationListener:Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;

    .line 192
    iput p4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mInitialLoopCount:I

    .line 193
    iput p4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mLoopCount:I

    .line 194
    iput p2, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFirstTileIndex:I

    .line 197
    iget-object v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameEndsInNanoseconds:[J

    if-eqz v4, :cond_2

    iget v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameCount:I

    iget-object v5, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameEndsInNanoseconds:[J

    array-length v5, v5

    if-le v4, v5, :cond_3

    .line 198
    :cond_2
    iget v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameCount:I

    new-array v4, v4, [J

    iput-object v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameEndsInNanoseconds:[J

    .line 201
    :cond_3
    iget-object v1, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameEndsInNanoseconds:[J

    .line 202
    .local v1, frameEndsInNanoseconds:[J
    const-wide/32 v4, 0xf4240

    invoke-static {p1, v1, v4, v5}, Lorg/anddev/andengine/util/MathUtils;->arraySumInto([J[JJ)V

    .line 204
    iget v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFrameCount:I

    add-int/lit8 v4, v4, -0x1

    aget-wide v2, v1, v4

    .line 205
    .local v2, lastFrameEnd:J
    iput-wide v2, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationDuration:J

    .line 207
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    .line 208
    iput-boolean v6, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    .line 210
    return-object p0
.end method

.method public animate([JIIZ)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 6
    .parameter "pFrameDurations"
    .parameter "pFirstTileIndex"
    .parameter "pLastTileIndex"
    .parameter "pLoop"

    .prologue
    .line 165
    if-eqz p4, :cond_0

    const/4 v4, -0x1

    :goto_0
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JIIILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public animate([JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 6
    .parameter "pFrameDurations"
    .parameter "pLoopCount"
    .parameter "pAnimationListener"

    .prologue
    .line 161
    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->getTileCount()I

    move-result v0

    add-int/lit8 v3, v0, -0x1

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JIIILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0
.end method

.method public animate([JZ)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 2
    .parameter "pFrameDurations"
    .parameter "pLoop"

    .prologue
    .line 149
    if-eqz p2, :cond_0

    const/4 v0, -0x1

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public animate([JZLorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter "pFrameDurations"
    .parameter "pLoop"
    .parameter "pAnimationListener"

    .prologue
    .line 157
    if-eqz p2, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p0, p1, v0, p3}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->animate([JILorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isAnimationRunning()Z
    .locals 1

    .prologue
    .line 63
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    return v0
.end method

.method protected onManagedUpdate(F)V
    .locals 8
    .parameter "pSecondsElapsed"

    .prologue
    const/4 v7, -0x1

    .line 72
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/sprite/TiledSprite;->onManagedUpdate(F)V

    .line 73
    iget-boolean v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    if-eqz v3, :cond_2

    .line 74
    const v3, 0x4e6e6b28

    mul-float/2addr v3, p1

    float-to-long v1, v3

    .line 75
    .local v1, nanoSecondsElapsed:J
    iget-wide v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    .line 77
    iget-wide v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    iget-wide v5, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationDuration:J

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    .line 78
    iget-wide v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    iget-wide v5, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationDuration:J

    rem-long/2addr v3, v5

    iput-wide v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationProgress:J

    .line 79
    iget v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mInitialLoopCount:I

    if-eq v3, v7, :cond_0

    .line 80
    iget v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mLoopCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mLoopCount:I

    .line 84
    :cond_0
    iget v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mInitialLoopCount:I

    if-eq v3, v7, :cond_1

    iget v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mLoopCount:I

    if-ltz v3, :cond_3

    .line 85
    :cond_1
    invoke-direct {p0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->calculateCurrentFrameIndex()I

    move-result v0

    .line 86
    .local v0, currentFrameIndex:I
    iget v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mFirstTileIndex:I

    add-int/2addr v3, v0

    invoke-virtual {p0, v3}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 94
    .end local v0           #currentFrameIndex:I
    .end local v1           #nanoSecondsElapsed:J
    :cond_2
    :goto_0
    return-void

    .line 88
    .restart local v1       #nanoSecondsElapsed:J
    :cond_3
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    .line 89
    iget-object v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationListener:Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;

    if-eqz v3, :cond_2

    .line 90
    iget-object v3, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationListener:Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;

    invoke-interface {v3, p0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite$IAnimationListener;->onAnimationEnd(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V

    goto :goto_0
.end method

.method public stopAnimation()V
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    .line 102
    return-void
.end method

.method public stopAnimation(I)V
    .locals 1
    .parameter "pTileIndex"

    .prologue
    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->mAnimationRunning:Z

    .line 106
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 107
    return-void
.end method
