.class Lcom/SixClawWorm/application/PlayControlActivity1280$1;
.super Ljava/lang/Object;
.source "PlayControlActivity1280.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/PlayControlActivity1280;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 222
    sget-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-nez v1, :cond_0

    .line 223
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->sencondOnclock:I

    if-nez v1, :cond_0

    .line 224
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    const-class v2, Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 225
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    invoke-virtual {v1, v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->startActivity(Landroid/content/Intent;)V

    .line 226
    const/4 v1, 0x0

    sput-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 227
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iput v3, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->sencondOnclock:I

    .line 228
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iput-boolean v3, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 229
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget-object v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget-object v2, v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 237
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    iget-object v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0xa

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 238
    return-void
.end method
