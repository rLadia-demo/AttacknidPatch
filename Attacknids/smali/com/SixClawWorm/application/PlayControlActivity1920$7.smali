.class Lcom/SixClawWorm/application/PlayControlActivity1920$7;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    .line 519
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 521
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    .line 522
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v2, :cond_1

    .line 523
    const-string v0, "7100808002800250"

    .line 524
    .local v0, messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 525
    .local v1, sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V

    .line 551
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_0
    :goto_0
    return-void

    .line 527
    :cond_1
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v2, :cond_2

    .line 528
    const-string v0, "7100808082800260"

    .line 529
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 530
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V

    goto :goto_0

    .line 532
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_2
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-nez v2, :cond_0

    .line 536
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    if-nez v2, :cond_0

    .line 537
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    if-nez v2, :cond_0

    .line 538
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    if-nez v2, :cond_0

    .line 539
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v2, :cond_0

    .line 540
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    if-nez v2, :cond_0

    .line 541
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    if-nez v2, :cond_0

    .line 542
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    if-nez v2, :cond_0

    .line 543
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    if-nez v2, :cond_0

    .line 544
    const-string v0, "7100808080800240"

    .line 545
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 546
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V

    goto :goto_0
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 557
    return-void
.end method
