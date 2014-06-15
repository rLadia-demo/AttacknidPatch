.class Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;
.super Ljava/lang/Object;
.source "PopupScene.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/entity/scene/popup/PopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;FLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/entity/scene/popup/PopupScene;

.field private final synthetic val$pParentScene:Lorg/anddev/andengine/entity/scene/Scene;

.field private final synthetic val$pRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/entity/scene/popup/PopupScene;Lorg/anddev/andengine/entity/scene/Scene;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->this$0:Lorg/anddev/andengine/entity/scene/popup/PopupScene;

    iput-object p2, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->val$pParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    iput-object p3, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->val$pRunnable:Ljava/lang/Runnable;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V
    .locals 1
    .parameter "pTimerHandler"

    .prologue
    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->this$0:Lorg/anddev/andengine/entity/scene/popup/PopupScene;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/scene/popup/PopupScene;->unregisterUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->val$pParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/scene/Scene;->clearChildScene()V

    .line 41
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->val$pRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/PopupScene$1;->val$pRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 44
    :cond_0
    return-void
.end method
