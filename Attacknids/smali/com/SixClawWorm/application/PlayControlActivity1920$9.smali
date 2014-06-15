.class Lcom/SixClawWorm/application/PlayControlActivity1920$9;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$9;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    .line 601
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 603
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    .line 604
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v2, :cond_1

    .line 605
    const-string v0, "7100808002808290"

    .line 606
    .local v0, messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 607
    .local v1, sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$9;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V

    .line 630
    .end local v0           #messageDemo:Ljava/lang/String;
    .end local v1           #sentmessage:[B
    :cond_0
    :goto_0
    return-void

    .line 609
    :cond_1
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-nez v2, :cond_0

    .line 612
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-nez v2, :cond_0

    .line 616
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    if-nez v2, :cond_0

    .line 617
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    if-nez v2, :cond_0

    .line 618
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    if-nez v2, :cond_0

    .line 619
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v2, :cond_0

    .line 620
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    if-nez v2, :cond_0

    .line 621
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    if-nez v2, :cond_0

    .line 622
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    if-nez v2, :cond_0

    .line 623
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    if-nez v2, :cond_0

    .line 624
    const-string v0, "7100808080808280"

    .line 625
    .restart local v0       #messageDemo:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 626
    .restart local v1       #sentmessage:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920$9;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1920;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V

    goto :goto_0
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 635
    return-void
.end method
