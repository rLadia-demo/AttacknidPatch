.class public abstract Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;
.super Lorg/anddev/andengine/engine/camera/hud/HUD;
.source "BaseOnScreenControl.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;
    }
.end annotation


# static fields
.field private static final INVALID_POINTER_ID:I = -0x1


# instance fields
.field private mActivePointerID:I

.field private final mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

.field private final mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

.field private mControlValueX:F

.field private mControlValueY:F

.field private final mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;


# direct methods
.method public constructor <init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V
    .locals 6
    .parameter "pX"
    .parameter "pY"
    .parameter "pCamera"
    .parameter "pControlBaseTextureRegion"
    .parameter "pControlKnobTextureRegion"
    .parameter "pTimeBetweenUpdates"
    .parameter "pOnScreenControlListener"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 50
    invoke-direct {p0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>()V

    .line 44
    const/4 v1, -0x1

    iput v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    .line 51
    invoke-virtual {p0, p3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->setCamera(Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 53
    iput-object p7, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    .line 55
    new-instance v1, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$1;

    int-to-float v2, p1

    int-to-float v3, p2

    invoke-direct {v1, p0, v2, v3, p4}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$1;-><init>(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    iput-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 63
    new-instance v1, Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-direct {v1, v4, v4, p5}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    iput-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 87
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onHandleControlKnobReleased()V

    .line 90
    invoke-virtual {p0, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->setOnSceneTouchListener(Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;)V

    .line 91
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V

    .line 92
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V

    .line 93
    new-instance v1, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    new-instance v2, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;

    invoke-direct {v2, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;-><init>(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V

    invoke-direct {v1, p6, v5, v2}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FZLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 100
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->getBottomLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v0

    .line 101
    .local v0, bottomLayer:Lorg/anddev/andengine/entity/layer/ILayer;
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 102
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 104
    invoke-virtual {p0, v5}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->setTouchAreaBindingEnabled(Z)V

    .line 105
    return-void
.end method

.method static synthetic access$0(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    return-object v0
.end method

.method static synthetic access$1(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)F
    .locals 1
    .parameter

    .prologue
    .line 39
    iget v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueX:F

    return v0
.end method

.method static synthetic access$2(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)F
    .locals 1
    .parameter

    .prologue
    .line 40
    iget v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueY:F

    return v0
.end method

.method private updateControlKnob(Lorg/anddev/andengine/input/touch/TouchEvent;FF)V
    .locals 7
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    const/high16 v6, 0x3f00

    const/4 v5, 0x0

    .line 165
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 167
    .local v0, controlBase:Lorg/anddev/andengine/entity/sprite/Sprite;
    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getWidth()F

    move-result v3

    invoke-static {v5, v3, p2}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(FFF)F

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getWidth()F

    move-result v4

    div-float/2addr v3, v4

    sub-float v1, v3, v6

    .line 168
    .local v1, relativeX:F
    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getHeight()F

    move-result v3

    invoke-static {v5, v3, p3}, Lorg/anddev/andengine/util/MathUtils;->bringToBounds(FFF)F

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getHeight()F

    move-result v4

    div-float/2addr v3, v4

    sub-float v2, v3, v6

    .line 170
    .local v2, relativeY:F
    invoke-virtual {p0, v1, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 171
    return-void
.end method


# virtual methods
.method public getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    return-object v0
.end method

.method public getControlKnob()Lorg/anddev/andengine/entity/sprite/Sprite;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

    return-object v0
.end method

.method public getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    return-object v0
.end method

.method protected onHandleControlBaseLeft()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 154
    invoke-virtual {p0, v0, v0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 155
    return-void
.end method

.method protected onHandleControlBaseTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 4
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    .line 212
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v0

    .line 214
    .local v0, pointerID:I
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 234
    :pswitch_0
    iget v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    if-ne v1, v0, :cond_0

    .line 235
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->updateControlKnob(Lorg/anddev/andengine/input/touch/TouchEvent;FF)V

    .line 240
    :cond_0
    :goto_0
    return v2

    .line 216
    :pswitch_1
    iget v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    if-ne v1, v3, :cond_0

    .line 217
    iput v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    .line 218
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->updateControlKnob(Lorg/anddev/andengine/input/touch/TouchEvent;FF)V

    .line 219
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    invoke-interface {v1, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;->onControlKnobDown(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V

    goto :goto_0

    .line 225
    :pswitch_2
    iget v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    if-ne v1, v0, :cond_0

    .line 226
    iput v3, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    .line 227
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onHandleControlKnobReleased()V

    .line 228
    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    invoke-interface {v1, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;->onControlKnobUp(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V

    goto :goto_0

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onHandleControlKnobReleased()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 161
    invoke-virtual {p0, v0, v0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 162
    return-void
.end method

.method public onSceneTouchEvent(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 2
    .parameter "pScene"
    .parameter "pSceneTouchEvent"

    .prologue
    .line 129
    invoke-virtual {p2}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v0

    .line 130
    .local v0, pointerID:I
    iget v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    if-ne v0, v1, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onHandleControlBaseLeft()V

    .line 133
    invoke-virtual {p2}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 139
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v1, 0x0

    return v1

    .line 136
    :pswitch_1
    const/4 v1, -0x1

    iput v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    goto :goto_0

    .line 133
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onUpdateControlKnob(FF)V
    .locals 14
    .parameter "pRelativeX"
    .parameter "pRelativeY"

    .prologue
    .line 178
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlBase:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 179
    .local v0, controlBase:Lorg/anddev/andengine/entity/sprite/Sprite;
    iget-object v2, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 181
    .local v2, controlKnob:Lorg/anddev/andengine/entity/sprite/Sprite;
    move v3, p1

    .line 182
    .local v3, relativeX:F
    move/from16 v4, p2

    .line 183
    .local v4, relativeY:F
    mul-float v11, v3, v3

    mul-float v12, v4, v4

    add-float/2addr v11, v12

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    .line 185
    .local v5, relatvieS:D
    const/high16 v11, 0x3f00

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    float-to-double v11, v11

    cmpl-double v11, v5, v11

    if-lez v11, :cond_1

    .line 187
    const-string v11, "\u6447\u6746\u5f15\u64ce"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "=============\u51fa\u754c\u91cd\u7f6e: relatvieS="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/4 v3, 0x0

    .line 189
    const/4 v4, 0x0

    .line 190
    const/4 v11, -0x1

    iput v11, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mActivePointerID:I

    .line 191
    iget-object v11, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    invoke-interface {v11, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;->onControlKnobUp(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V

    .line 201
    :cond_0
    :goto_0
    const/high16 v11, 0x4000

    mul-float/2addr v11, v3

    iput v11, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueX:F

    .line 202
    const/high16 v11, 0x4000

    mul-float/2addr v11, v4

    iput v11, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueY:F

    .line 204
    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getSceneCenterCoordinates()[F

    move-result-object v1

    .line 205
    .local v1, controlBaseSceneCenterCoordinates:[F
    const/4 v11, 0x0

    aget v11, v1, v11

    invoke-virtual {v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->getWidth()F

    move-result v12

    const/high16 v13, 0x3f00

    mul-float/2addr v12, v13

    sub-float/2addr v11, v12

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getWidthScaled()F

    move-result v12

    mul-float/2addr v12, v3

    add-float v9, v11, v12

    .line 206
    .local v9, x:F
    const/4 v11, 0x1

    aget v11, v1, v11

    invoke-virtual {v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->getHeight()F

    move-result v12

    const/high16 v13, 0x3f00

    mul-float/2addr v12, v13

    sub-float/2addr v11, v12

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/Sprite;->getHeightScaled()F

    move-result v12

    mul-float/2addr v12, v4

    add-float v10, v11, v12

    .line 208
    .local v10, y:F
    invoke-virtual {v2, v9, v10}, Lorg/anddev/andengine/entity/sprite/Sprite;->setPosition(FF)V

    .line 209
    return-void

    .line 193
    .end local v1           #controlBaseSceneCenterCoordinates:[F
    .end local v9           #x:F
    .end local v10           #y:F
    :cond_1
    const v11, 0x3e99999a

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    float-to-double v11, v11

    cmpl-double v11, v5, v11

    if-ltz v11, :cond_0

    const/high16 v11, 0x3f00

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    float-to-double v11, v11

    cmpg-double v11, v5, v11

    if-gtz v11, :cond_0

    .line 195
    const-string v11, "\u6447\u6746\u5f15\u64ce"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "=============\u9650\u5236\u8303\u56f4: relatvieS="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const-wide v11, 0x3fd3333340000000L

    div-double v7, v11, v5

    .line 197
    .local v7, scale:D
    float-to-double v11, v3

    mul-double/2addr v11, v7

    double-to-float v3, v11

    .line 198
    float-to-double v11, v4

    mul-double/2addr v11, v7

    double-to-float v4, v11

    goto :goto_0
.end method

.method public refreshControlKnobPosition()V
    .locals 3

    .prologue
    const/high16 v2, 0x3f00

    .line 147
    iget v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueX:F

    mul-float/2addr v0, v2

    iget v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueY:F

    mul-float/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 148
    return-void
.end method
