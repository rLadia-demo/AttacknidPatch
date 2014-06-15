.class Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;
.super Ljava/lang/Object;
.source "BaseOnScreenControl.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FLorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V
    .locals 4
    .parameter "pTimerHandler"

    .prologue
    .line 96
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    #getter for: Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mOnScreenControlListener:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;
    invoke-static {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->access$0(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    iget-object v2, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    #getter for: Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueX:F
    invoke-static {v2}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->access$1(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)F

    move-result v2

    iget-object v3, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$2;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    #getter for: Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->mControlValueY:F
    invoke-static {v3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->access$2(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;)F

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$IOnScreenControlListener;->onControlChange(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;FF)V

    .line 97
    return-void
.end method
