.class Lcom/SixClawWorm/application/PlayControlActivity1280$8;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 553
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 555
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    .line 556
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v2, :cond_1

    .line 557
    const-string v0, "71008080828082A0"

    .line 558
    .local v0, messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 559
    .local v1, sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    .line 581
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_0
    :goto_0
    return-void

    .line 561
    :cond_1
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-nez v2, :cond_0

    .line 564
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-nez v2, :cond_0

    .line 568
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    if-nez v2, :cond_0

    .line 569
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    if-nez v2, :cond_0

    .line 570
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v2, :cond_0

    .line 571
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v2, :cond_0

    .line 572
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    if-nez v2, :cond_0

    .line 573
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    if-nez v2, :cond_0

    .line 574
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    if-nez v2, :cond_0

    .line 575
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    if-nez v2, :cond_0

    .line 576
    const-string v0, "7100808082808020"

    .line 577
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 578
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    goto :goto_0
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 587
    return-void
.end method
