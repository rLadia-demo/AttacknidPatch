.class Lorg/anddev/andengine/engine/Engine$1;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/engine/Engine;->onLoadComplete(Lorg/anddev/andengine/entity/scene/Scene;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/engine/Engine;

.field private final synthetic val$pScene:Lorg/anddev/andengine/entity/scene/Scene;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/engine/Engine$1;->this$0:Lorg/anddev/andengine/engine/Engine;

    iput-object p2, p0, Lorg/anddev/andengine/engine/Engine$1;->val$pScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 448
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V
    .locals 2
    .parameter "pTimerHandler"

    .prologue
    .line 451
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine$1;->this$0:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/Engine;->unregisterUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 452
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine$1;->this$0:Lorg/anddev/andengine/engine/Engine;

    iget-object v1, p0, Lorg/anddev/andengine/engine/Engine$1;->val$pScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/engine/Engine;->setScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 453
    return-void
.end method
