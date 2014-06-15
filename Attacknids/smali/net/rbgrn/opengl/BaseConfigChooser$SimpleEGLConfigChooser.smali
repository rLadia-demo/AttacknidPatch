.class public Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;
.super Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;
.source "BaseConfigChooser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/rbgrn/opengl/BaseConfigChooser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleEGLConfigChooser"
.end annotation


# direct methods
.method public constructor <init>(Z)V
    .locals 8
    .parameter "withDepthBuffer"

    .prologue
    const/4 v7, 0x5

    const/4 v1, 0x4

    const/4 v4, 0x0

    .line 124
    if-eqz p1, :cond_0

    const/16 v5, 0x10

    :goto_0
    move-object v0, p0

    move v2, v1

    move v3, v1

    move v6, v4

    invoke-direct/range {v0 .. v6}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;-><init>(IIIIII)V

    .line 127
    iput v7, p0, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;->mRedSize:I

    .line 128
    const/4 v0, 0x6

    iput v0, p0, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;->mGreenSize:I

    .line 129
    iput v7, p0, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;->mBlueSize:I

    .line 130
    return-void

    :cond_0
    move v5, v4

    .line 124
    goto :goto_0
.end method
