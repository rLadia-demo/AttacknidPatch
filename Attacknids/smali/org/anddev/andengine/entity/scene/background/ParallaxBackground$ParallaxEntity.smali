.class public Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;
.super Ljava/lang/Object;
.source "ParallaxBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParallaxEntity"
.end annotation


# instance fields
.field final mParallaxFactor:F

.field final mShape:Lorg/anddev/andengine/entity/shape/Shape;


# direct methods
.method public constructor <init>(FLorg/anddev/andengine/entity/shape/Shape;)V
    .locals 0
    .parameter "pParallaxFactor"
    .parameter "pShape"

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput p1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->mParallaxFactor:F

    .line 100
    iput-object p2, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    .line 101
    return-void
.end method


# virtual methods
.method public onDraw(Ljavax/microedition/khronos/opengles/GL10;FLorg/anddev/andengine/engine/camera/Camera;)V
    .locals 6
    .parameter "pGL"
    .parameter "pParallaxValue"
    .parameter "pCamera"

    .prologue
    const/4 v5, 0x0

    .line 116
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPushMatrix()V

    .line 118
    invoke-virtual {p3}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v1

    .line 119
    .local v1, cameraWidth:F
    iget-object v4, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    invoke-virtual {v4}, Lorg/anddev/andengine/entity/shape/Shape;->getWidthScaled()F

    move-result v3

    .line 120
    .local v3, shapeWidthScaled:F
    iget v4, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->mParallaxFactor:F

    mul-float/2addr v4, p2

    rem-float v0, v4, v3

    .line 122
    .local v0, baseOffset:F
    :goto_0
    cmpl-float v4, v0, v5

    if-gtz v4, :cond_1

    .line 125
    invoke-interface {p1, v0, v5, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 127
    move v2, v0

    .line 130
    .local v2, currentMaxX:F
    :cond_0
    iget-object v4, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->mShape:Lorg/anddev/andengine/entity/shape/Shape;

    invoke-virtual {v4, p1, p3}, Lorg/anddev/andengine/entity/shape/Shape;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 131
    invoke-interface {p1, v3, v5, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 132
    add-float/2addr v2, v3

    .line 129
    cmpg-float v4, v2, v1

    if-ltz v4, :cond_0

    .line 135
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPopMatrix()V

    .line 136
    return-void

    .line 123
    .end local v2           #currentMaxX:F
    :cond_1
    sub-float/2addr v0, v3

    goto :goto_0
.end method
