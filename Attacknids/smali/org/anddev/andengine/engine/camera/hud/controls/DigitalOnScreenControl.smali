.class public Lorg/anddev/andengine/engine/camera/hud/controls/DigitalOnScreenControl;
.super Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;
.source "DigitalOnScreenControl.java"


# direct methods
.method public constructor <init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pCamera"
    .parameter "pControlBaseTextureRegion"
    .parameter "pControlKnobTextureRegion"
    .parameter "pTimeBetweenUpdates"
    .parameter "pOnScreenControlListener"

    .prologue
    .line 24
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V

    .line 25
    return-void
.end method


# virtual methods
.method protected onUpdateControlKnob(FF)V
    .locals 5
    .parameter "pRelativeX"
    .parameter "pRelativeY"

    .prologue
    const/high16 v4, 0x3f00

    const/high16 v3, -0x4100

    const/4 v2, 0x0

    .line 37
    cmpl-float v0, p1, v2

    if-nez v0, :cond_0

    cmpl-float v0, p2, v2

    if-nez v0, :cond_0

    .line 38
    invoke-super {p0, v2, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 41
    :cond_0
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4

    .line 42
    cmpl-float v0, p1, v2

    if-lez v0, :cond_2

    .line 43
    invoke-super {p0, v4, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    .line 58
    :cond_1
    :goto_0
    return-void

    .line 44
    :cond_2
    cmpg-float v0, p1, v2

    if-gez v0, :cond_3

    .line 45
    invoke-super {p0, v3, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    goto :goto_0

    .line 46
    :cond_3
    cmpl-float v0, p1, v2

    if-nez v0, :cond_1

    .line 47
    invoke-super {p0, v2, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    goto :goto_0

    .line 50
    :cond_4
    cmpl-float v0, p2, v2

    if-lez v0, :cond_5

    .line 51
    invoke-super {p0, v2, v4}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    goto :goto_0

    .line 52
    :cond_5
    cmpg-float v0, p2, v2

    if-gez v0, :cond_6

    .line 53
    invoke-super {p0, v2, v3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    goto :goto_0

    .line 54
    :cond_6
    cmpl-float v0, p2, v2

    if-nez v0, :cond_1

    .line 55
    invoke-super {p0, v2, v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onUpdateControlKnob(FF)V

    goto :goto_0
.end method
