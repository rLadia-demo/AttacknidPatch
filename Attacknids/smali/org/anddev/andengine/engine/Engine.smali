.class public Lorg/anddev/andengine/engine/Engine;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;
.implements Lorg/anddev/andengine/util/constants/TimeConstants;
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/engine/Engine$State;,
        Lorg/anddev/andengine/engine/Engine$UpdateThread;
    }
.end annotation


# static fields
.field private static final LOADING_SCREEN_DURATION_DEFAULT:F = 2.0f

.field private static final SENSORDELAY_DEFAULT:Lorg/anddev/andengine/sensor/SensorDelay;


# instance fields
.field private mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

.field private mAccelerometerListener:Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;

.field private final mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

.field protected final mCamera:Lorg/anddev/andengine/engine/camera/Camera;

.field private final mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

.field private final mFontManager:Lorg/anddev/andengine/opengl/font/FontManager;

.field private mIsMethodTracing:Z

.field private mLastTick:J

.field private mLocation:Landroid/location/Location;

.field private mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

.field private mMusicManager:Lorg/anddev/andengine/audio/music/MusicManager;

.field private mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

.field private mOrientationListener:Lorg/anddev/andengine/sensor/orientation/IOrientationListener;

.field private mRunning:Z

.field protected mScene:Lorg/anddev/andengine/entity/scene/Scene;

.field private mSecondsElapsedTotal:F

.field private mSoundManager:Lorg/anddev/andengine/audio/sound/SoundManager;

.field protected mSurfaceHeight:I

.field protected mSurfaceWidth:I

.field private final mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

.field private final mThreadLocker:Lorg/anddev/andengine/engine/Engine$State;

.field private mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

.field private final mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

.field private final mUpdateThread:Lorg/anddev/andengine/engine/Engine$UpdateThread;

.field private final mUpdateThreadRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->GAME:Lorg/anddev/andengine/sensor/SensorDelay;

    sput-object v0, Lorg/anddev/andengine/engine/Engine;->SENSORDELAY_DEFAULT:Lorg/anddev/andengine/sensor/SensorDelay;

    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V
    .locals 3
    .parameter "pEngineOptions"

    .prologue
    const/4 v2, 0x1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    .line 80
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/anddev/andengine/engine/Engine;->mLastTick:J

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/engine/Engine;->mSecondsElapsedTotal:F

    .line 83
    new-instance v0, Lorg/anddev/andengine/engine/Engine$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/anddev/andengine/engine/Engine$State;-><init>(Lorg/anddev/andengine/engine/Engine$State;)V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mThreadLocker:Lorg/anddev/andengine/engine/Engine$State;

    .line 85
    new-instance v0, Lorg/anddev/andengine/engine/Engine$UpdateThread;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/engine/Engine$UpdateThread;-><init>(Lorg/anddev/andengine/engine/Engine;)V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThread:Lorg/anddev/andengine/engine/Engine$UpdateThread;

    .line 87
    new-instance v0, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThreadRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    .line 96
    new-instance v0, Lorg/anddev/andengine/opengl/texture/TextureManager;

    invoke-direct {v0}, Lorg/anddev/andengine/opengl/texture/TextureManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    .line 97
    new-instance v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    invoke-direct {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    .line 98
    new-instance v0, Lorg/anddev/andengine/opengl/font/FontManager;

    invoke-direct {v0}, Lorg/anddev/andengine/opengl/font/FontManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mFontManager:Lorg/anddev/andengine/opengl/font/FontManager;

    .line 113
    new-instance v0, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    .line 115
    iput v2, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceWidth:I

    .line 116
    iput v2, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceHeight:I

    .line 125
    const-string v0, ""

    invoke-static {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 126
    const-string v0, ""

    invoke-static {v0}, Lorg/anddev/andengine/audio/sound/SoundFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 127
    const-string v0, ""

    invoke-static {v0}, Lorg/anddev/andengine/audio/music/MusicFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 128
    const-string v0, ""

    invoke-static {v0}, Lorg/anddev/andengine/opengl/font/FontFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    invoke-static {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->setActiveInstance(Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;)V

    .line 132
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    .line 133
    new-instance v0, Lorg/anddev/andengine/input/touch/controller/SingleTouchControler;

    invoke-direct {v0}, Lorg/anddev/andengine/input/touch/controller/SingleTouchControler;-><init>()V

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/Engine;->setTouchController(Lorg/anddev/andengine/input/touch/controller/ITouchController;)V

    .line 134
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/options/EngineOptions;->getCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 136
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsSound()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    new-instance v0, Lorg/anddev/andengine/audio/sound/SoundManager;

    invoke-direct {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mSoundManager:Lorg/anddev/andengine/audio/sound/SoundManager;

    .line 140
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->needsMusic()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 141
    new-instance v0, Lorg/anddev/andengine/audio/music/MusicManager;

    invoke-direct {v0}, Lorg/anddev/andengine/audio/music/MusicManager;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mMusicManager:Lorg/anddev/andengine/audio/music/MusicManager;

    .line 144
    :cond_1
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->hasLoadingScreen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 145
    invoke-direct {p0}, Lorg/anddev/andengine/engine/Engine;->initLoadingScreen()V

    .line 148
    :cond_2
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThread:Lorg/anddev/andengine/engine/Engine$UpdateThread;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$UpdateThread;->start()V

    .line 149
    return-void
.end method

.method private getNanosecondsElapsed()J
    .locals 4

    .prologue
    .line 528
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 530
    .local v0, now:J
    iget-wide v2, p0, Lorg/anddev/andengine/engine/Engine;->mLastTick:J

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/anddev/andengine/engine/Engine;->calculateNanosecondsElapsed(JJ)J

    move-result-wide v2

    return-wide v2
.end method

.method private initLoadingScreen()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 416
    iget-object v3, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v3}, Lorg/anddev/andengine/engine/options/EngineOptions;->getLoadingScreenTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v2

    .line 417
    .local v2, loadingScreenTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {v2}, Lorg/anddev/andengine/opengl/texture/TextureFactory;->createForTextureSourceSize(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    .line 418
    .local v0, loadingScreenTexture:Lorg/anddev/andengine/opengl/texture/Texture;
    invoke-static {v0, v2, v4, v4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v1

    .line 419
    .local v1, loadingScreenTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    new-instance v3, Lorg/anddev/andengine/entity/scene/SplashScene;

    invoke-virtual {p0}, Lorg/anddev/andengine/engine/Engine;->getCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/anddev/andengine/entity/scene/SplashScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    invoke-virtual {p0, v3}, Lorg/anddev/andengine/engine/Engine;->setScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 420
    return-void
.end method

.method private isSensorSupported(Landroid/hardware/SensorManager;I)Z
    .locals 1
    .parameter "pSensorManager"
    .parameter "pType"

    .prologue
    .line 656
    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private registerSelfAsSensorListener(Landroid/hardware/SensorManager;ILorg/anddev/andengine/sensor/SensorDelay;)V
    .locals 3
    .parameter "pSensorManager"
    .parameter "pType"
    .parameter "pSensorDelay"

    .prologue
    .line 660
    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 661
    .local v0, sensor:Landroid/hardware/Sensor;
    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/SensorDelay;->getDelay()I

    move-result v1

    invoke-virtual {p1, p0, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 662
    return-void
.end method

.method private unregisterSelfAsSensorListener(Landroid/hardware/SensorManager;I)V
    .locals 3
    .parameter "pSensorManager"
    .parameter "pType"

    .prologue
    .line 665
    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 666
    .local v0, sensor:Landroid/hardware/Sensor;
    invoke-virtual {p1, p0, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 667
    return-void
.end method

.method private yieldDraw()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 475
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mThreadLocker:Lorg/anddev/andengine/engine/Engine$State;

    .line 476
    .local v0, threadLocker:Lorg/anddev/andengine/engine/Engine$State;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$State;->notifyCanDraw()V

    .line 477
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$State;->waitUntilCanUpdate()V

    .line 478
    return-void
.end method


# virtual methods
.method protected calculateNanosecondsElapsed(JJ)J
    .locals 2
    .parameter "pNow"
    .parameter "pLastTick"

    .prologue
    .line 534
    sub-long v0, p1, p3

    return-wide v0
.end method

.method public clearUpdateHandlers()V
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->clear()V

    .line 250
    return-void
.end method

.method protected convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 2
    .parameter "pCamera"
    .parameter "pSurfaceTouchEvent"

    .prologue
    .line 442
    iget v0, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceWidth:I

    iget v1, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V

    .line 443
    return-void
.end method

.method public disableAccelerometerSensor(Landroid/content/Context;)Z
    .locals 3
    .parameter "pContext"

    .prologue
    const/4 v1, 0x1

    .line 605
    const-string v2, "sensor"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 606
    .local v0, sensorManager:Landroid/hardware/SensorManager;
    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/engine/Engine;->isSensorSupported(Landroid/hardware/SensorManager;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 607
    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/engine/Engine;->unregisterSelfAsSensorListener(Landroid/hardware/SensorManager;I)V

    .line 610
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public disableLocationSensor(Landroid/content/Context;)V
    .locals 2
    .parameter "pContext"

    .prologue
    .line 569
    const-string v1, "location"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    .line 570
    .local v0, locationManager:Landroid/location/LocationManager;
    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 571
    return-void
.end method

.method public disableOrientationSensor(Landroid/content/Context;)Z
    .locals 3
    .parameter "pContext"

    .prologue
    const/4 v2, 0x3

    .line 646
    const-string v1, "sensor"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 647
    .local v0, sensorManager:Landroid/hardware/SensorManager;
    invoke-direct {p0, v0, v2}, Lorg/anddev/andengine/engine/Engine;->isSensorSupported(Landroid/hardware/SensorManager;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 648
    invoke-direct {p0, v0, v2}, Lorg/anddev/andengine/engine/Engine;->unregisterSelfAsSensorListener(Landroid/hardware/SensorManager;I)V

    .line 649
    const/4 v1, 0x1

    .line 651
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;)Z
    .locals 2
    .parameter "pContext"
    .parameter "pAccelerometerListener"

    .prologue
    .line 577
    new-instance v0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;

    sget-object v1, Lorg/anddev/andengine/engine/Engine;->SENSORDELAY_DEFAULT:Lorg/anddev/andengine/sensor/SensorDelay;

    invoke-direct {v0, v1}, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;-><init>(Lorg/anddev/andengine/sensor/SensorDelay;)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/anddev/andengine/engine/Engine;->enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z

    move-result v0

    return v0
.end method

.method public enableAccelerometerSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;)Z
    .locals 3
    .parameter "pContext"
    .parameter "pAccelerometerListener"
    .parameter "pAccelerometerSensorOptions"

    .prologue
    const/4 v1, 0x1

    .line 584
    const-string v2, "sensor"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 585
    .local v0, sensorManager:Landroid/hardware/SensorManager;
    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/engine/Engine;->isSensorSupported(Landroid/hardware/SensorManager;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 586
    iput-object p2, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerListener:Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;

    .line 588
    iget-object v2, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    if-nez v2, :cond_0

    .line 589
    new-instance v2, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    invoke-direct {v2}, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;-><init>()V

    iput-object v2, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    .line 592
    :cond_0
    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerSensorOptions;->getSensorDelay()Lorg/anddev/andengine/sensor/SensorDelay;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/anddev/andengine/engine/Engine;->registerSelfAsSensorListener(Landroid/hardware/SensorManager;ILorg/anddev/andengine/sensor/SensorDelay;)V

    .line 596
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public enableLocationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/location/ILocationListener;Lorg/anddev/andengine/sensor/location/LocationSensorOptions;)V
    .locals 6
    .parameter "pContext"
    .parameter "pLocationListener"
    .parameter "pLocationSensorOptions"

    .prologue
    .line 559
    iput-object p2, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    .line 561
    const-string v2, "location"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    .line 562
    .local v0, locationManager:Landroid/location/LocationManager;
    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->isEnabledOnly()Z

    move-result v2

    invoke-virtual {v0, p3, v2}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v1

    .line 563
    .local v1, locationProvider:Ljava/lang/String;
    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->getMinimumTriggerTime()J

    move-result-wide v2

    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->getMinimumTriggerDistance()J

    move-result-wide v4

    long-to-float v4, v4

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 565
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/anddev/andengine/engine/Engine;->onLocationChanged(Landroid/location/Location;)V

    .line 566
    return-void
.end method

.method public enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;)Z
    .locals 2
    .parameter "pContext"
    .parameter "pOrientationListener"

    .prologue
    .line 618
    new-instance v0, Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;

    sget-object v1, Lorg/anddev/andengine/engine/Engine;->SENSORDELAY_DEFAULT:Lorg/anddev/andengine/sensor/SensorDelay;

    invoke-direct {v0, v1}, Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;-><init>(Lorg/anddev/andengine/sensor/SensorDelay;)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/anddev/andengine/engine/Engine;->enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z

    move-result v0

    return v0
.end method

.method public enableOrientationSensor(Landroid/content/Context;Lorg/anddev/andengine/sensor/orientation/IOrientationListener;Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;)Z
    .locals 3
    .parameter "pContext"
    .parameter "pOrientationListener"
    .parameter "pOrientationSensorOptions"

    .prologue
    const/4 v2, 0x3

    .line 625
    const-string v1, "sensor"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 626
    .local v0, sensorManager:Landroid/hardware/SensorManager;
    invoke-direct {p0, v0, v2}, Lorg/anddev/andengine/engine/Engine;->isSensorSupported(Landroid/hardware/SensorManager;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 627
    iput-object p2, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationListener:Lorg/anddev/andengine/sensor/orientation/IOrientationListener;

    .line 629
    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

    if-nez v1, :cond_0

    .line 630
    new-instance v1, Lorg/anddev/andengine/sensor/orientation/OrientationData;

    invoke-direct {v1}, Lorg/anddev/andengine/sensor/orientation/OrientationData;-><init>()V

    iput-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

    .line 633
    :cond_0
    invoke-virtual {p3}, Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;->getSensorDelay()Lorg/anddev/andengine/sensor/SensorDelay;

    move-result-object v1

    invoke-direct {p0, v0, v2, v1}, Lorg/anddev/andengine/engine/Engine;->registerSelfAsSensorListener(Landroid/hardware/SensorManager;ILorg/anddev/andengine/sensor/SensorDelay;)V

    .line 635
    const/4 v1, 0x1

    .line 637
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public enableVibrator(Landroid/content/Context;)Z
    .locals 1
    .parameter "pContext"

    .prologue
    .line 538
    const-string v0, "vibrator"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    .line 539
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAccelerometerData()Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    return-object v0
.end method

.method public getCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method protected getCameraFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 434
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/Engine;->getCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    return-object v0
.end method

.method public getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    return-object v0
.end method

.method public getFontManager()Lorg/anddev/andengine/opengl/font/FontManager;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mFontManager:Lorg/anddev/andengine/opengl/font/FontManager;

    return-object v0
.end method

.method public getMusicManager()Lorg/anddev/andengine/audio/music/MusicManager;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 233
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mMusicManager:Lorg/anddev/andengine/audio/music/MusicManager;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mMusicManager:Lorg/anddev/andengine/audio/music/MusicManager;

    return-object v0

    .line 236
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "To enable the MusicManager, check the EngineOptions!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOrientationData()Lorg/anddev/andengine/sensor/orientation/OrientationData;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

    return-object v0
.end method

.method public getScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    return-object v0
.end method

.method protected getSceneFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 438
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    return-object v0
.end method

.method public getSecondsElapsedTotal()F
    .locals 1

    .prologue
    .line 189
    iget v0, p0, Lorg/anddev/andengine/engine/Engine;->mSecondsElapsedTotal:F

    return v0
.end method

.method public getSoundManager()Lorg/anddev/andengine/audio/sound/SoundManager;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mSoundManager:Lorg/anddev/andengine/audio/sound/SoundManager;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mSoundManager:Lorg/anddev/andengine/audio/sound/SoundManager;

    return-object v0

    .line 228
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "To enable the SoundManager, check the EngineOptions!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSurfaceHeight()I
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceHeight:I

    return v0
.end method

.method public getSurfaceWidth()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceWidth:I

    return v0
.end method

.method public getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    return-object v0
.end method

.method public getTouchController()Lorg/anddev/andengine/input/touch/controller/ITouchController;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    return-object v0
.end method

.method public interruptUpdateThread()V
    .locals 1

    .prologue
    .line 412
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThread:Lorg/anddev/andengine/engine/Engine$UpdateThread;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$UpdateThread;->interrupt()V

    .line 413
    return-void
.end method

.method public isMethodTracing()Z
    .locals 1

    .prologue
    .line 261
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mIsMethodTracing:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 156
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2
    .parameter "pSensor"
    .parameter "pAccuracy"

    .prologue
    .line 284
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-eqz v0, :cond_0

    .line 285
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 287
    :pswitch_0
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    invoke-virtual {v0, p2}, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->setAccuracy(I)V

    .line 288
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerListener:Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;

    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;->onAccelerometerChanged(Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;)V

    goto :goto_0

    .line 285
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3
    .parameter "pGL"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 504
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mThreadLocker:Lorg/anddev/andengine/engine/Engine$State;

    .line 506
    .local v0, threadLocker:Lorg/anddev/andengine/engine/Engine$State;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$State;->waitUntilCanDraw()V

    .line 508
    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    invoke-virtual {v1, p1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->updateTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 509
    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mFontManager:Lorg/anddev/andengine/opengl/font/FontManager;

    invoke-virtual {v1, p1}, Lorg/anddev/andengine/opengl/font/FontManager;->updateFonts(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 510
    sget-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    if-eqz v1, :cond_0

    .line 511
    iget-object v2, p0, Lorg/anddev/andengine/engine/Engine;->mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    move-object v1, p1

    check-cast v1, Ljavax/microedition/khronos/opengles/GL11;

    invoke-virtual {v2, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->updateBufferObjects(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 514
    :cond_0
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/Engine;->onDrawScene(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 516
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine$State;->notifyCanUpdate()V

    .line 517
    return-void
.end method

.method protected onDrawScene(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 520
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/Engine;->getCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 522
    .local v0, camera:Lorg/anddev/andengine/engine/camera/Camera;
    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v1, p1, v0}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 524
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 525
    return-void
.end method

.method public onLoadComplete(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 3
    .parameter "pScene"

    .prologue
    .line 447
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->hasLoadingScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 448
    new-instance v0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    const/high16 v1, 0x4000

    new-instance v2, Lorg/anddev/andengine/engine/Engine$1;

    invoke-direct {v2, p0, p1}, Lorg/anddev/andengine/engine/Engine$1;-><init>(Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/entity/scene/Scene;)V

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/Engine;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 458
    :goto_0
    return-void

    .line 456
    :cond_0
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/Engine;->setScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    goto :goto_0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 1
    .parameter "pLocation"

    .prologue
    .line 312
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocation:Landroid/location/Location;

    if-nez v0, :cond_0

    .line 313
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine;->mLocation:Landroid/location/Location;

    .line 322
    :goto_0
    return-void

    .line 315
    :cond_0
    if-nez p1, :cond_1

    .line 316
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    invoke-interface {v0}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationLost()V

    goto :goto_0

    .line 318
    :cond_1
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine;->mLocation:Landroid/location/Location;

    .line 319
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    invoke-interface {v0, p1}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationChanged(Landroid/location/Location;)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 431
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 1
    .parameter "pProvider"

    .prologue
    .line 326
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    invoke-interface {v0}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationProviderDisabled()V

    .line 327
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 1
    .parameter "pProvider"

    .prologue
    .line 331
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    invoke-interface {v0}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationProviderEnabled()V

    .line 332
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTextureManager:Lorg/anddev/andengine/opengl/texture/TextureManager;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/TextureManager;->reloadTextures()V

    .line 424
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mFontManager:Lorg/anddev/andengine/opengl/font/FontManager;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/font/FontManager;->reloadFonts()V

    .line 425
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    invoke-static {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->setActiveInstance(Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;)V

    .line 426
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mBufferObjectManager:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->reloadBufferObjects()V

    .line 427
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 2
    .parameter "pEvent"

    .prologue
    .line 296
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 308
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 299
    :pswitch_1
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->setValues([F)V

    .line 300
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerListener:Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;

    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mAccelerometerData:Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/sensor/accelerometer/IAccelerometerListener;->onAccelerometerChanged(Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;)V

    goto :goto_0

    .line 303
    :pswitch_2
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/sensor/orientation/OrientationData;->setValues([F)V

    .line 304
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationListener:Lorg/anddev/andengine/sensor/orientation/IOrientationListener;

    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mOrientationData:Lorg/anddev/andengine/sensor/orientation/OrientationData;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/sensor/orientation/IOrientationListener;->onOrientationChanged(Lorg/anddev/andengine/sensor/orientation/OrientationData;)V

    goto :goto_0

    .line 297
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 2
    .parameter "pProvider"
    .parameter "pStatus"
    .parameter "pExtras"

    .prologue
    .line 336
    packed-switch p2, :pswitch_data_0

    .line 347
    :goto_0
    return-void

    .line 338
    :pswitch_0
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->AVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    invoke-interface {v0, v1, p3}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationProviderStatusChanged(Lorg/anddev/andengine/sensor/location/LocationProviderStatus;Landroid/os/Bundle;)V

    goto :goto_0

    .line 341
    :pswitch_1
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->OUT_OF_SERVICE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    invoke-interface {v0, v1, p3}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationProviderStatusChanged(Lorg/anddev/andengine/sensor/location/LocationProviderStatus;Landroid/os/Bundle;)V

    goto :goto_0

    .line 344
    :pswitch_2
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mLocationListener:Lorg/anddev/andengine/sensor/location/ILocationListener;

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->TEMPORARILY_UNAVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    invoke-interface {v0, v1, p3}, Lorg/anddev/andengine/sensor/location/ILocationListener;->onLocationProviderStatusChanged(Lorg/anddev/andengine/sensor/location/LocationProviderStatus;Landroid/os/Bundle;)V

    goto :goto_0

    .line 336
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method onTickUpdate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 461
    iget-boolean v2, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-eqz v2, :cond_0

    .line 462
    invoke-direct {p0}, Lorg/anddev/andengine/engine/Engine;->getNanosecondsElapsed()J

    move-result-wide v0

    .line 464
    .local v0, secondsElapsed:J
    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/engine/Engine;->onUpdate(J)V

    .line 466
    invoke-direct {p0}, Lorg/anddev/andengine/engine/Engine;->yieldDraw()V

    .line 472
    .end local v0           #secondsElapsed:J
    :goto_0
    return-void

    .line 468
    :cond_0
    invoke-direct {p0}, Lorg/anddev/andengine/engine/Engine;->yieldDraw()V

    .line 470
    const-wide/16 v2, 0x10

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "pView"
    .parameter "pSurfaceMotionEvent"

    .prologue
    .line 351
    iget-boolean v2, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-eqz v2, :cond_0

    .line 352
    iget-object v2, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    invoke-interface {v2, p2}, Lorg/anddev/andengine/input/touch/controller/ITouchController;->onHandleMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 358
    .local v1, handled:Z
    const-wide/16 v2, 0x14

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    .end local v1           #handled:Z
    :goto_0
    return v1

    .line 359
    .restart local v1       #handled:Z
    :catch_0
    move-exception v0

    .line 360
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 364
    .end local v0           #e:Ljava/lang/InterruptedException;
    .end local v1           #handled:Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 3
    .parameter "pSurfaceTouchEvent"

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/Engine;->getSceneFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v1

    .line 375
    .local v1, scene:Lorg/anddev/andengine/entity/scene/Scene;
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/engine/Engine;->getCameraFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 377
    .local v0, camera:Lorg/anddev/andengine/engine/camera/Camera;
    invoke-virtual {p0, v0, p1}, Lorg/anddev/andengine/engine/Engine;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 379
    invoke-virtual {p0, v0, p1}, Lorg/anddev/andengine/engine/Engine;->onTouchHUD(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 380
    const/4 v2, 0x1

    .line 383
    :goto_0
    return v2

    :cond_0
    invoke-virtual {p0, v1, p1}, Lorg/anddev/andengine/engine/Engine;->onTouchScene(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v2

    goto :goto_0
.end method

.method protected onTouchHUD(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pCamera"
    .parameter "pSceneTouchEvent"

    .prologue
    .line 388
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->hasHUD()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getHUD()Lorg/anddev/andengine/engine/camera/hud/HUD;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/anddev/andengine/engine/camera/hud/HUD;->onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    .line 391
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onTouchScene(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pScene"
    .parameter "pSceneTouchEvent"

    .prologue
    .line 396
    if-eqz p1, :cond_0

    .line 397
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/scene/Scene;->onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    .line 399
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onUpdate(J)V
    .locals 3
    .parameter "pNanosecondsElapsed"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 481
    long-to-float v1, p1

    const v2, 0x4e6e6b28

    div-float v0, v1, v2

    .line 483
    .local v0, pSecondsElapsed:F
    iget v1, p0, Lorg/anddev/andengine/engine/Engine;->mSecondsElapsedTotal:F

    add-float/2addr v1, v0

    iput v1, p0, Lorg/anddev/andengine/engine/Engine;->mSecondsElapsedTotal:F

    .line 484
    iget-wide v1, p0, Lorg/anddev/andengine/engine/Engine;->mLastTick:J

    add-long/2addr v1, p1

    iput-wide v1, p0, Lorg/anddev/andengine/engine/Engine;->mLastTick:J

    .line 486
    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    invoke-interface {v1, v0}, Lorg/anddev/andengine/input/touch/controller/ITouchController;->onUpdate(F)V

    .line 487
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/Engine;->updateUpdateHandlers(F)V

    .line 488
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/Engine;->onUpdateScene(F)V

    .line 489
    return-void
.end method

.method protected onUpdateScene(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 492
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onUpdate(F)V

    .line 495
    :cond_0
    return-void
.end method

.method public registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V
    .locals 1
    .parameter "pUpdateHandler"

    .prologue
    .line 253
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->add(Ljava/lang/Object;)Z

    .line 254
    return-void
.end method

.method public runOnUpdateThread(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "pRunnable"

    .prologue
    .line 408
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThreadRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->postRunnable(Ljava/lang/Runnable;)V

    .line 409
    return-void
.end method

.method public setScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter "pScene"

    .prologue
    .line 177
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 178
    return-void
.end method

.method public setSurfaceSize(II)V
    .locals 0
    .parameter "pSurfaceWidth"
    .parameter "pSurfaceHeight"

    .prologue
    .line 194
    iput p1, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceWidth:I

    .line 195
    iput p2, p0, Lorg/anddev/andengine/engine/Engine;->mSurfaceHeight:I

    .line 196
    return-void
.end method

.method public setTouchController(Lorg/anddev/andengine/input/touch/controller/ITouchController;)V
    .locals 2
    .parameter "pTouchController"

    .prologue
    .line 211
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    .line 212
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine;->mEngineOptions:Lorg/anddev/andengine/engine/options/EngineOptions;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/options/EngineOptions;->getTouchOptions()Lorg/anddev/andengine/engine/options/TouchOptions;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/anddev/andengine/input/touch/controller/ITouchController;->applyTouchOptions(Lorg/anddev/andengine/engine/options/TouchOptions;)V

    .line 213
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mTouchController:Lorg/anddev/andengine/input/touch/controller/ITouchController;

    invoke-interface {v0, p0}, Lorg/anddev/andengine/input/touch/controller/ITouchController;->setTouchEventCallback(Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;)V

    .line 214
    return-void
.end method

.method public declared-synchronized start()V
    .locals 2

    .prologue
    .line 160
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-nez v0, :cond_0

    .line 161
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/anddev/andengine/engine/Engine;->mLastTick:J

    .line 162
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    :cond_0
    monitor-exit p0

    return-void

    .line 160
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public startMethodTracing(Ljava/lang/String;)V
    .locals 1
    .parameter "pTraceFileName"

    .prologue
    .line 265
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mIsMethodTracing:Z

    if-nez v0, :cond_0

    .line 266
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mIsMethodTracing:Z

    .line 267
    invoke-static {p1}, Landroid/os/Debug;->startMethodTracing(Ljava/lang/String;)V

    .line 269
    :cond_0
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 1

    .prologue
    .line 167
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z

    if-eqz v0, :cond_0

    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :cond_0
    monitor-exit p0

    return-void

    .line 167
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public stopMethodTracing()V
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mIsMethodTracing:Z

    if-eqz v0, :cond_0

    .line 273
    invoke-static {}, Landroid/os/Debug;->stopMethodTracing()V

    .line 274
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine;->mIsMethodTracing:Z

    .line 276
    :cond_0
    return-void
.end method

.method public unregisterUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V
    .locals 1
    .parameter "pUpdateHandler"

    .prologue
    .line 257
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->remove(Ljava/lang/Object;)Z

    .line 258
    return-void
.end method

.method protected updateUpdateHandlers(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 498
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateThreadRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->onUpdate(F)V

    .line 499
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->onUpdate(F)V

    .line 500
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/Engine;->getCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onUpdate(F)V

    .line 501
    return-void
.end method

.method public vibrate(J)V
    .locals 2
    .parameter "pMilliseconds"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 543
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_0

    .line 544
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 548
    return-void

    .line 546
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You need to enable the Vibrator before you can use it!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public vibrate([JI)V
    .locals 2
    .parameter "pPattern"
    .parameter "pRepeat"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 551
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_0

    .line 552
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 556
    return-void

    .line 554
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You need to enable the Vibrator before you can use it!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
