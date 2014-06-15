.class public Lorg/anddev/andengine/entity/scene/background/EntityBackground;
.super Lorg/anddev/andengine/entity/scene/background/ColorBackground;
.source "EntityBackground.java"


# instance fields
.field protected mEntity:Lorg/anddev/andengine/entity/IEntity;


# direct methods
.method public constructor <init>(FFFLorg/anddev/andengine/entity/IEntity;)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pEntity"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;-><init>(FFF)V

    .line 33
    iput-object p4, p0, Lorg/anddev/andengine/entity/scene/background/EntityBackground;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 34
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/IEntity;)V
    .locals 0
    .parameter "pEntity"

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/background/EntityBackground;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 29
    return-void
.end method


# virtual methods
.method public onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 46
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 47
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/EntityBackground;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/entity/IEntity;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 48
    return-void
.end method
