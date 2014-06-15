.class Lcom/SixClawWorm/application/PlayControlActivity1280$4;
.super Ljava/lang/Object;
.source "PlayControlActivity1280.java"

# interfaces
.implements Lcom/SixClawWorm/utils/GButton$GButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/PlayControlActivity1280;->onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animatedSprite"

    .prologue
    const/4 v2, 0x1

    .line 356
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iput-boolean v2, v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 357
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget-object v0, v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget-object v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 358
    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->ifPlayControlActivity:Z

    .line 359
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->finish()V

    .line 362
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 368
    return-void
.end method
