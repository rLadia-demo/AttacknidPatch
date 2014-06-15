.class public Lorg/anddev/andengine/entity/util/ScreenCapture;
.super Lorg/anddev/andengine/entity/Entity;
.source "ScreenCapture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;
    }
.end annotation


# instance fields
.field private mFilePath:Ljava/lang/String;

.field private mHeight:I

.field private mScreenCaptureCallback:Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;

.field private mScreenCapturePending:Z

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCapturePending:Z

    .line 22
    return-void
.end method

.method private static capture(IIIILjavax/microedition/khronos/opengles/GL10;)Landroid/graphics/Bitmap;
    .locals 19
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pGL"

    .prologue
    .line 87
    add-int v2, p1, p3

    mul-int v2, v2, p2

    new-array v10, v2, [I

    .line 88
    .local v10, b:[I
    mul-int v2, p2, p3

    new-array v11, v2, [I

    .line 89
    .local v11, bt:[I
    invoke-static {v10}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v9

    .line 90
    .local v9, ib:Ljava/nio/IntBuffer;
    const/4 v2, 0x0

    invoke-virtual {v9, v2}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 91
    const/4 v4, 0x0

    add-int v6, p1, p3

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move-object/from16 v2, p4

    move/from16 v3, p0

    move/from16 v5, p2

    invoke-interface/range {v2 .. v9}, Ljavax/microedition/khronos/opengles/GL10;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 93
    const/4 v12, 0x0

    .local v12, i:I
    const/4 v14, 0x0

    .local v14, k:I
    :goto_0
    move/from16 v0, p3

    if-lt v12, v0, :cond_0

    .line 103
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v11, v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2

    .line 94
    :cond_0
    const/4 v13, 0x0

    .local v13, j:I
    :goto_1
    move/from16 v0, p2

    if-lt v13, v0, :cond_1

    .line 93
    add-int/lit8 v12, v12, 0x1

    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 95
    :cond_1
    mul-int v2, v12, p2

    add-int/2addr v2, v13

    aget v16, v10, v2

    .line 96
    .local v16, pix:I
    shr-int/lit8 v2, v16, 0x10

    and-int/lit16 v15, v2, 0xff

    .line 97
    .local v15, pb:I
    shl-int/lit8 v2, v16, 0x10

    const/high16 v3, 0xff

    and-int v18, v2, v3

    .line 98
    .local v18, pr:I
    const v2, -0xff0100

    and-int v2, v2, v16

    or-int v2, v2, v18

    or-int v17, v2, v15

    .line 99
    .local v17, pix1:I
    sub-int v2, p3, v14

    add-int/lit8 v2, v2, -0x1

    mul-int v2, v2, p2

    add-int/2addr v2, v13

    aput v17, v11, v2

    .line 94
    add-int/lit8 v13, v13, 0x1

    goto :goto_1
.end method

.method private static saveCapture(IIIILjava/lang/String;Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 5
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pFilePath"
    .parameter "pGL"

    .prologue
    .line 111
    invoke-static {p0, p1, p2, p3, p5}, Lorg/anddev/andengine/entity/util/ScreenCapture;->capture(IIIILjavax/microedition/khronos/opengles/GL10;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 113
    .local v0, bmp:Landroid/graphics/Bitmap;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 114
    .local v2, fos:Ljava/io/FileOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 116
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->flushCloseStream(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v2           #fos:Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v1

    .line 118
    .local v1, e:Ljava/io/FileNotFoundException;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error saving file to: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static saveCapture(IILjava/lang/String;Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 6
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pFilePath"
    .parameter "pGL"

    .prologue
    const/4 v0, 0x0

    .line 107
    move v1, v0

    move v2, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/entity/util/ScreenCapture;->saveCapture(IIIILjava/lang/String;Ljavax/microedition/khronos/opengles/GL10;)V

    .line 108
    return-void
.end method


# virtual methods
.method public capture(IILjava/lang/String;Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pFilePath"
    .parameter "pScreenCaptureCallback"

    .prologue
    .line 78
    iput p1, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mWidth:I

    .line 79
    iput p2, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mHeight:I

    .line 80
    iput-object p3, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mFilePath:Ljava/lang/String;

    .line 81
    iput-object p4, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCaptureCallback:Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCapturePending:Z

    .line 83
    return-void
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    const/4 v3, 0x0

    .line 52
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCapturePending:Z

    if-eqz v0, :cond_0

    .line 53
    iget v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mWidth:I

    iget v1, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mHeight:I

    iget-object v2, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mFilePath:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lorg/anddev/andengine/entity/util/ScreenCapture;->saveCapture(IILjava/lang/String;Ljavax/microedition/khronos/opengles/GL10;)V

    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCaptureCallback:Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;

    iget-object v1, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mFilePath:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;->onScreenCaptured(Ljava/lang/String;)V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCapturePending:Z

    .line 58
    iput-object v3, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mFilePath:Ljava/lang/String;

    .line 59
    iput-object v3, p0, Lorg/anddev/andengine/entity/util/ScreenCapture;->mScreenCaptureCallback:Lorg/anddev/andengine/entity/util/ScreenCapture$IScreenCaptureCallback;

    .line 61
    :cond_0
    return-void
.end method

.method protected onManagedUpdate(F)V
    .locals 0
    .parameter "pSecondsElapsed"

    .prologue
    .line 66
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 71
    return-void
.end method
