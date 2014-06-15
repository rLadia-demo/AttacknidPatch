.class public Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;
.super Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;
.source "BaseLiveWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "BaseWallpaperGLEngine"
.end annotation


# instance fields
.field private mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

.field final synthetic this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;)V
    .locals 2
    .parameter

    .prologue
    .line 192
    iput-object p1, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    .line 187
    invoke-direct {p0, p1}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;-><init>(Lnet/rbgrn/opengl/GLWallpaperService;)V

    .line 188
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->setEGLConfigChooser(Z)V

    .line 189
    new-instance v0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;

    iget-object v1, p1, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-direct {v0, v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;-><init>(Lorg/anddev/andengine/engine/Engine;)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->setRenderer(Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;)V

    .line 191
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->setRenderMode(I)V

    return-void
.end method


# virtual methods
.method public onCommand(Ljava/lang/String;IIILandroid/os/Bundle;Z)Landroid/os/Bundle;
    .locals 1
    .parameter "pAction"
    .parameter "pX"
    .parameter "pY"
    .parameter "pZ"
    .parameter "pExtras"
    .parameter "pResultRequested"

    .prologue
    .line 200
    const-string v0, "android.wallpaper.tap"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 201
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0, p2, p3}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onTap(II)V

    .line 206
    :cond_0
    :goto_0
    invoke-super/range {p0 .. p6}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onCommand(Ljava/lang/String;IIILandroid/os/Bundle;Z)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    .line 202
    :cond_1
    const-string v0, "android.home.drop"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0, p2, p3}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onDrop(II)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 225
    invoke-super {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onDestroy()V

    .line 229
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    .line 230
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 218
    invoke-super {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onPause()V

    .line 219
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->getEngine()Lorg/anddev/andengine/engine/Engine;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->onPause()V

    .line 220
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onPause()V

    .line 221
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 211
    invoke-super {p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;->onResume()V

    .line 212
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->getEngine()Lorg/anddev/andengine/engine/Engine;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->onResume()V

    .line 213
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;->this$0:Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onResume()V

    .line 214
    return-void
.end method
