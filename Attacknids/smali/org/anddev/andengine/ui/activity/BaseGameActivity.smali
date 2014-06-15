.class public abstract Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.super Lorg/anddev/andengine/ui/activity/BaseActivity;
.source "BaseGameActivity.java"

# interfaces
.implements Lorg/anddev/andengine/ui/IGameInterface;


# static fields
.field private static synthetic $SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation:[I


# instance fields
.field protected mEngine:Lorg/anddev/andengine/engine/Engine;

.field private mGameLoaded:Z

.field protected mHasWindowFocused:Z

.field private mPaused:Z

.field protected mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static synthetic $SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation()[I
    .locals 3

    .prologue
    .line 36
    sget-object v0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->values()[Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    :try_start_1
    sget-object v1, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->PORTRAIT:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    sput-object v0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private acquireWakeLock(Lorg/anddev/andengine/engine/options/WakeLockOptions;)V
    .locals 4
    .parameter "pWakeLockOptions"

    .prologue
    .line 197
    const-string v2, "power"

    invoke-virtual {p0, v2}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 198
    .local v1, pm:Landroid/os/PowerManager;
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/WakeLockOptions;->getFlag()I

    move-result v2

    const/high16 v3, 0x2000

    or-int/2addr v2, v3

    const-string v3, "AndEngine"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 200
    :try_start_0
    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, e:Ljava/lang/SecurityException;
    const-string v2, "You have to add\n\t<uses-permission android:name=\"android.permission.WAKE_LOCK\"/>\nto your AndroidManifest.xml !"

    invoke-static {v2, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private applyEngineOptions(Lorg/anddev/andengine/engine/options/EngineOptions;)V
    .locals 2
    .parameter "pEngineOptions"

    .prologue
    .line 213
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/EngineOptions;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->requestFullscreen()V

    .line 217
    :cond_0
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsMusic()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsSound()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 218
    :cond_1
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->setVolumeControlStream(I)V

    .line 221
    :cond_2
    invoke-static {}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation()[I

    move-result-object v0

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/EngineOptions;->getScreenOrientation()Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 229
    :goto_0
    return-void

    .line 223
    :pswitch_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 226
    :pswitch_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 221
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private doPause()V
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    .line 176
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->releaseWakeLock()V

    .line 178
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->onPause()V

    .line 179
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->stop()V

    .line 180
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->onPause()V

    .line 181
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onGamePaused()V

    .line 182
    return-void
.end method

.method private doResume()V
    .locals 2

    .prologue
    .line 157
    iget-boolean v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mGameLoaded:Z

    if-nez v1, :cond_0

    .line 158
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onLoadResources()V

    .line 159
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    .line 160
    .local v0, scene:Lorg/anddev/andengine/entity/scene/Scene;
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/engine/Engine;->onLoadComplete(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 161
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onLoadComplete()V

    .line 162
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mGameLoaded:Z

    .line 165
    .end local v0           #scene:Lorg/anddev/andengine/entity/scene/Scene;
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    .line 166
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/options/EngineOptions;->getWakeLockOptions()Lorg/anddev/andengine/engine/options/WakeLockOptions;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->acquireWakeLock(Lorg/anddev/andengine/engine/options/WakeLockOptions;)V

    .line 167
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->onResume()V

    .line 169
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->onResume()V

    .line 170
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/Engine;->start()V

    .line 171
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onGameResumed()V

    .line 172
    return-void
.end method

.method private releaseWakeLock()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 210
    :cond_0
    return-void
.end method

.method private requestFullscreen()V
    .locals 2

    .prologue
    .line 238
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 239
    .local v0, window:Landroid/view/Window;
    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 240
    const/16 v1, 0x800

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 241
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 242
    return-void
.end method


# virtual methods
.method protected createSurfaceViewLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 232
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 233
    .local v0, layoutParams:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 234
    return-object v0
.end method

.method protected disableAccelerometerSensor()Z
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->disableAccelerometerSensor(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method protected disableLocationSensor()V
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->disableLocationSensor(Landroid/content/Context;)V

    .line 260
    return-void
.end method

.method protected disableOrientationSensor()Z
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->disableOrientationSensor(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method protected enableAccelerometerSensor(Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;)Z
    .locals 1
    .parameter "pAccelerometerListener"

    .prologue
    .line 266
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1}, Lorg/anddev/andengine/engine/Engine;->enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;)Z

    move-result v0

    return v0
.end method

.method protected enableAccelerometerSensor(Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z
    .locals 1
    .parameter "pAccelerometerListener"
    .parameter "pAccelerometerSensorOptions"

    .prologue
    .line 273
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z

    move-result v0

    return v0
.end method

.method protected enableLocationSensor(Lorg/anddev/andengine/sensor/location/ILocationListener;Lorg/anddev/andengine/sensor/location/LocationSensorOptions;)V
    .locals 1
    .parameter "pLocationListener"
    .parameter "pLocationSensorOptions"

    .prologue
    .line 252
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableLocationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/location/ILocationListener;Lorg/anddev/andengine/sensor/location/LocationSensorOptions;)V

    .line 253
    return-void
.end method

.method protected enableOrientationSensor(Lorg/anddev/andengine/sensor/orientation/IOrientationListener;)Z
    .locals 1
    .parameter "pOrientationListener"

    .prologue
    .line 287
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1}, Lorg/anddev/andengine/engine/Engine;->enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;)Z

    move-result v0

    return v0
.end method

.method protected enableOrientationSensor(Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z
    .locals 1
    .parameter "pOrientationListener"
    .parameter "pLocationSensorOptions"

    .prologue
    .line 294
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z

    move-result v0

    return v0
.end method

.method protected enableVibrator()V
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/engine/Engine;->enableVibrator(Landroid/content/Context;)Z

    .line 246
    return-void
.end method

.method public getEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    return-object v0
.end method

.method public getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v0

    return-object v0
.end method

.method public getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "pSavedInstanceState"

    .prologue
    .line 58
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    .line 61
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onLoadEngine()Lorg/anddev/andengine/engine/Engine;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    .line 63
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->applyEngineOptions(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 65
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onSetContentView()V

    .line 66
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 105
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity;->onDestroy()V

    .line 107
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->interruptUpdateThread()V

    .line 109
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onUnloadResources()V

    .line 110
    return-void
.end method

.method public onGamePaused()V
    .locals 0

    .prologue
    .line 150
    return-void
.end method

.method public onGameResumed()V
    .locals 0

    .prologue
    .line 145
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 96
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity;->onPause()V

    .line 98
    iget-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    if-nez v0, :cond_0

    .line 99
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->doPause()V

    .line 101
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 70
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity;->onResume()V

    .line 72
    iget-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mHasWindowFocused:Z

    if-eqz v0, :cond_0

    .line 73
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->doResume()V

    .line 75
    :cond_0
    return-void
.end method

.method protected onSetContentView()V
    .locals 2

    .prologue
    .line 189
    new-instance v0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setEGLConfigChooser(Z)V

    .line 191
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setRenderer(Lorg/anddev/andengine/engine/Engine;)V

    .line 193
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mRenderSurfaceView:Lorg/anddev/andengine/opengl/view/RenderSurfaceView;

    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->createSurfaceViewLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    return-void
.end method

.method public onUnloadResources()V
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsMusic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/music/MusicManager;->releaseAll()V

    .line 117
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsSound()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 118
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->releaseAll()V

    .line 120
    :cond_1
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .parameter "pHasWindowFocus"

    .prologue
    .line 79
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity;->onWindowFocusChanged(Z)V

    .line 81
    if-eqz p1, :cond_1

    .line 82
    iget-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    if-eqz v0, :cond_0

    .line 83
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->doResume()V

    .line 85
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mHasWindowFocused:Z

    .line 92
    :goto_0
    return-void

    .line 87
    :cond_1
    iget-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mPaused:Z

    if-nez v0, :cond_2

    .line 88
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->doPause()V

    .line 90
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mHasWindowFocused:Z

    goto :goto_0
.end method

.method public runOnUpdateThread(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "pRunnable"

    .prologue
    .line 185
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/Engine;->runOnUpdateThread(Ljava/lang/Runnable;)V

    .line 186
    return-void
.end method
