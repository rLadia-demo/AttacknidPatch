.class public Lorg/anddev/andengine/engine/options/EngineOptions;
.super Ljava/lang/Object;
.source "EngineOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
    }
.end annotation


# instance fields
.field private final mCamera:Lorg/anddev/andengine/engine/camera/Camera;

.field private final mFullscreen:Z

.field private mLoadingScreenTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

.field private mNeedsMusic:Z

.field private mNeedsSound:Z

.field private final mRenderOptions:Lorg/anddev/andengine/engine/options/RenderOptions;

.field private final mResolutionPolicy:Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;

.field private final mScreenOrientation:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

.field private final mTouchOptions:Lorg/anddev/andengine/engine/options/TouchOptions;

.field private mWakeLockOptions:Lorg/anddev/andengine/engine/options/WakeLockOptions;


# direct methods
.method public constructor <init>(ZLorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pFullscreen"
    .parameter "pScreenOrientation"
    .parameter "pResolutionPolicy"
    .parameter "pCamera"

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lorg/anddev/andengine/engine/options/TouchOptions;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/options/TouchOptions;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mTouchOptions:Lorg/anddev/andengine/engine/options/TouchOptions;

    .line 26
    new-instance v0, Lorg/anddev/andengine/engine/options/RenderOptions;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/options/RenderOptions;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mRenderOptions:Lorg/anddev/andengine/engine/options/RenderOptions;

    .line 31
    sget-object v0, Lorg/anddev/andengine/engine/options/WakeLockOptions;->SCREEN_BRIGHT:Lorg/anddev/andengine/engine/options/WakeLockOptions;

    iput-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mWakeLockOptions:Lorg/anddev/andengine/engine/options/WakeLockOptions;

    .line 38
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mFullscreen:Z

    .line 39
    iput-object p2, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mScreenOrientation:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 40
    iput-object p3, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mResolutionPolicy:Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;

    .line 41
    iput-object p4, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 42
    return-void
.end method


# virtual methods
.method public getCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method public getLoadingScreenTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mLoadingScreenTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    return-object v0
.end method

.method public getRenderOptions()Lorg/anddev/andengine/engine/options/RenderOptions;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mRenderOptions:Lorg/anddev/andengine/engine/options/RenderOptions;

    return-object v0
.end method

.method public getResolutionPolicy()Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mResolutionPolicy:Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;

    return-object v0
.end method

.method public getScreenOrientation()Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mScreenOrientation:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    return-object v0
.end method

.method public getTouchOptions()Lorg/anddev/andengine/engine/options/TouchOptions;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mTouchOptions:Lorg/anddev/andengine/engine/options/TouchOptions;

    return-object v0
.end method

.method public getWakeLockOptions()Lorg/anddev/andengine/engine/options/WakeLockOptions;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mWakeLockOptions:Lorg/anddev/andengine/engine/options/WakeLockOptions;

    return-object v0
.end method

.method public hasLoadingScreen()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mLoadingScreenTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFullscreen()Z
    .locals 1

    .prologue
    .line 57
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mFullscreen:Z

    return v0
.end method

.method public needsMusic()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mNeedsMusic:Z

    return v0
.end method

.method public needsSound()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mNeedsSound:Z

    return v0
.end method

.method public setLoadingScreenTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/engine/options/EngineOptions;
    .locals 0
    .parameter "pLoadingScreenTextureSource"

    .prologue
    .line 81
    iput-object p1, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mLoadingScreenTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    .line 82
    return-object p0
.end method

.method public setNeedsMusic(Z)Lorg/anddev/andengine/engine/options/EngineOptions;
    .locals 0
    .parameter "pNeedsMusic"

    .prologue
    .line 99
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mNeedsMusic:Z

    .line 100
    return-object p0
.end method

.method public setNeedsSound(Z)Lorg/anddev/andengine/engine/options/EngineOptions;
    .locals 0
    .parameter "pNeedsSound"

    .prologue
    .line 90
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mNeedsSound:Z

    .line 91
    return-object p0
.end method

.method public setWakeLockOptions(Lorg/anddev/andengine/engine/options/WakeLockOptions;)Lorg/anddev/andengine/engine/options/EngineOptions;
    .locals 0
    .parameter "pWakeLockOptions"

    .prologue
    .line 108
    iput-object p1, p0, Lorg/anddev/andengine/engine/options/EngineOptions;->mWakeLockOptions:Lorg/anddev/andengine/engine/options/WakeLockOptions;

    .line 109
    return-object p0
.end method
