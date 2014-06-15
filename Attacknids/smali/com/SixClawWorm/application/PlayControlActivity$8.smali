.class Lcom/SixClawWorm/application/PlayControlActivity$8;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    .line 556
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 558
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    .line 559
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v2, :cond_1

    .line 560
    const-string v0, "71008080828082A0"

    .line 561
    .local v0, messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 562
    .local v1, sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->access$3(Lcom/SixClawWorm/application/PlayControlActivity;[B)V

    .line 584
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_0
    :goto_0
    return-void

    .line 564
    :cond_1
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-nez v2, :cond_0

    .line 567
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-nez v2, :cond_0

    .line 571
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    if-nez v2, :cond_0

    .line 572
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    if-nez v2, :cond_0

    .line 573
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    if-nez v2, :cond_0

    .line 574
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v2, :cond_0

    .line 575
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    if-nez v2, :cond_0

    .line 576
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    if-nez v2, :cond_0

    .line 577
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    if-nez v2, :cond_0

    .line 578
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    if-nez v2, :cond_0

    .line 579
    const-string v0, "7100808082808020"

    .line 580
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 581
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity$8;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->access$3(Lcom/SixClawWorm/application/PlayControlActivity;[B)V

    goto :goto_0
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 590
    return-void
.end method
