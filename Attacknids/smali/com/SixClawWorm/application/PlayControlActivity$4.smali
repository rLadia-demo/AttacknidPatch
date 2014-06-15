.class Lcom/SixClawWorm/application/PlayControlActivity$4;
.super Ljava/lang/Object;
.source "PlayControlActivity.java"

# interfaces
.implements Lcom/SixClawWorm/utils/GButton$GButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/PlayControlActivity;->onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/PlayControlActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/PlayControlActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    .line 357
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 2
    .parameter "animatedSprite"

    .prologue
    const/4 v1, 0x1

    .line 359
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    iput-boolean v1, v0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 360
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->ifPlayControlActivity:Z

    .line 361
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    iget-object v0, v0, Lcom/SixClawWorm/application/PlayControlActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    iget-object v1, v1, Lcom/SixClawWorm/application/PlayControlActivity;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 362
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity$4;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->finish()V

    .line 365
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 371
    return-void
.end method
