.class Lcom/SixClawWorm/application/PlayControlActivity$6;
.super Ljava/lang/Object;
.source "PlayControlActivity.java"

# interfaces
.implements Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;


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
    iput-object p1, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    .line 399
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onControlChange(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;FF)V
    .locals 11
    .parameter "pBaseOnScreenControl"
    .parameter "pValueX"
    .parameter "pValueY"

    .prologue
    .line 404
    const/high16 v7, 0x42c8

    mul-float v4, p2, v7

    .line 405
    .local v4, moveX:F
    const/high16 v7, 0x42c8

    mul-float v5, p3, v7

    .line 406
    .local v5, moveY:F
    mul-float v7, v4, v4

    mul-float v8, v5, v5

    add-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    .line 409
    .local v2, moveR:D
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    #getter for: Lcom/SixClawWorm/application/PlayControlActivity;->RockerCircleR:I
    invoke-static {v7}, Lcom/SixClawWorm/application/PlayControlActivity;->access$0(Lcom/SixClawWorm/application/PlayControlActivity;)I

    move-result v7

    int-to-double v7, v7

    cmpl-double v7, v2, v7

    if-lez v7, :cond_0

    .line 411
    div-float v7, p3, p2

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->atan(D)D

    move-result-wide v7

    double-to-float v6, v7

    .line 412
    .local v6, tempRad:F
    const/high16 v7, 0x4334

    mul-float/2addr v7, v6

    float-to-double v7, v7

    const-wide v9, 0x400921fb54442d18L

    div-double/2addr v7, v9

    neg-double v0, v7

    .line 416
    .local v0, moveAngle:D
    const/4 v7, 0x0

    cmpl-float v7, p2, v7

    if-lez v7, :cond_5

    .line 418
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4036800000000000L

    cmpg-double v7, v7, v9

    if-gtz v7, :cond_1

    .line 420
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x1

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    .line 479
    .end local v0           #moveAngle:D
    .end local v6           #tempRad:F
    :cond_0
    :goto_0
    return-void

    .line 422
    .restart local v0       #moveAngle:D
    .restart local v6       #tempRad:F
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4036800000000000L

    cmpl-double v7, v7, v9

    if-lez v7, :cond_3

    .line 423
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4050e00000000000L

    cmpg-double v7, v7, v9

    if-gtz v7, :cond_3

    .line 425
    const/4 v7, 0x0

    cmpl-float v7, p3, v7

    if-lez v7, :cond_2

    .line 427
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x7

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 431
    :cond_2
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x6

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 436
    :cond_3
    const/4 v7, 0x0

    cmpl-float v7, p3, v7

    if-lez v7, :cond_4

    .line 438
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x3

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 442
    :cond_4
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x2

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 448
    :cond_5
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4036800000000000L

    cmpg-double v7, v7, v9

    if-gtz v7, :cond_6

    .line 450
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x0

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 452
    :cond_6
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4036800000000000L

    cmpl-double v7, v7, v9

    if-lez v7, :cond_8

    .line 453
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x4050e00000000000L

    cmpg-double v7, v7, v9

    if-gtz v7, :cond_8

    .line 455
    const/4 v7, 0x0

    cmpl-float v7, p3, v7

    if-lez v7, :cond_7

    .line 457
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x5

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto :goto_0

    .line 461
    :cond_7
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x4

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto/16 :goto_0

    .line 466
    :cond_8
    const/4 v7, 0x0

    cmpl-float v7, p3, v7

    if-lez v7, :cond_9

    .line 468
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x3

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto/16 :goto_0

    .line 472
    :cond_9
    iget-object v7, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v8, 0x2

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v7, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    goto/16 :goto_0
.end method

.method public onControlClick(Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;)V
    .locals 0
    .parameter "pAnalogOnScreenControl"

    .prologue
    .line 487
    return-void
.end method

.method public onControlKnobDown(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 492
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v1, -0x1

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v0, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    .line 493
    return-void
.end method

.method public onControlKnobUp(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 498
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity$6;->this$0:Lcom/SixClawWorm/application/PlayControlActivity;

    const/4 v1, -0x2

    #calls: Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V
    invoke-static {v0, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V

    .line 499
    return-void
.end method
