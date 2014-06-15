.class public abstract Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;
.super Lnet/rbgrn/opengl/GLWallpaperService;
.source "BaseLiveWallpaperService.java"

# interfaces
.implements Lorg/anddev/andengine/ui/IGameInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;
    }
.end annotation


# instance fields
.field protected mEngine:Lorg/anddev/andengine/engine/Engine;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLWallpaperService;-><init>()V

    return-void
.end method


# virtual methods
.method protected applyEngineOptions(Lorg/anddev/andengine/engine/options/EngineOptions;)V
    .locals 0
    .parameter "pEngineOptions"

    .prologue
    .line 135
    return-void
.end method

.method protected disableLocationSensor()V
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->disableLocationSensor(Landroid/content/Context;)V

    .line 170
    return-void
.end method

.method protected disableOrientationSensor()Z
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->disableOrientationSensor(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method protected enableAccelerometerSensor(Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;)Z
    .locals 1
    .parameter "pAccelerometerListener"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1}, Lorg/anddev/andengine/engine/Engine;->enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;)Z

    move-result v0

    return v0
.end method

.method protected enableAccelerometerSensor(Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z
    .locals 1
    .parameter "pAccelerometerListener"
    .parameter "pAccelerometerSensorOptions"

    .prologue
    .line 146
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z

    move-result v0

    return v0
.end method

.method protected enableLocationSensor(Lorg/anddev/andengine/sensor/location/ILocationListener;Lorg/anddev/andengine/sensor/location/LocationSensorOptions;)V
    .locals 1
    .parameter "pLocationListener"
    .parameter "pLocationSensorOptions"

    .prologue
    .line 165
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableLocationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/location/ILocationListener;Lorg/anddev/andengine/sensor/location/LocationSensorOptions;)V

    .line 166
    return-void
.end method

.method protected enableOrientationSensor(Lorg/anddev/andengine/sensor/orientation/IOrientationListener;)Z
    .locals 1
    .parameter "pOrientationListener"

    .prologue
    .line 150
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1}, Lorg/anddev/andengine/engine/Engine;->enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;)Z

    move-result v0

    return v0
.end method

.method protected enableOrientationSensor(Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z
    .locals 1
    .parameter "pOrientationListener"
    .parameter "pOrientationSensorOptions"

    .prologue
    .line 154
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z

    move-result v0

    return v0
.end method

.method protected enableVibrator()Z
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->enableVibrator(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public getEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    return-object v0
.end method

.method public getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v0

    return-object v0
.end method

.method public getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 41
    invoke-super {p0}, Lnet/rbgrn/opengl/GLWallpaperService;->onCreate()V

    .line 43
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onLoadEngine()Lorg/anddev/andengine/engine/Engine;

    move-result-object v1

    iput-object v1, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    .line 44
    iget-object v1, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->applyEngineOptions(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 46
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onLoadResources()V

    .line 47
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    .line 48
    .local v0, scene:Lorg/anddev/andengine/entity/scene/Scene;
    iget-object v1, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/engine/Engine;->onLoadComplete(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 49
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onLoadComplete()V

    .line 50
    iget-object v1, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->start()V

    .line 51
    return-void
.end method

.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .locals 1

    .prologue
    .line 94
    new-instance v0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService$BaseWallpaperGLEngine;-><init>(Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;)V

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 85
    invoke-super {p0}, Lnet/rbgrn/opengl/GLWallpaperService;->onDestroy()V

    .line 87
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->interruptUpdateThread()V

    .line 89
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onUnloadResources()V

    .line 90
    return-void
.end method

.method protected onDrop(II)V
    .locals 0
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 131
    return-void
.end method

.method public onGamePaused()V
    .locals 0

    .prologue
    .line 100
    return-void
.end method

.method public onGameResumed()V
    .locals 0

    .prologue
    .line 105
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->stop()V

    .line 75
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onGamePaused()V

    .line 76
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->start()V

    .line 80
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->onGameResumed()V

    .line 81
    return-void
.end method

.method protected onTap(II)V
    .locals 10
    .parameter "pX"
    .parameter "pY"

    .prologue
    const/4 v4, 0x0

    .line 126
    iget-object v8, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    const/4 v9, 0x0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    int-to-float v5, p1

    int-to-float v6, p2

    move v7, v4

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v8, v9, v0}, Lorg/anddev/andengine/engine/Engine;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 127
    return-void
.end method

.method public onUnloadResources()V
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsMusic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/music/MusicManager;->releaseAll()V

    .line 112
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsSound()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->releaseAll()V

    .line 115
    :cond_1
    return-void
.end method

.method public runOnUpdateThread(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "pRunnable"

    .prologue
    .line 122
    iget-object v0, p0, Lorg/anddev/andengine/extension/ui/livewallpaper/BaseLiveWallpaperService;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/Engine;->runOnUpdateThread(Ljava/lang/Runnable;)V

    .line 123
    return-void
.end method
