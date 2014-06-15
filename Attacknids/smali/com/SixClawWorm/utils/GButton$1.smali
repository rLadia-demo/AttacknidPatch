.class Lcom/SixClawWorm/utils/GButton$1;
.super Ljava/lang/Object;
.source "GButton.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/utils/GButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/utils/GButton;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/utils/GButton;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x64

    .line 145
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;
    invoke-static {v0}, Lcom/SixClawWorm/utils/GButton;->access$0(Lcom/SixClawWorm/utils/GButton;)Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    invoke-static {v1}, Lcom/SixClawWorm/utils/GButton;->access$1(Lcom/SixClawWorm/utils/GButton;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/SixClawWorm/utils/GButton$GButtonClickListener;->onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V

    .line 146
    sget-boolean v0, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-eqz v0, :cond_0

    .line 147
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    if-nez v0, :cond_0

    .line 148
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    if-nez v0, :cond_0

    .line 149
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    if-nez v0, :cond_0

    .line 150
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v0, :cond_0

    .line 151
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    if-nez v0, :cond_0

    .line 152
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    if-nez v0, :cond_0

    .line 153
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    if-nez v0, :cond_0

    .line 154
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    if-nez v0, :cond_0

    .line 155
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v0, :cond_0

    .line 156
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    if-nez v0, :cond_0

    .line 157
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    if-nez v0, :cond_0

    .line 158
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v0, :cond_0

    .line 159
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    if-nez v0, :cond_0

    .line 160
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    if-nez v0, :cond_0

    .line 161
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    if-nez v0, :cond_0

    .line 162
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    if-nez v0, :cond_0

    .line 163
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    if-nez v0, :cond_0

    .line 164
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    if-nez v0, :cond_0

    .line 165
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    if-nez v0, :cond_0

    .line 166
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v0, :cond_0

    .line 167
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    if-nez v0, :cond_0

    .line 168
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    if-nez v0, :cond_0

    .line 169
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    if-nez v0, :cond_0

    .line 170
    sget-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    if-nez v0, :cond_0

    .line 171
    sget-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v0, v0, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 181
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mStatus:Z
    invoke-static {v0}, Lcom/SixClawWorm/utils/GButton;->access$2(Lcom/SixClawWorm/utils/GButton;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    if-eqz v0, :cond_1

    .line 176
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v0, v0, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v0, v0, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/utils/GButton$1;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v1, v1, Lcom/SixClawWorm/utils/GButton;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
