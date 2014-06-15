.class public abstract Lorg/anddev/andengine/opengl/buffer/BufferObject;
.super Ljava/lang/Object;
.source "BufferObject.java"


# static fields
.field private static final HARDWAREBUFFERID_FETCHER:[I


# instance fields
.field protected final mBufferData:[I

.field private final mDrawType:I

.field private final mFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

.field private mHardwareBufferID:I

.field private mHardwareBufferNeedsUpdate:Z

.field private mLoadedToHardware:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->HARDWAREBUFFERID_FETCHER:[I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .parameter "pCapacity"
    .parameter "pDrawType"

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferNeedsUpdate:Z

    .line 38
    iput p2, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mDrawType:I

    .line 39
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mBufferData:[I

    .line 40
    new-instance v0, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    invoke-direct {v0, p1}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 41
    return-void
.end method

.method private deleteBufferOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 1
    .parameter "pGL11"

    .prologue
    .line 108
    iget v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->deleteBuffer(Ljavax/microedition/khronos/opengles/GL11;I)V

    .line 109
    return-void
.end method

.method private generateHardwareBufferID(Ljavax/microedition/khronos/opengles/GL11;)I
    .locals 3
    .parameter "pGL11"

    .prologue
    const/4 v2, 0x0

    .line 112
    const/4 v0, 0x1

    sget-object v1, Lorg/anddev/andengine/opengl/buffer/BufferObject;->HARDWAREBUFFERID_FETCHER:[I

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL11;->glGenBuffers(I[II)V

    .line 114
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->HARDWAREBUFFERID_FETCHER:[I

    aget v0, v0, v2

    return v0
.end method


# virtual methods
.method public getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    return-object v0
.end method

.method public getHardwareBufferID()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    return v0
.end method

.method public isLoadedToHardware()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mLoadedToHardware:Z

    return v0
.end method

.method public loadToHardware(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 1
    .parameter "pGL11"

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->generateHardwareBufferID(Ljavax/microedition/khronos/opengles/GL11;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mLoadedToHardware:Z

    .line 97
    return-void
.end method

.method public selectOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 3
    .parameter "pGL11"

    .prologue
    .line 76
    iget v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    .line 77
    .local v0, hardwareBufferID:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 81
    :cond_1
    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindBuffer(Ljavax/microedition/khronos/opengles/GL11;I)V

    .line 83
    iget-boolean v1, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferNeedsUpdate:Z

    if-eqz v1, :cond_0

    .line 85
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferNeedsUpdate:Z

    .line 86
    monitor-enter p0

    .line 87
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    iget-object v1, v1, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mDrawType:I

    invoke-static {p1, v1, v2}, Lorg/anddev/andengine/opengl/util/GLHelper;->bufferData(Ljavax/microedition/khronos/opengles/GL11;Ljava/nio/ByteBuffer;I)V

    .line 86
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setHardwareBufferNeedsUpdate()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferNeedsUpdate:Z

    .line 69
    return-void
.end method

.method setLoadedToHardware(Z)V
    .locals 0
    .parameter "pLoadedToHardware"

    .prologue
    .line 60
    iput-boolean p1, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mLoadedToHardware:Z

    .line 61
    return-void
.end method

.method public unloadFromHardware(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 1
    .parameter "pGL11"

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->deleteBufferOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mHardwareBufferID:I

    .line 104
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/buffer/BufferObject;->mLoadedToHardware:Z

    .line 105
    return-void
.end method
