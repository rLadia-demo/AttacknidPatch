.class public Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;
.super Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
.source "RectangleVertexBuffer.java"


# static fields
#the value of this static final field might be set in the static constructor
.field private static final FLOAT_TO_RAW_INT_BITS_ZERO:I = 0x0

.field public static final VERTICES_PER_RECTANGLE:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    sput v0, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->FLOAT_TO_RAW_INT_BITS_ZERO:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pDrawType"

    .prologue
    .line 27
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;-><init>(II)V

    .line 28
    return-void
.end method


# virtual methods
.method public declared-synchronized update(FF)V
    .locals 7
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 43
    monitor-enter p0

    :try_start_0
    sget v2, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->FLOAT_TO_RAW_INT_BITS_ZERO:I

    .line 44
    .local v2, x:I
    sget v4, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->FLOAT_TO_RAW_INT_BITS_ZERO:I

    .line 45
    .local v4, y:I
    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v3

    .line 46
    .local v3, x2:I
    invoke-static {p2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    .line 48
    .local v5, y2:I
    iget-object v1, p0, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->mBufferData:[I

    .line 49
    .local v1, bufferData:[I
    const/4 v6, 0x0

    aput v2, v1, v6

    .line 50
    const/4 v6, 0x1

    aput v4, v1, v6

    .line 52
    const/4 v6, 0x2

    aput v2, v1, v6

    .line 53
    const/4 v6, 0x3

    aput v5, v1, v6

    .line 55
    const/4 v6, 0x4

    aput v3, v1, v6

    .line 56
    const/4 v6, 0x5

    aput v4, v1, v6

    .line 58
    const/4 v6, 0x6

    aput v3, v1, v6

    .line 59
    const/4 v6, 0x7

    aput v5, v1, v6

    .line 61
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v0

    .line 62
    .local v0, buffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 63
    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put([I)V

    .line 64
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 66
    invoke-super {p0}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;->setHardwareBufferNeedsUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-exit p0

    return-void

    .line 43
    .end local v0           #buffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    .end local v1           #bufferData:[I
    .end local v2           #x:I
    .end local v3           #x2:I
    .end local v4           #y:I
    .end local v5           #y2:I
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6
.end method
