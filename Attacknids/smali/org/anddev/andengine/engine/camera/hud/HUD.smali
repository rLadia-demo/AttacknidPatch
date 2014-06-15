.class public Lorg/anddev/andengine/engine/camera/hud/HUD;
.super Lorg/anddev/andengine/entity/scene/CameraScene;
.source "HUD.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>(I)V

    .line 30
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setBackgroundEnabled(Z)V

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pLayerCount"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/CameraScene;-><init>(I)V

    .line 36
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setBackgroundEnabled(Z)V

    .line 37
    return-void
.end method
