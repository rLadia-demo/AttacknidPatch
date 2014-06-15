.class public Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;
.super Lnet/rbgrn/opengl/BaseConfigChooser;
.source "BaseConfigChooser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/rbgrn/opengl/BaseConfigChooser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ComponentSizeChooser"
.end annotation


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
    .parameter "redSize"
    .parameter "greenSize"
    .parameter "blueSize"
    .parameter "alphaSize"
    .parameter "depthSize"
    .parameter "stencilSize"

    .prologue
    const/4 v3, 0x1

    .line 67
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

    invoke-direct {p0, v0}, Lnet/rbgrn/opengl/BaseConfigChooser;-><init>([I)V

    .line 68
    new-array v0, v3, [I

    iput-object v0, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mValue:[I

    .line 69
    iput p1, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mRedSize:I

    .line 70
    iput p2, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mGreenSize:I

    .line 71
    iput p3, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mBlueSize:I

    .line 72
    iput p4, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mAlphaSize:I

    .line 73
    iput p5, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mDepthSize:I

    .line 74
    iput p6, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mStencilSize:I

    .line 75
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 2
    .parameter "egl"
    .parameter "display"
    .parameter "config"
    .parameter "attribute"
    .parameter "defaultValue"

    .prologue
    .line 101
    iget-object v0, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mValue:[I

    const/4 v1, 0x0

    aget p5, v0, v1

    .line 104
    .end local p5
    :cond_0
    return p5
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 19
    .parameter "egl"
    .parameter "display"
    .parameter "configs"

    .prologue
    .line 79
    const/4 v10, 0x0

    .line 80
    .local v10, closestConfig:Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v11, 0x3e8

    .line 81
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

    .line 96
    return-object v10

    .line 81
    :cond_0
    aget-object v5, p3, v17

    .line 82
    .local v5, config:Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v6, 0x3025

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v12

    .line 83
    .local v12, d:I
    const/16 v6, 0x3026

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v16

    .line 84
    .local v16, s:I
    move-object/from16 v0, p0

    iget v2, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mDepthSize:I

    if-lt v12, v2, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mStencilSize:I

    move/from16 v0, v16

    if-lt v0, v2, :cond_1

    .line 85
    const/16 v6, 0x3024

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v15

    .line 86
    .local v15, r:I
    const/16 v6, 0x3023

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    .line 87
    .local v14, g:I
    const/16 v6, 0x3022

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    .line 88
    .local v9, b:I
    const/16 v6, 0x3021

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v8

    .line 89
    .local v8, a:I
    move-object/from16 v0, p0

    iget v2, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mRedSize:I

    sub-int v2, v15, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    move-object/from16 v0, p0

    iget v3, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mGreenSize:I

    sub-int v3, v14, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mBlueSize:I

    sub-int v3, v9, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;->mAlphaSize:I

    sub-int v3, v8, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v13, v2, v3

    .line 90
    .local v13, distance:I
    if-ge v13, v11, :cond_1

    .line 91
    move v11, v13

    .line 92
    move-object v10, v5

    .line 81
    .end local v8           #a:I
    .end local v9           #b:I
    .end local v13           #distance:I
    .end local v14           #g:I
    .end local v15           #r:I
    :cond_1
    add-int/lit8 v2, v17, 0x1

    move/from16 v17, v2

    goto/16 :goto_0
.end method
