.class Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$1;
.super Lorg/anddev/andengine/entity/sprite/Sprite;
.source "BaseOnScreenControl.java"


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
.method constructor <init>(Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$1;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    .line 55
    invoke-direct {p0, p2, p3, p4}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    return-void
.end method


# virtual methods
.method public onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
    .locals 1
    .parameter "pSceneTouchEvent"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    .line 58
    iget-object v0, p0, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl$1;->this$0:Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/anddev/andengine/engine/camera/hud/controls/BaseOnScreenControl;->onHandleControlBaseTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z

    move-result v0

    return v0
.end method
