.class public Lorg/anddev/andengine/opengl/util/GLHelper;
.super Ljava/lang/Object;
.source "GLHelper.java"


# static fields
.field public static final BYTES_PER_FLOAT:I = 0x4

.field public static final BYTES_PER_PIXEL_RGBA:I = 0x4

.field public static EXTENSIONS_DRAWTEXTURE:Z

.field public static EXTENSIONS_VERTEXBUFFEROBJECTS:Z

.field private static final HARDWAREBUFFERID_CONTAINER:[I

.field private static final HARDWARETEXTUREID_CONTAINER:[I

.field private static final IS_LITTLE_ENDIAN:Z

.field private static sAlpha:F

.field private static sBlue:F

.field private static sCurrentDestinationBlendMode:I

.field private static sCurrentHardwareBufferID:I

.field private static sCurrentHardwareTextureID:I

.field private static sCurrentMatrix:I

.field private static sCurrentSourceBlendMode:I

.field private static sCurrentTextureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

.field private static sCurrentVertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

.field private static sEnableBlend:Z

.field private static sEnableCulling:Z

.field private static sEnableDepthTest:Z

.field private static sEnableDither:Z

.field private static sEnableLightning:Z

.field private static sEnableMultisample:Z

.field private static sEnableTexCoordArray:Z

.field private static sEnableTextures:Z

.field private static sEnableVertexArray:Z

.field private static sGreen:F

.field private static sLineWidth:F

.field private static sRed:F


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/high16 v5, -0x4080

    const/4 v4, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 30
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v3, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->IS_LITTLE_ENDIAN:Z

    .line 32
    new-array v0, v1, [I

    sput-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWARETEXTUREID_CONTAINER:[I

    .line 33
    new-array v0, v1, [I

    sput-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWAREBUFFERID_CONTAINER:[I

    .line 39
    sput v4, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareBufferID:I

    .line 40
    sput v4, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareTextureID:I

    .line 41
    sput v4, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    .line 43
    sput v4, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentSourceBlendMode:I

    .line 44
    sput v4, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentDestinationBlendMode:I

    .line 46
    sput-object v6, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentTextureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 47
    sput-object v6, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentVertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 49
    sput-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDither:Z

    .line 50
    sput-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableLightning:Z

    .line 51
    sput-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDepthTest:Z

    .line 52
    sput-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableMultisample:Z

    .line 54
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableBlend:Z

    .line 55
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableCulling:Z

    .line 56
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTextures:Z

    .line 57
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTexCoordArray:Z

    .line 58
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableVertexArray:Z

    .line 60
    const/high16 v0, 0x3f80

    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sLineWidth:F

    .line 62
    sput v5, Lorg/anddev/andengine/opengl/util/GLHelper;->sRed:F

    .line 63
    sput v5, Lorg/anddev/andengine/opengl/util/GLHelper;->sGreen:F

    .line 64
    sput v5, Lorg/anddev/andengine/opengl/util/GLHelper;->sBlue:F

    .line 65
    sput v5, Lorg/anddev/andengine/opengl/util/GLHelper;->sAlpha:F

    .line 67
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    .line 68
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_DRAWTEXTURE:Z

    return-void

    :cond_0
    move v0, v2

    .line 30
    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindBuffer(Ljavax/microedition/khronos/opengles/GL11;I)V
    .locals 1
    .parameter "pGL11"
    .parameter "pHardwareBufferID"

    .prologue
    .line 270
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareBufferID:I

    if-eq v0, p1, :cond_0

    .line 271
    sput p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareBufferID:I

    .line 272
    const v0, 0x8892

    invoke-interface {p0, v0, p1}, Ljavax/microedition/khronos/opengles/GL11;->glBindBuffer(II)V

    .line 274
    :cond_0
    return-void
.end method

.method public static bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V
    .locals 1
    .parameter "pGL"
    .parameter "pHardwareTextureID"

    .prologue
    .line 283
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareTextureID:I

    if-eq v0, p1, :cond_0

    .line 284
    sput p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareTextureID:I

    .line 285
    const/16 v0, 0xde1

    invoke-interface {p0, v0, p1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 287
    :cond_0
    return-void
.end method

.method public static blendFunction(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 1
    .parameter "pGL"
    .parameter "pSourceBlendMode"
    .parameter "pDestinationBlendMode"

    .prologue
    .line 317
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentSourceBlendMode:I

    if-ne v0, p1, :cond_0

    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentDestinationBlendMode:I

    if-eq v0, p2, :cond_1

    .line 318
    :cond_0
    sput p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentSourceBlendMode:I

    .line 319
    sput p2, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentDestinationBlendMode:I

    .line 320
    invoke-interface {p0, p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 322
    :cond_1
    return-void
.end method

.method public static bufferData(Ljavax/microedition/khronos/opengles/GL11;Ljava/nio/ByteBuffer;I)V
    .locals 2
    .parameter "pGL11"
    .parameter "pByteBuffer"
    .parameter "pUsage"

    .prologue
    .line 366
    const v0, 0x8892

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-interface {p0, v0, v1, p1, p2}, Ljavax/microedition/khronos/opengles/GL11;->glBufferData(IILjava/nio/Buffer;I)V

    .line 367
    return-void
.end method

.method private static convertARGBtoRGBABuffer([I)Ljava/nio/Buffer;
    .locals 8
    .parameter "pPixels"

    .prologue
    .line 384
    sget-boolean v6, Lorg/anddev/andengine/opengl/util/GLHelper;->IS_LITTLE_ENDIAN:Z

    if-eqz v6, :cond_2

    .line 385
    array-length v6, p0

    add-int/lit8 v3, v6, -0x1

    .local v3, i:I
    :goto_0
    if-gez v3, :cond_1

    .line 407
    :cond_0
    invoke-static {p0}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v6

    return-object v6

    .line 386
    :cond_1
    aget v4, p0, v3

    .line 388
    .local v4, pixel:I
    shr-int/lit8 v6, v4, 0x10

    and-int/lit16 v5, v6, 0xff

    .line 389
    .local v5, red:I
    shr-int/lit8 v6, v4, 0x8

    and-int/lit16 v2, v6, 0xff

    .line 390
    .local v2, green:I
    and-int/lit16 v1, v4, 0xff

    .line 391
    .local v1, blue:I
    shr-int/lit8 v0, v4, 0x18

    .line 393
    .local v0, alpha:I
    shl-int/lit8 v6, v0, 0x18

    shl-int/lit8 v7, v1, 0x10

    or-int/2addr v6, v7

    shl-int/lit8 v7, v2, 0x8

    or-int/2addr v6, v7

    or-int/2addr v6, v5

    aput v6, p0, v3

    .line 385
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 396
    .end local v0           #alpha:I
    .end local v1           #blue:I
    .end local v2           #green:I
    .end local v3           #i:I
    .end local v4           #pixel:I
    .end local v5           #red:I
    :cond_2
    array-length v6, p0

    add-int/lit8 v3, v6, -0x1

    .restart local v3       #i:I
    :goto_1
    if-ltz v3, :cond_0

    .line 397
    aget v4, p0, v3

    .line 399
    .restart local v4       #pixel:I
    shr-int/lit8 v6, v4, 0x10

    and-int/lit16 v5, v6, 0xff

    .line 400
    .restart local v5       #red:I
    shr-int/lit8 v6, v4, 0x8

    and-int/lit16 v2, v6, 0xff

    .line 401
    .restart local v2       #green:I
    and-int/lit16 v1, v4, 0xff

    .line 402
    .restart local v1       #blue:I
    shr-int/lit8 v0, v4, 0x18

    .line 404
    .restart local v0       #alpha:I
    shl-int/lit8 v6, v5, 0x18

    shl-int/lit8 v7, v2, 0x10

    or-int/2addr v6, v7

    shl-int/lit8 v7, v1, 0x8

    or-int/2addr v6, v7

    or-int/2addr v6, v0

    aput v6, p0, v3

    .line 396
    add-int/lit8 v3, v3, -0x1

    goto :goto_1
.end method

.method public static deleteBuffer(Ljavax/microedition/khronos/opengles/GL11;I)V
    .locals 3
    .parameter "pGL11"
    .parameter "pHardwareBufferID"

    .prologue
    const/4 v2, 0x0

    .line 277
    sget-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWAREBUFFERID_CONTAINER:[I

    aput p1, v0, v2

    .line 278
    const/4 v0, 0x1

    sget-object v1, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWAREBUFFERID_CONTAINER:[I

    invoke-interface {p0, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL11;->glDeleteBuffers(I[II)V

    .line 279
    return-void
.end method

.method public static deleteTexture(Ljavax/microedition/khronos/opengles/GL10;I)V
    .locals 3
    .parameter "pGL"
    .parameter "pHardwareTextureID"

    .prologue
    const/4 v2, 0x0

    .line 290
    sget-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWARETEXTUREID_CONTAINER:[I

    aput p1, v0, v2

    .line 291
    const/4 v0, 0x1

    sget-object v1, Lorg/anddev/andengine/opengl/util/GLHelper;->HARDWARETEXTUREID_CONTAINER:[I

    invoke-interface {p0, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 292
    return-void
.end method

.method public static disableBlend(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 184
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableBlend:Z

    if-eqz v0, :cond_0

    .line 185
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableBlend:Z

    .line 186
    const/16 v0, 0xbe2

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 188
    :cond_0
    return-void
.end method

.method public static disableCulling(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 197
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableCulling:Z

    if-eqz v0, :cond_0

    .line 198
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableCulling:Z

    .line 199
    const/16 v0, 0xb44

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 201
    :cond_0
    return-void
.end method

.method public static disableDepthTest(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 249
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDepthTest:Z

    if-eqz v0, :cond_0

    .line 250
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDepthTest:Z

    .line 251
    const/16 v0, 0xb71

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 253
    :cond_0
    return-void
.end method

.method public static disableDither(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 236
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDither:Z

    if-eqz v0, :cond_0

    .line 237
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDither:Z

    .line 238
    const/16 v0, 0xbd0

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 240
    :cond_0
    return-void
.end method

.method public static disableLightning(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 223
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableLightning:Z

    if-eqz v0, :cond_0

    .line 224
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableLightning:Z

    .line 225
    const/16 v0, 0xb50

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 227
    :cond_0
    return-void
.end method

.method public static disableMultisample(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 262
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableMultisample:Z

    if-eqz v0, :cond_0

    .line 263
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableMultisample:Z

    .line 264
    const v0, 0x809d

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 266
    :cond_0
    return-void
.end method

.method public static disableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 171
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTexCoordArray:Z

    if-eqz v0, :cond_0

    .line 172
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTexCoordArray:Z

    .line 173
    const v0, 0x8078

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 175
    :cond_0
    return-void
.end method

.method public static disableTextures(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 210
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTextures:Z

    if-eqz v0, :cond_0

    .line 211
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTextures:Z

    .line 212
    const/16 v0, 0xde1

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 214
    :cond_0
    return-void
.end method

.method public static disableVertexArray(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 158
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableVertexArray:Z

    if-eqz v0, :cond_0

    .line 159
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableVertexArray:Z

    .line 160
    const v0, 0x8074

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 162
    :cond_0
    return-void
.end method

.method public static enableBlend(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 178
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableBlend:Z

    if-nez v0, :cond_0

    .line 179
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableBlend:Z

    .line 180
    const/16 v0, 0xbe2

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 182
    :cond_0
    return-void
.end method

.method public static enableCulling(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 191
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableCulling:Z

    if-nez v0, :cond_0

    .line 192
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableCulling:Z

    .line 193
    const/16 v0, 0xb44

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 195
    :cond_0
    return-void
.end method

.method public static enableDepthTest(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 243
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDepthTest:Z

    if-nez v0, :cond_0

    .line 244
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDepthTest:Z

    .line 245
    const/16 v0, 0xb71

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 247
    :cond_0
    return-void
.end method

.method public static enableDither(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 230
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDither:Z

    if-nez v0, :cond_0

    .line 231
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableDither:Z

    .line 232
    const/16 v0, 0xbd0

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 234
    :cond_0
    return-void
.end method

.method public static enableExtensions(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/options/RenderOptions;)V
    .locals 9
    .parameter "pGL"
    .parameter "pRenderOptions"

    .prologue
    .line 108
    const/16 v7, 0x1f02

    invoke-interface {p0, v7}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v6

    .line 109
    .local v6, version:Ljava/lang/String;
    const/16 v7, 0x1f01

    invoke-interface {p0, v7}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v5

    .line 110
    .local v5, renderer:Ljava/lang/String;
    const/16 v7, 0x1f03

    invoke-interface {p0, v7}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, extensions:Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "RENDERER: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 113
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "VERSION: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 114
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EXTENSIONS: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 116
    const-string v7, "1.0"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 117
    .local v2, isOpenGL10:Z
    const-string v7, "PixelFlinger"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 118
    .local v3, isSoftwareRenderer:Z
    const-string v7, "_vertex_buffer_object"

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    .line 119
    .local v4, isVBOCapable:Z
    const-string v7, "draw_texture"

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 121
    .local v1, isDrawTextureCapable:Z
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/RenderOptions;->isDisableExtensionVertexBufferObjects()Z

    move-result v7

    if-nez v7, :cond_1

    if-nez v3, :cond_1

    if-nez v4, :cond_0

    if-nez v2, :cond_1

    :cond_0
    const/4 v7, 0x1

    :goto_0
    sput-boolean v7, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    .line 122
    sput-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_DRAWTEXTURE:Z

    .line 124
    invoke-static {}, Lorg/anddev/andengine/opengl/util/GLHelper;->hackBrokenDevices()V

    .line 125
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EXTENSIONS_VERXTEXBUFFEROBJECTS = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v8, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 126
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EXTENSIONS_DRAWTEXTURE = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v8, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_DRAWTEXTURE:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 127
    return-void

    .line 121
    :cond_1
    const/4 v7, 0x0

    goto :goto_0
.end method

.method public static enableLightning(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 217
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableLightning:Z

    if-nez v0, :cond_0

    .line 218
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableLightning:Z

    .line 219
    const/16 v0, 0xb50

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 221
    :cond_0
    return-void
.end method

.method public static enableMultisample(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 256
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableMultisample:Z

    if-nez v0, :cond_0

    .line 257
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableMultisample:Z

    .line 258
    const v0, 0x809d

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 260
    :cond_0
    return-void
.end method

.method public static enableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 165
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTexCoordArray:Z

    if-nez v0, :cond_0

    .line 166
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTexCoordArray:Z

    .line 167
    const v0, 0x8078

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 169
    :cond_0
    return-void
.end method

.method public static enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 204
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTextures:Z

    if-nez v0, :cond_0

    .line 205
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableTextures:Z

    .line 206
    const/16 v0, 0xde1

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 208
    :cond_0
    return-void
.end method

.method public static enableVertexArray(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 152
    sget-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableVertexArray:Z

    if-nez v0, :cond_0

    .line 153
    const/4 v0, 0x1

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sEnableVertexArray:Z

    .line 154
    const v0, 0x8074

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 156
    :cond_0
    return-void
.end method

.method public static getPixels(Landroid/graphics/Bitmap;)[I
    .locals 8
    .parameter "pBitmap"

    .prologue
    const/4 v2, 0x0

    .line 411
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 412
    .local v3, w:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 414
    .local v7, h:I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .local v1, pixels:[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 415
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 417
    return-object v1
.end method

.method public static glTexSubImage2D(Ljavax/microedition/khronos/opengles/GL10;IIIILandroid/graphics/Bitmap;II)V
    .locals 11
    .parameter "pGL"
    .parameter "target"
    .parameter "level"
    .parameter "xoffset"
    .parameter "yoffset"
    .parameter "bitmap"
    .parameter "format"
    .parameter "type"

    .prologue
    .line 376
    invoke-static/range {p5 .. p5}, Lorg/anddev/andengine/opengl/util/GLHelper;->getPixels(Landroid/graphics/Bitmap;)[I

    move-result-object v10

    .line 378
    .local v10, pixels:[I
    invoke-static {v10}, Lorg/anddev/andengine/opengl/util/GLHelper;->convertARGBtoRGBABuffer([I)Ljava/nio/Buffer;

    move-result-object v9

    .line 380
    .local v9, pixelBuffer:Ljava/nio/Buffer;
    const/16 v1, 0xde1

    const/4 v2, 0x0

    invoke-virtual/range {p5 .. p5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual/range {p5 .. p5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move-object v0, p0

    move v3, p3

    move v4, p4

    invoke-interface/range {v0 .. v9}, Ljavax/microedition/khronos/opengles/GL10;->glTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 381
    return-void
.end method

.method private static hackBrokenDevices()V
    .locals 2

    .prologue
    .line 130
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    const-string v1, "morrison"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    const/4 v0, 0x0

    sput-boolean v0, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    .line 139
    :cond_0
    return-void
.end method

.method public static lineWidth(Ljavax/microedition/khronos/opengles/GL10;F)V
    .locals 1
    .parameter "pGL"
    .parameter "pLineWidth"

    .prologue
    .line 325
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sLineWidth:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 326
    sput p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sLineWidth:F

    .line 327
    invoke-interface {p0, p1}, Ljavax/microedition/khronos/opengles/GL10;->glLineWidth(F)V

    .line 329
    :cond_0
    return-void
.end method

.method public static reset(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .parameter "pGL"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/high16 v1, -0x4080

    const/4 v0, -0x1

    .line 75
    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareBufferID:I

    .line 76
    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentHardwareTextureID:I

    .line 77
    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    .line 79
    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentSourceBlendMode:I

    .line 80
    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentDestinationBlendMode:I

    .line 82
    sput-object v3, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentTextureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 83
    sput-object v3, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentVertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 85
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableDither(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 86
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableLightning(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 87
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableDepthTest(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 88
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableMultisample(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 90
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableBlend(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 91
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableCulling(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 92
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 93
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 94
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableVertexArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 96
    const/high16 v0, 0x3f80

    sput v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sLineWidth:F

    .line 98
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sRed:F

    .line 99
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sGreen:F

    .line 100
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sBlue:F

    .line 101
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sAlpha:F

    .line 103
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    .line 104
    sput-boolean v2, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_DRAWTEXTURE:Z

    .line 105
    return-void
.end method

.method public static setColor(Ljavax/microedition/khronos/opengles/GL10;FFFF)V
    .locals 1
    .parameter "pGL"
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"

    .prologue
    .line 142
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sAlpha:F

    cmpl-float v0, p4, v0

    if-nez v0, :cond_0

    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sRed:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sGreen:F

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sBlue:F

    cmpl-float v0, p3, v0

    if-eqz v0, :cond_1

    .line 143
    :cond_0
    sput p4, Lorg/anddev/andengine/opengl/util/GLHelper;->sAlpha:F

    .line 144
    sput p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sRed:F

    .line 145
    sput p2, Lorg/anddev/andengine/opengl/util/GLHelper;->sGreen:F

    .line 146
    sput p3, Lorg/anddev/andengine/opengl/util/GLHelper;->sBlue:F

    .line 147
    invoke-interface {p0, p1, p2, p3, p4}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    .line 149
    :cond_1
    return-void
.end method

.method public static setModelViewIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 353
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->switchToModelViewMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 354
    invoke-interface {p0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 355
    return-void
.end method

.method public static setPerspectiveCorrectionHintFastest(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 362
    const/16 v0, 0xc50

    const/16 v1, 0x1101

    invoke-interface {p0, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glHint(II)V

    .line 363
    return-void
.end method

.method public static setProjectionIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 348
    invoke-static {p0}, Lorg/anddev/andengine/opengl/util/GLHelper;->switchToProjectionMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 349
    invoke-interface {p0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 350
    return-void
.end method

.method public static setShadeModelFlat(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 358
    const/16 v0, 0x1d00

    invoke-interface {p0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glShadeModel(I)V

    .line 359
    return-void
.end method

.method public static switchToModelViewMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    const/16 v1, 0x1700

    .line 333
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    if-eq v0, v1, :cond_0

    .line 334
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    .line 335
    invoke-interface {p0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 337
    :cond_0
    return-void
.end method

.method public static switchToProjectionMatrix(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    const/16 v1, 0x1701

    .line 341
    sget v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    if-eq v0, v1, :cond_0

    .line 342
    sput v1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentMatrix:I

    .line 343
    invoke-interface {p0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 345
    :cond_0
    return-void
.end method

.method public static texCoordPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V
    .locals 4
    .parameter "pGL"
    .parameter "pTextureFloatBuffer"

    .prologue
    .line 295
    sget-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentTextureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    if-eq v0, p1, :cond_0

    .line 296
    sput-object p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentTextureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 297
    const/4 v0, 0x2

    const/16 v1, 0x1406

    const/4 v2, 0x0

    iget-object v3, p1, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p0, v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 299
    :cond_0
    return-void
.end method

.method public static texCoordZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 3
    .parameter "pGL11"

    .prologue
    const/4 v2, 0x0

    .line 302
    const/4 v0, 0x2

    const/16 v1, 0x1406

    invoke-interface {p0, v0, v1, v2, v2}, Ljavax/microedition/khronos/opengles/GL11;->glTexCoordPointer(IIII)V

    .line 303
    return-void
.end method

.method public static vertexPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V
    .locals 4
    .parameter "pGL"
    .parameter "pVertexFloatBuffer"

    .prologue
    .line 306
    sget-object v0, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentVertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    if-eq v0, p1, :cond_0

    .line 307
    sput-object p1, Lorg/anddev/andengine/opengl/util/GLHelper;->sCurrentVertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    .line 308
    const/4 v0, 0x2

    const/16 v1, 0x1406

    const/4 v2, 0x0

    iget-object v3, p1, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p0, v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 310
    :cond_0
    return-void
.end method

.method public static vertexZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 3
    .parameter "pGL11"

    .prologue
    const/4 v2, 0x0

    .line 313
    const/4 v0, 0x2

    const/16 v1, 0x1406

    invoke-interface {p0, v0, v1, v2, v2}, Ljavax/microedition/khronos/opengles/GL11;->glVertexPointer(IIII)V

    .line 314
    return-void
.end method
