.class Lcom/SixClawWorm/application/PlayControlActivity$10;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity$10;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    .line 636
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 638
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    .line 639
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-nez v2, :cond_0

    .line 642
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-nez v2, :cond_0

    .line 645
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-nez v2, :cond_0

    .line 649
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    if-nez v2, :cond_0

    .line 650
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    if-nez v2, :cond_0

    .line 651
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    if-nez v2, :cond_0

    .line 652
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v2, :cond_0

    .line 653
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    if-nez v2, :cond_0

    .line 654
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    if-nez v2, :cond_0

    .line 655
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    if-nez v2, :cond_0

    .line 656
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    if-nez v2, :cond_0

    .line 657
    const-string v0, "7100808002808010"

    .line 658
    .local v0, leftUp:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 659
    .local v1, message4:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity$10;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->access$3(Lcom/SixClawWorm/application/PlayControlActivity;[B)V

    .line 662
    .end local v0           #leftUp:Ljava/lang/String;
    .end local v1           #message4:[B
    :cond_0
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 668
    return-void
.end method
