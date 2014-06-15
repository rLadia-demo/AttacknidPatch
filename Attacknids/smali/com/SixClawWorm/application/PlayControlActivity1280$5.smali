.class Lcom/SixClawWorm/application/PlayControlActivity1280$5;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    .line 372
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 3
    .parameter "animatedSprite"

    .prologue
    .line 374
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    const-class v2, Lcom/SixClawWorm/application/inTrodutionActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 375
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280$5;->this$0:Lcom/SixClawWorm/application/PlayControlActivity1280;

    invoke-virtual {v1, v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->startActivity(Landroid/content/Intent;)V

    .line 376
    return-void
.end method

.method public onLongClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V
    .locals 0
    .parameter "animatedSprite"

    .prologue
    .line 382
    return-void
.end method
