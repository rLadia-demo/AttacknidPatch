.class public abstract Lorg/anddev/andengine/ui/activity/BaseSplashActivity;
.super Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.source "BaseSplashActivity.java"


# instance fields
.field private mCamera:Lorg/anddev/andengine/engine/camera/Camera;

.field private mLoadingScreenTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

.field private mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getFollowUpActivity()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract getScreenOrientation()Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
.end method

.method protected getSplashCamera(II)Lorg/anddev/andengine/engine/camera/Camera;
    .locals 4
    .parameter "pSplashwidth"
    .parameter "pSplashHeight"

    .prologue
    const/4 v3, 0x0

    .line 113
    new-instance v0, Lorg/anddev/andengine/engine/camera/Camera;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-direct {v0, v3, v3, v1, v2}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    return-object v0
.end method

.method protected abstract getSplashDuration()F
.end method

.method protected getSplashResolutionPolicy(II)Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;
    .locals 3
    .parameter "pSplashwidth"
    .parameter "pSplashHeight"

    .prologue
    .line 117
    new-instance v0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;-><init>(FF)V

    return-object v0
.end method

.method protected getSplashScaleFrom()F
    .locals 1

    .prologue
    .line 61
    const/high16 v0, 0x3f80

    return v0
.end method

.method protected getSplashScaleTo()F
    .locals 1

    .prologue
    .line 65
    const/high16 v0, 0x3f80

    return v0
.end method

.method protected abstract onGetSplashTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
.end method

.method public onLoadComplete()V
    .locals 0

    .prologue
    .line 70
    return-void
.end method

.method public onLoadEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 8

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->onGetSplashTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v2

    iput-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    .line 76
    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v2}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v1

    .line 77
    .local v1, width:I
    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v2}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    .line 79
    .local v0, height:I
    invoke-virtual {p0, v1, v0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getSplashCamera(II)Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v2

    iput-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 80
    new-instance v2, Lorg/anddev/andengine/engine/Engine;

    new-instance v3, Lorg/anddev/andengine/engine/options/EngineOptions;

    const/4 v4, 0x1

    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getScreenOrientation()Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    move-result-object v5

    invoke-virtual {p0, v1, v0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getSplashResolutionPolicy(II)Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;

    move-result-object v6

    iget-object v7, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/anddev/andengine/engine/options/EngineOptions;-><init>(ZLorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;Lorg/anddev/andengine/engine/camera/Camera;)V

    invoke-direct {v2, v3}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    return-object v2
.end method

.method public onLoadResources()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 85
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    sget-object v2, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-static {v1, v2}, Lorg/anddev/andengine/opengl/texture/TextureFactory;->createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/TextureOptions;)Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    .line 86
    .local v0, loadingScreenTexture:Lorg/anddev/andengine/opengl/texture/Texture;
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mSplashTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-static {v0, v1, v3, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    iput-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mLoadingScreenTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 88
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getEngine()Lorg/anddev/andengine/engine/Engine;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 89
    return-void
.end method

.method public onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 6

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getSplashDuration()F

    move-result v3

    .line 95
    .local v3, splashDuration:F
    new-instance v0, Lorg/anddev/andengine/entity/scene/SplashScene;

    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->mLoadingScreenTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getSplashScaleFrom()F

    move-result v4

    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity;->getSplashScaleTo()F

    move-result v5

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/scene/SplashScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FFF)V

    .line 97
    .local v0, splashScene:Lorg/anddev/andengine/entity/scene/SplashScene;
    new-instance v1, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    new-instance v2, Lorg/anddev/andengine/ui/activity/BaseSplashActivity$1;

    invoke-direct {v2, p0}, Lorg/anddev/andengine/ui/activity/BaseSplashActivity$1;-><init>(Lorg/anddev/andengine/ui/activity/BaseSplashActivity;)V

    invoke-direct {v1, v3, v2}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/entity/scene/SplashScene;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 105
    return-object v0
.end method
