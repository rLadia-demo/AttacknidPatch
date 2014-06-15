.class public Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;
.super Lorg/anddev/andengine/opengl/view/BaseConfigChooser;
.source "ComponentSizeChooser.java"


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private final mValue:[I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 4
    .parameter "pRedSize"
    .parameter "pGreenSize"
    .parameter "pBlueSize"
    .parameter "pAlphaSize"
    .parameter "pDepthSize"
    .parameter "pStencilSize"

    .prologue
    const/4 v3, 0x1

    .line 34
    const/16 v0, 0xd

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3024

    aput v2, v0, v1

    aput p1, v0, v3

    const/4 v1, 0x2

    const/16 v2, 0x3023

    aput v2, v0, v1

    const/4 v1, 0x3

    aput p2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x3022

    aput v2, v0, v1

    const/4 v1, 0x5

    aput p3, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x3021

    aput v2, v0, v1

    const/4 v1, 0x7

    aput p4, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x3025

    aput v2, v0, v1

    const/16 v1, 0x9

    aput p5, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x3026

    aput v2, v0, v1

    const/16 v1, 0xb

    aput p6, v0, v1

    const/16 v1, 0xc

    const/16 v2, 0x3038

    aput v2, v0, v1

    invoke-direct {p0, v0}, Lorg/anddev/andengine/opengl/view/BaseConfigChooser;-><init>([I)V

    .line 35
    new-array v0, v3, [I

    iput-object v0, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mValue:[I

    .line 36
    iput p1, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mRedSize:I

    .line 37
    iput p2, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mGreenSize:I

    .line 38
    iput p3, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mBlueSize:I

    .line 39
    iput p4, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mAlphaSize:I

    .line 40
    iput p5, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mDepthSize:I

    .line 41
    iput p6, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mStencilSize:I

    .line 42
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 2
    .parameter "pEGL"
    .parameter "pEGLDisplay"
    .parameter "pEGLConfig"
    .parameter "pAttribute"
    .parameter "pDefaultValue"

    .prologue
    .line 77
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mValue:[I

    const/4 v1, 0x0

    aget p5, v0, v1

    .line 80
    .end local p5
    :cond_0
    return p5
.end method


# virtual methods
.method public bridge synthetic chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/opengl/view/BaseConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    return-object v0
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 19
    .parameter "pEGL"
    .parameter "pEGLDisplay"
    .parameter "pEGLConfigs"

    .prologue
    .line 54
    const/4 v10, 0x0

    .line 55
    .local v10, closestConfig:Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v11, 0x3e8

    .line 56
    .local v11, closestDistance:I
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v18, v0

    const/4 v2, 0x0

    move/from16 v17, v2

    :goto_0
    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_0

    .line 69
    return-object v10

    .line 56
    :cond_0
    aget-object v5, p3, v17

    .line 57
    .local v5, config:Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v6, 0x3024

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v15

    .line 58
    .local v15, r:I
    const/16 v6, 0x3023

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    .line 59
    .local v14, g:I
    const/16 v6, 0x3022

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    .line 60
    .local v9, b:I
    const/16 v6, 0x3021

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v8

    .line 61
    .local v8, a:I
    const/16 v6, 0x3025

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v12

    .line 62
    .local v12, d:I
    const/16 v6, 0x3026

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v16

    .line 63
    .local v16, s:I
    move-object/from16 v0, p0

    iget v2, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mRedSize:I

    sub-int v2, v15, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    move-object/from16 v0, p0

    iget v3, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mGreenSize:I

    sub-int v3, v14, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mBlueSize:I

    sub-int v3, v9, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mAlphaSize:I

    sub-int v3, v8, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mDepthSize:I

    sub-int v3, v12, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;->mStencilSize:I

    sub-int v3, v16, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v13, v2, v3

    .line 64
    .local v13, distance:I
    if-ge v13, v11, :cond_1

    .line 65
    move v11, v13

    .line 66
    move-object v10, v5

    .line 56
    :cond_1
    add-int/lit8 v2, v17, 0x1

    move/from16 v17, v2

    goto/16 :goto_0
.end method
