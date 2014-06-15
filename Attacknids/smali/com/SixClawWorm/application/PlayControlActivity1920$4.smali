.class Lcom/SixClawWorm/application/PlayControlActivity1920$4;
.super Ljava/lang/Object;
.source "PlayControlActivity1920.java"

# interfaces
.implements Lcom/SixClawWorm/utils/GButton$GButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/PlayControlActivity1920;->onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animatedSprite"

    .prologue
    const/4 v2, 0x1

    .line 365
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    iput-boolean v2, v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 366
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    iget-object v0, v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    iget-object v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1920;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 367
    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->ifPlayControlActivity:Z

    .line 368
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->finish()V

    .line 371
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 377
    return-void
.end method
