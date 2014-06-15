.class Lcom/SixClawWorm/utils/GButton$2;
.super Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
.source "GButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/utils/GButton;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/utils/GButton;FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    .line 44
    invoke-direct {p0, p2, p3, p4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    return-void
.end method


# virtual methods
.method public onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 11
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 49
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 109
    :goto_0
    return v10

    .line 52
    :pswitch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sput-wide v6, Lcom/SixClawWorm/utils/GButton;->startPauseTime:J

    .line 53
    invoke-virtual {p0, v10}, Lcom/SixClawWorm/utils/GButton$2;->setCurrentTileIndex(I)V

    .line 54
    float-to-int v2, p2

    .line 55
    .local v2, TouchAreaLocalX:I
    float-to-int v3, p3

    .line 56
    .local v3, TouchAreaLocalY:I
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6, v2}, Ljava/io/PrintStream;->println(I)V

    .line 57
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6, v3}, Ljava/io/PrintStream;->println(I)V

    .line 58
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #setter for: Lcom/SixClawWorm/utils/GButton;->mStatus:Z
    invoke-static {v6, v10}, Lcom/SixClawWorm/utils/GButton;->access$3(Lcom/SixClawWorm/utils/GButton;Z)V

    .line 59
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;
    invoke-static {v6}, Lcom/SixClawWorm/utils/GButton;->access$0(Lcom/SixClawWorm/utils/GButton;)Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

    move-result-object v6

    iget-object v7, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    invoke-static {v7}, Lcom/SixClawWorm/utils/GButton;->access$1(Lcom/SixClawWorm/utils/GButton;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/SixClawWorm/utils/GButton$GButtonClickListener;->onClick(Lorg/anddev/andengine/entity/sprite/AnimatedSprite;)V

    .line 68
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v6, v6, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v7, v7, Lcom/SixClawWorm/utils/GButton;->runnable:Ljava/lang/Runnable;

    const-wide/16 v8, 0x64

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 72
    .end local v2           #TouchAreaLocalX:I
    .end local v3           #TouchAreaLocalY:I
    :pswitch_1
    sget-wide v0, Lcom/SixClawWorm/utils/GButton;->startPauseTime:J

    .line 73
    .local v0, MstartPauseTime:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 74
    .local v4, endPauseTime:J
    sub-long v6, v4, v0

    sput-wide v6, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    .line 75
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sget-wide v7, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    invoke-virtual {v6, v7, v8}, Ljava/io/PrintStream;->println(J)V

    .line 76
    invoke-virtual {p0, v9}, Lcom/SixClawWorm/utils/GButton$2;->setCurrentTileIndex(I)V

    .line 77
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v6, v6, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    iget-object v7, v7, Lcom/SixClawWorm/utils/GButton;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 79
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    .line 80
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    .line 81
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    .line 82
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    .line 83
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    .line 84
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    .line 85
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    .line 86
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    .line 87
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    .line 88
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    .line 89
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    .line 90
    sput-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    .line 91
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mStatus:Z
    invoke-static {v6}, Lcom/SixClawWorm/utils/GButton;->access$2(Lcom/SixClawWorm/utils/GButton;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 92
    iget v6, p0, Lcom/SixClawWorm/utils/GButton$2;->mWidth:F

    iget v7, p0, Lcom/SixClawWorm/utils/GButton$2;->mHeight:F

    invoke-static {v6, v7, p2, p3}, Lcom/SixClawWorm/utils/GUtils;->contains(FFFF)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 94
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #getter for: Lcom/SixClawWorm/utils/GButton;->mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;
    invoke-static {v6}, Lcom/SixClawWorm/utils/GButton;->access$0(Lcom/SixClawWorm/utils/GButton;)Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 97
    const-string v6, "GButton"

    const-string v7, "\u89e6\u53d1\u52a8\u4f5c...."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :cond_0
    iget-object v6, p0, Lcom/SixClawWorm/utils/GButton$2;->this$0:Lcom/SixClawWorm/utils/GButton;

    #setter for: Lcom/SixClawWorm/utils/GButton;->mStatus:Z
    invoke-static {v6, v9}, Lcom/SixClawWorm/utils/GButton;->access$3(Lcom/SixClawWorm/utils/GButton;Z)V

    .line 104
    invoke-virtual {p0, v9}, Lcom/SixClawWorm/utils/GButton$2;->setCurrentTileIndex(I)V

    goto/16 :goto_0

    .line 49
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
