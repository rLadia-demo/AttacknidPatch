.class public Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;
.super Landroid/service/wallpaper/WallpaperService$Engine;
.source "GLWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/rbgrn/opengl/GLWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GLEngine"
.end annotation


# static fields
.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I


# instance fields
.field private mDebugFlags:I

.field private mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

.field private mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

.field private mGLThread:Lnet/rbgrn/opengl/GLThread;

.field private mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

.field final synthetic this$0:Lnet/rbgrn/opengl/GLWallpaperService;


# direct methods
.method public constructor <init>(Lnet/rbgrn/opengl/GLWallpaperService;)V
    .locals 0
    .parameter

    .prologue
    .line 87
    iput-object p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->this$0:Lnet/rbgrn/opengl/GLWallpaperService;

    .line 86
    invoke-direct {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;-><init>(Landroid/service/wallpaper/WallpaperService;)V

    return-void
.end method

.method private checkRenderThreadState()V
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRenderer has already been called for this instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_0
    return-void
.end method


# virtual methods
.method public getDebugFlags()I
    .locals 1

    .prologue
    .line 156
    iget v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mDebugFlags:I

    return v0
.end method

.method public getRenderMode()I
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->getRenderMode()I

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter "surfaceHolder"

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onCreate(Landroid/view/SurfaceHolder;)V

    .line 111
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 115
    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService$Engine;->onDestroy()V

    .line 117
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->onPause()V

    .line 211
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->onResume()V

    .line 215
    return-void
.end method

.method public onSurfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 122
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0, p3, p4}, Lnet/rbgrn/opengl/GLThread;->onWindowResize(II)V

    .line 123
    invoke-super {p0, p1, p2, p3, p4}, Landroid/service/wallpaper/WallpaperService$Engine;->onSurfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 124
    return-void
.end method

.method public onSurfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 128
    const-string v0, "GLWallpaperService"

    const-string v1, "onSurfaceCreated()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0, p1}, Lnet/rbgrn/opengl/GLThread;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 130
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onSurfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 131
    return-void
.end method

.method public onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 135
    const-string v0, "GLWallpaperService"

    const-string v1, "onSurfaceDestroyed()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->surfaceDestroyed()V

    .line 137
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V

    .line 138
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .locals 0
    .parameter "visible"

    .prologue
    .line 99
    if-eqz p1, :cond_0

    .line 100
    invoke-virtual {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onResume()V

    .line 104
    :goto_0
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onVisibilityChanged(Z)V

    .line 105
    return-void

    .line 102
    :cond_0
    invoke-virtual {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onPause()V

    goto :goto_0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 218
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0, p1}, Lnet/rbgrn/opengl/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 219
    return-void
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->requestRender()V

    .line 207
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0
    .parameter "debugFlags"

    .prologue
    .line 152
    iput p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mDebugFlags:I

    .line 153
    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 7
    .parameter "redSize"
    .parameter "greenSize"
    .parameter "blueSize"
    .parameter "alphaSize"
    .parameter "depthSize"
    .parameter "stencilSize"

    .prologue
    .line 194
    new-instance v0, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lnet/rbgrn/opengl/BaseConfigChooser$ComponentSizeChooser;-><init>(IIIIII)V

    invoke-virtual {p0, v0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 195
    return-void
.end method

.method public setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V
    .locals 0
    .parameter "configChooser"

    .prologue
    .line 185
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->checkRenderThreadState()V

    .line 186
    iput-object p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 187
    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1
    .parameter "needDepth"

    .prologue
    .line 190
    new-instance v0, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;

    invoke-direct {v0, p1}, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;-><init>(Z)V

    invoke-virtual {p0, v0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 191
    return-void
.end method

.method public setEGLContextFactory(Landroid/opengl/GLSurfaceView$EGLContextFactory;)V
    .locals 0
    .parameter "factory"

    .prologue
    .line 175
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->checkRenderThreadState()V

    .line 176
    iput-object p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 177
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;)V
    .locals 0
    .parameter "factory"

    .prologue
    .line 180
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->checkRenderThreadState()V

    .line 181
    iput-object p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 182
    return-void
.end method

.method public setGLWrapper(Landroid/opengl/GLSurfaceView$GLWrapper;)V
    .locals 0
    .parameter "glWrapper"

    .prologue
    .line 148
    iput-object p1, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 149
    return-void
.end method

.method public setRenderMode(I)V
    .locals 1
    .parameter "renderMode"

    .prologue
    .line 198
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0, p1}, Lnet/rbgrn/opengl/GLThread;->setRenderMode(I)V

    .line 199
    return-void
.end method

.method public setRenderer(Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;)V
    .locals 6
    .parameter "renderer"

    .prologue
    .line 160
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->checkRenderThreadState()V

    .line 161
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    if-nez v0, :cond_0

    .line 162
    new-instance v0, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lnet/rbgrn/opengl/BaseConfigChooser$SimpleEGLConfigChooser;-><init>(Z)V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 164
    :cond_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    if-nez v0, :cond_1

    .line 165
    new-instance v0, Lnet/rbgrn/opengl/DefaultContextFactory;

    invoke-direct {v0}, Lnet/rbgrn/opengl/DefaultContextFactory;-><init>()V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 167
    :cond_1
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    if-nez v0, :cond_2

    .line 168
    new-instance v0, Lnet/rbgrn/opengl/DefaultWindowSurfaceFactory;

    invoke-direct {v0}, Lnet/rbgrn/opengl/DefaultWindowSurfaceFactory;-><init>()V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 170
    :cond_2
    new-instance v0, Lnet/rbgrn/opengl/GLThread;

    iget-object v2, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    iget-object v3, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    iget-object v4, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    iget-object v5, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lnet/rbgrn/opengl/GLThread;-><init>(Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    .line 171
    iget-object v0, p0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->mGLThread:Lnet/rbgrn/opengl/GLThread;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/GLThread;->start()V

    .line 172
    return-void
.end method
