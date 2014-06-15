.class public Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
.super Ljava/lang/Object;
.source "FastFloatBuffer.java"


# static fields
.field private static sWeakIntArray:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<[I>;"
        }
    .end annotation
.end field


# instance fields
.field public final mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mFloatBuffer:Ljava/nio/FloatBuffer;

.field private final mIntBuffer:Ljava/nio/IntBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    new-instance v0, Ljava/lang/ref/SoftReference;

    const/4 v1, 0x0

    new-array v1, v1, [I

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->sWeakIntArray:Ljava/lang/ref/SoftReference;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .parameter "pCapacity"

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    mul-int/lit8 v0, p1, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 49
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    .line 50
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    .line 51
    return-void
.end method

.method public static varargs convert([F)[I
    .locals 4
    .parameter "data"

    .prologue
    .line 134
    array-length v2, p0

    .line 135
    .local v2, length:I
    new-array v1, v2, [I

    .line 136
    .local v1, id:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v2, :cond_0

    .line 140
    return-object v1

    .line 137
    :cond_0
    aget v3, p0, v0

    invoke-static {v3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v3

    aput v3, v1, v0

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public capacity()I
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 202
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 203
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 204
    return-void
.end method

.method public flip()V
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 70
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->flip()Ljava/nio/Buffer;

    .line 72
    return-void
.end method

.method public limit()I
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    return v0
.end method

.method public position()I
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->position()I

    move-result v0

    return v0
.end method

.method public position(I)V
    .locals 2
    .parameter "p"

    .prologue
    .line 171
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 172
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 174
    return-void
.end method

.method public put(F)V
    .locals 3
    .parameter "f"

    .prologue
    .line 78
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 79
    .local v0, byteBuffer:Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    .line 81
    .local v1, intBuffer:Ljava/nio/IntBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 82
    iget-object v2, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 83
    invoke-virtual {v1}, Ljava/nio/IntBuffer;->position()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    return-void
.end method

.method public put(Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V
    .locals 3
    .parameter "b"

    .prologue
    .line 147
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 148
    .local v0, byteBuffer:Ljava/nio/ByteBuffer;
    iget-object v1, p1, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 149
    iget-object v1, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    shr-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 150
    iget-object v1, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    shr-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 151
    return-void
.end method

.method public put([F)V
    .locals 7
    .parameter "data"

    .prologue
    .line 90
    array-length v4, p1

    .line 92
    .local v4, length:I
    sget-object v5, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->sWeakIntArray:Ljava/lang/ref/SoftReference;

    invoke-virtual {v5}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 93
    .local v3, ia:[I
    if-eqz v3, :cond_0

    array-length v5, v3

    if-ge v5, v4, :cond_1

    .line 94
    :cond_0
    new-array v3, v4, [I

    .line 95
    new-instance v5, Ljava/lang/ref/SoftReference;

    invoke-direct {v5, v3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    sput-object v5, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->sWeakIntArray:Ljava/lang/ref/SoftReference;

    .line 98
    :cond_1
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v4, :cond_2

    .line 102
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 103
    .local v0, byteBuffer:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    mul-int/lit8 v6, v4, 0x4

    add-int/2addr v5, v6

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 104
    iget-object v1, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    .line 105
    .local v1, floatBuffer:Ljava/nio/FloatBuffer;
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->position()I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {v1, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 106
    iget-object v5, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6, v4}, Ljava/nio/IntBuffer;->put([III)Ljava/nio/IntBuffer;

    .line 107
    return-void

    .line 99
    .end local v0           #byteBuffer:Ljava/nio/ByteBuffer;
    .end local v1           #floatBuffer:Ljava/nio/FloatBuffer;
    :cond_2
    aget v5, p1, v2

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    aput v5, v3, v2

    .line 98
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public put([I)V
    .locals 5
    .parameter "data"

    .prologue
    .line 119
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 120
    .local v0, byteBuffer:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    array-length v3, p1

    mul-int/lit8 v3, v3, 0x4

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 121
    iget-object v1, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    .line 122
    .local v1, floatBuffer:Ljava/nio/FloatBuffer;
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->position()I

    move-result v2

    array-length v3, p1

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 123
    iget-object v2, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mIntBuffer:Ljava/nio/IntBuffer;

    const/4 v3, 0x0

    array-length v4, p1

    invoke-virtual {v2, p1, v3, v4}, Ljava/nio/IntBuffer;->put([III)Ljava/nio/IntBuffer;

    .line 124
    return-void
.end method

.method public remaining()I
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public slice()Ljava/nio/FloatBuffer;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mFloatBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->slice()Ljava/nio/FloatBuffer;

    move-result-object v0

    return-object v0
.end method
