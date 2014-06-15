.class Lcom/SixClawWorm/application/PlayControlActivity$5;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animatedSprite"

    .prologue
    .line 377
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const-class v2, Lcom/SixClawWorm/application/inTrodutionActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 378
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    invoke-virtual {v1, v0}, Lcom/SixClawWorm/application/PlayControlActivity;->startActivity(Landroid/content/Intent;)V

    .line 379
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 385
    return-void
.end method
