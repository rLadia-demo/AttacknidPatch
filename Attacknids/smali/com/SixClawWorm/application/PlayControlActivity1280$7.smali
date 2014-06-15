.class Lcom/SixClawWorm/application/PlayControlActivity1280$7;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 510
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 512
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    .line 513
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v2, :cond_1

    .line 514
    const-string v0, "7100808002800250"

    .line 515
    .local v0, messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 516
    .local v1, sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    .line 542
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_0
    :goto_0
    return-void

    .line 518
    :cond_1
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v2, :cond_2

    .line 519
    const-string v0, "7100808082800260"

    .line 520
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 521
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    goto :goto_0

    .line 523
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_2
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-nez v2, :cond_0

    .line 527
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    if-nez v2, :cond_0

    .line 528
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    if-nez v2, :cond_0

    .line 529
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v2, :cond_0

    .line 530
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v2, :cond_0

    .line 531
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    if-nez v2, :cond_0

    .line 532
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    if-nez v2, :cond_0

    .line 533
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    if-nez v2, :cond_0

    .line 534
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    if-nez v2, :cond_0

    .line 535
    const-string v0, "7100808080800240"

    .line 536
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 537
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$7;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    goto :goto_0
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 548
    return-void
.end method
