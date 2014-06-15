.class public Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;
.super Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;
.source "AnalogOnScreenControl.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/TimeConstants;
.implements Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;
    }
.end annotation


# instance fields
.field private final mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;


# direct methods
.method public constructor <init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FJLorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;)V
    .locals 10
    .parameter "pX"
    .parameter "pY"
    .parameter "pCamera"
    .parameter "pControlBaseTextureRegion"
    .parameter "pControlKnobTextureRegion"
    .parameter "pTimeBetweenUpdates"
    .parameter "pOnControlClickMaximumMilliseconds"
    .parameter "pAnalogOnScreenControlListener"

    .prologue
    .line 35
    move-object v2, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p9

    invoke-direct/range {v2 .. v9}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V

    .line 23
    new-instance v2, Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    invoke-direct {v2, p0}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;-><init>(Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;)V

    iput-object v2, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    .line 36
    iget-object v2, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    move-wide/from16 v0, p7

    invoke-virtual {v2, v0, v1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->setTriggerClickMaximumMilliseconds(J)V

    .line 37
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;)V
    .locals 2
    .parameter "pX"
    .parameter "pY"
    .parameter "pCamera"
    .parameter "pControlBaseTextureRegion"
    .parameter "pControlKnobTextureRegion"
    .parameter "pTimeBetweenUpdates"
    .parameter "pAnalogOnScreenControlListener"

    .prologue
    .line 30
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V

    .line 23
    new-instance v0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;-><init>(Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;)V

    iput-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    .line 31
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->setEnabled(Z)V

    .line 32
    return-void
.end method


# virtual methods
.method public getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;
    .locals 1

    .prologue
    .line 45
    invoke-super {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;

    return-object v0
.end method

.method public bridge synthetic getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Lorg/anddev/andengine/input/touch/detector/ClickDetector;Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 1
    .parameter "pClickDetector"
    .parameter "pTouchEvent"

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getOnScreenControlListener()Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;->onControlClick(Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;)V

    .line 63
    return-void
.end method

.method protected onHandleControlBaseTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 2
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    .line 67
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->onSceneTouchEvent(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    .line 68
    invoke-super {p0, p1, p2, p3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onHandleControlBaseTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z

    move-result v0

    return v0
.end method

.method public setOnControlClickEnabled(Z)V
    .locals 1
    .parameter "pOnControlClickEnabled"

    .prologue
    .line 49
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->setEnabled(Z)V

    .line 50
    return-void
.end method

.method public setOnControlClickMaximumMilliseconds(J)V
    .locals 1
    .parameter "pOnControlClickMaximumMilliseconds"

    .prologue
    .line 53
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->mClickDetector:Lorg/anddev/andengine/input/touch/detector/ClickDetector;

    invoke-virtual {v0, p1, p2}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->setTriggerClickMaximumMilliseconds(J)V

    .line 54
    return-void
.end method
