.class public abstract Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;
.super Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.source "BaseAugmentedRealityGameActivity.java"


# instance fields
.field private mCameraPreviewSurfaceView:Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, -0x2

    .line 33
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    new-instance v0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mCameraPreviewSurfaceView:Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;

    .line 36
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mCameraPreviewSurfaceView:Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->bringToFront()V

    .line 40
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 63
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onPause()V

    .line 65
    return-void
.end method

.method protected onSetContentView()V
    .locals 8

    .prologue
    const/4 v1, 0x4

    .line 51
    new-instance v0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    iget-object v2, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-direct {v0, p0, v2}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;-><init>(Landroid/content/Context;Lorg/anddev/andengine/engine/Engine;)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    .line 53
    iget-object v7, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    new-instance v0, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;

    const/16 v5, 0x10

    const/4 v6, 0x0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/view/ComponentSizeChooser;-><init>(IIIIII)V

    invoke-virtual {v7, v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setEGLConfigChooser(Lorg/anddev/andengine/opengl/view/EGLConfigChooser;)V

    .line 54
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 56
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->applyRenderer()V

    .line 58
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {p0}, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->createSurfaceViewLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/extension/augmentedreality/BaseAugmentedRealityGameActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    return-void
.end method
