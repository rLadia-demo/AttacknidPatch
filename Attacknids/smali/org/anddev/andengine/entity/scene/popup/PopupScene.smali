.class public Lorg/anddev/andengine/entity/scene/popup/PopupScene;
.super Lorg/anddev/andengine/entity/scene/CameraScene;
.source "PopupScene.java"


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;F)V
    .locals 1
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pDurationSeconds"

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/scene/popup/PopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;FLjava/lang/Runnable;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;FLjava/lang/Runnable;)V
    .locals 2
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pDurationSeconds"
    .parameter "pRunnable"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 31
    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/entity/scene/CameraScene;-><init>(ILorg/anddev/andengine/engine/camera/Camera;)V

    .line 32
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/entity/scene/popup/PopupScene;->setBackgroundEnabled(Z)V

    .line 34
    invoke-virtual {p2, p0, v1, v0, v0}, Lorg/anddev/andengine/entity/scene/Scene;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V

    .line 36
    new-instance v0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    new-instance v1, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;

    invoke-direct {v1, p0, p2, p4}, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;-><init>(Lorg/anddev/andengine/entity/scene/popup/PopupScene;Lorg/anddev/andengine/entity/scene/Scene;Ljava/lang/Runnable;)V

    invoke-direct {v0, p3, v1}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/popup/PopupScene;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 46
    return-void
.end method
