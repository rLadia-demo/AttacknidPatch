.class public abstract Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
.super Lorg/anddev/andengine/opengl/buffer/BufferObject;
.source "BaseTextureRegionBuffer.java"


# instance fields
.field private mFlippedHorizontal:Z

.field private mFlippedVertical:Z

.field protected final mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;I)V
    .locals 1
    .parameter "pBaseTextureRegion"
    .parameter "pDrawType"

    .prologue
    .line 32
    const/16 v0, 0x8

    invoke-direct {p0, v0, p2}, Lorg/anddev/andengine/opengl/buffer/BufferObject;-><init>(II)V

    .line 33
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    .line 34
    return-void
.end method


# virtual methods
.method public getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    return-object v0
.end method

.method protected abstract getX1()F
.end method

.method protected abstract getX2()F
.end method

.method protected abstract getY1()F
.end method

.method protected abstract getY2()F
.end method

.method public isFlippedHorizontal()Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedHorizontal:Z

    return v0
.end method

.method public isFlippedVertical()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedVertical:Z

    return v0
.end method

.method public setFlippedHorizontal(Z)V
    .locals 1
    .parameter "pFlippedHorizontal"

    .prologue
    .line 49
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedHorizontal:Z

    if-eq v0, p1, :cond_0

    .line 50
    iput-boolean p1, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedHorizontal:Z

    .line 51
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->update()V

    .line 53
    :cond_0
    return-void
.end method

.method public setFlippedVertical(Z)V
    .locals 1
    .parameter "pFlippedVertical"

    .prologue
    .line 60
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedVertical:Z

    if-eq v0, p1, :cond_0

    .line 61
    iput-boolean p1, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedVertical:Z

    .line 62
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->update()V

    .line 64
    :cond_0
    return-void
.end method

.method public declared-synchronized update()V
    .locals 9

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    .line 84
    .local v3, textureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    invoke-virtual {v3}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 86
    .local v2, texture:Lorg/anddev/andengine/opengl/texture/Texture;
    if-nez v2, :cond_0

    .line 157
    :goto_0
    monitor-exit p0

    return-void

    .line 90
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getX1()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v4

    .line 91
    .local v4, x1:I
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getY1()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    .line 92
    .local v6, y1:I
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getX2()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    .line 93
    .local v5, x2:I
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getY2()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    .line 95
    .local v7, y2:I
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mBufferData:[I

    .line 97
    .local v1, bufferData:[I
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedVertical:Z

    if-eqz v8, :cond_2

    .line 98
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedHorizontal:Z

    if-eqz v8, :cond_1

    .line 99
    const/4 v8, 0x0

    aput v5, v1, v8

    .line 100
    const/4 v8, 0x1

    aput v7, v1, v8

    .line 102
    const/4 v8, 0x2

    aput v5, v1, v8

    .line 103
    const/4 v8, 0x3

    aput v6, v1, v8

    .line 105
    const/4 v8, 0x4

    aput v4, v1, v8

    .line 106
    const/4 v8, 0x5

    aput v7, v1, v8

    .line 108
    const/4 v8, 0x6

    aput v4, v1, v8

    .line 109
    const/4 v8, 0x7

    aput v6, v1, v8

    .line 151
    :goto_1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v0

    .line 152
    .local v0, buffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 153
    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put([I)V

    .line 154
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 156
    invoke-super {p0}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->setHardwareBufferNeedsUpdate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 83
    .end local v0           #buffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    .end local v1           #bufferData:[I
    .end local v2           #texture:Lorg/anddev/andengine/opengl/texture/Texture;
    .end local v3           #textureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .end local v4           #x1:I
    .end local v5           #x2:I
    .end local v6           #y1:I
    .end local v7           #y2:I
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 111
    .restart local v1       #bufferData:[I
    .restart local v2       #texture:Lorg/anddev/andengine/opengl/texture/Texture;
    .restart local v3       #textureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .restart local v4       #x1:I
    .restart local v5       #x2:I
    .restart local v6       #y1:I
    .restart local v7       #y2:I
    :cond_1
    const/4 v8, 0x0

    :try_start_2
    aput v4, v1, v8

    .line 112
    const/4 v8, 0x1

    aput v7, v1, v8

    .line 114
    const/4 v8, 0x2

    aput v4, v1, v8

    .line 115
    const/4 v8, 0x3

    aput v6, v1, v8

    .line 117
    const/4 v8, 0x4

    aput v5, v1, v8

    .line 118
    const/4 v8, 0x5

    aput v7, v1, v8

    .line 120
    const/4 v8, 0x6

    aput v5, v1, v8

    .line 121
    const/4 v8, 0x7

    aput v6, v1, v8

    goto :goto_1

    .line 124
    :cond_2
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->mFlippedHorizontal:Z

    if-eqz v8, :cond_3

    .line 125
    const/4 v8, 0x0

    aput v5, v1, v8

    .line 126
    const/4 v8, 0x1

    aput v6, v1, v8

    .line 128
    const/4 v8, 0x2

    aput v5, v1, v8

    .line 129
    const/4 v8, 0x3

    aput v7, v1, v8

    .line 131
    const/4 v8, 0x4

    aput v4, v1, v8

    .line 132
    const/4 v8, 0x5

    aput v6, v1, v8

    .line 134
    const/4 v8, 0x6

    aput v4, v1, v8

    .line 135
    const/4 v8, 0x7

    aput v7, v1, v8

    goto :goto_1

    .line 137
    :cond_3
    const/4 v8, 0x0

    aput v4, v1, v8

    .line 138
    const/4 v8, 0x1

    aput v6, v1, v8

    .line 140
    const/4 v8, 0x2

    aput v4, v1, v8

    .line 141
    const/4 v8, 0x3

    aput v7, v1, v8

    .line 143
    const/4 v8, 0x4

    aput v5, v1, v8

    .line 144
    const/4 v8, 0x5

    aput v6, v1, v8

    .line 146
    const/4 v8, 0x6

    aput v5, v1, v8

    .line 147
    const/4 v8, 0x7

    aput v7, v1, v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method
