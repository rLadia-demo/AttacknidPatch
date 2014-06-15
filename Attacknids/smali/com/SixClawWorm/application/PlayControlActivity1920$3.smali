.class Lcom/SixClawWorm/application/PlayControlActivity1920$3;
.super Ljava/lang/Thread;
.source "PlayControlActivity1920.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$3;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    .line 272
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 275
    :goto_0
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$3;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    iget-boolean v1, v1, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    if-eqz v1, :cond_0

    .line 284
    return-void

    .line 277
    :cond_0
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 279
    :catch_0
    move-exception v0

    .line 281
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
