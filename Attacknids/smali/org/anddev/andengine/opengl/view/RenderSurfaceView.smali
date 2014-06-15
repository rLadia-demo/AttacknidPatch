.class public Lorg/anddev/andengine/opengl/view/RenderSurfaceView;
.super Lorg/anddev/andengine/opengl/view/GLSurfaceView;
.source "RenderSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;
    }
.end annotation


# instance fields
.field private mRenderer:Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "pContext"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "pContext"
    .parameter "pAttrs"

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 1
    .parameter "pWidthMeasureSpec"
    .parameter "pHeightMeasureSpec"

    .prologue
    .line 51
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->mRenderer:Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;

    #getter for: Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;
    invoke-static {v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->access$0(Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;)Lorg/anddev/andengine/engine/Engine;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->getResolutionPolicy()Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;->onMeasure(Lorg/anddev/andengine/opengl/view/RenderSurfaceView;II)V

    .line 52
    return-void
.end method

.method public setMeasuredDimensionProxy(II)V
    .locals 0
    .parameter "pMeasuredWidth"
    .parameter "pMeasuredHeight"

    .prologue
    .line 55
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setMeasuredDimension(II)V

    .line 56
    return-void
.end method

.method public setRenderer(Lorg/anddev/andengine/engine/Engine;)V
    .locals 1
    .parameter "pEngine"

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 42
    new-instance v0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;

    invoke-direct {v0, p1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;-><init>(Lorg/anddev/andengine/engine/Engine;)V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->mRenderer:Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;

    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->mRenderer:Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setRenderer(Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;)V

    .line 44
    return-void
.end method
