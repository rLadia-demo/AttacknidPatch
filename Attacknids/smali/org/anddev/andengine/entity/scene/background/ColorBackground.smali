.class public Lorg/anddev/andengine/entity/scene/background/ColorBackground;
.super Lorg/anddev/andengine/entity/scene/background/BaseBackground;
.source "ColorBackground.java"


# instance fields
.field private mAlpha:F

.field private mBlue:F

.field private mColorEnabled:Z

.field private mGreen:F

.field private mRed:F


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/background/BaseBackground;-><init>()V

    .line 22
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 23
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 24
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 25
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    .line 35
    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/background/BaseBackground;-><init>()V

    .line 22
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 23
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 24
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 25
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    .line 38
    iput p1, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 39
    iput p2, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 40
    iput p3, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 41
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/background/BaseBackground;-><init>()V

    .line 22
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 23
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 24
    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 25
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    .line 44
    iput p1, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 45
    iput p2, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 46
    iput p3, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 47
    iput p4, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    .line 48
    return-void
.end method


# virtual methods
.method public isColorEnabled()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    return v0
.end method

.method public onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    if-eqz v0, :cond_0

    .line 114
    iget v0, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    iget v1, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    iget v2, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    iget v3, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    invoke-interface {p1, v0, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glClearColor(FFFF)V

    .line 115
    const/16 v0, 0x4000

    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    .line 117
    :cond_0
    return-void
.end method

.method public setColor(FFF)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 62
    iput p1, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mRed:F

    .line 63
    iput p2, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mGreen:F

    .line 64
    iput p3, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mBlue:F

    .line 65
    return-void
.end method

.method public setColor(FFFF)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"

    .prologue
    .line 75
    invoke-virtual {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->setColor(FFF)V

    .line 76
    iput p4, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mAlpha:F

    .line 77
    return-void
.end method

.method public setColor(III)V
    .locals 4
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/high16 v3, 0x437f

    .line 86
    int-to-float v0, p1

    div-float/2addr v0, v3

    int-to-float v1, p2

    div-float/2addr v1, v3

    int-to-float v2, p3

    div-float/2addr v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->setColor(FFF)V

    .line 87
    return-void
.end method

.method public setColor(IIII)V
    .locals 5
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pAlpha"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/high16 v4, 0x437f

    .line 96
    int-to-float v0, p1

    div-float/2addr v0, v4

    int-to-float v1, p2

    div-float/2addr v1, v4

    int-to-float v2, p3

    div-float/2addr v2, v4

    int-to-float v3, p4

    div-float/2addr v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->setColor(FFFF)V

    .line 97
    return-void
.end method

.method public setColorEnabled(Z)V
    .locals 0
    .parameter "pColorEnabled"

    .prologue
    .line 100
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->mColorEnabled:Z

    .line 101
    return-void
.end method
