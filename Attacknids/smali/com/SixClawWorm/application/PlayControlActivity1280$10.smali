.class Lcom/SixClawWorm/application/PlayControlActivity1280$10;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$10;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 633
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 635
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    .line 636
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-nez v2, :cond_0

    .line 638
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-nez v2, :cond_0

    .line 641
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-nez v2, :cond_0

    .line 645
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    if-nez v2, :cond_0

    .line 646
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    if-nez v2, :cond_0

    .line 647
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v2, :cond_0

    .line 648
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v2, :cond_0

    .line 649
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    if-nez v2, :cond_0

    .line 650
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    if-nez v2, :cond_0

    .line 651
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    if-nez v2, :cond_0

    .line 652
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    if-nez v2, :cond_0

    .line 653
    const-string v0, "7100808002808010"

    .line 654
    .local v0, leftUp:Ljava/lang/String;
    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$2(Ljava/lang/String;)[B

    move-result-object v1

    .line 655
    .local v1, message4:[B
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$10;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    #calls: Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V
    invoke-static {v2, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V

    .line 658
    .end local v0           #leftUp:Ljava/lang/String;
    .end local v1           #message4:[B
    :cond_0
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 664
    return-void
.end method
