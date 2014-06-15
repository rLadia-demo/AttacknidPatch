.class public Lorg/anddev/andengine/entity/text/TickerText;
.super Lorg/anddev/andengine/entity/text/Text;
.source "TickerText.java"


# instance fields
.field private mCharactersPerSecond:F

.field private mCharactersVisible:I

.field private mDuration:F

.field private mReverse:Z

.field private mSecondsElapsed:F


# direct methods
.method public constructor <init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;F)V
    .locals 2
    .parameter "pX"
    .parameter "pY"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pHorizontalAlign"
    .parameter "pCharactersPerSecond"

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/entity/text/Text;-><init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;)V

    .line 25
    iput v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    .line 28
    iput-boolean v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mReverse:Z

    .line 38
    invoke-virtual {p0, p6}, Lorg/anddev/andengine/entity/text/TickerText;->setCharactersPerSecond(F)V

    .line 39
    return-void
.end method


# virtual methods
.method protected drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 3
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 88
    const/4 v0, 0x4

    const/4 v1, 0x0

    iget v2, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    mul-int/lit8 v2, v2, 0x6

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 89
    return-void
.end method

.method public getCharactersPerSecond()F
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersPerSecond:F

    return v0
.end method

.method public getCharactersVisible()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    return v0
.end method

.method public isReverse()Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mReverse:Z

    return v0
.end method

.method protected onManagedUpdate(F)V
    .locals 2
    .parameter "pSecondsElapsed"

    .prologue
    .line 72
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/text/Text;->onManagedUpdate(F)V

    .line 73
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mReverse:Z

    if-eqz v0, :cond_1

    .line 74
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersMaximum:I

    if-ge v0, v1, :cond_0

    .line 75
    const/4 v0, 0x0

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    sub-float/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    .line 76
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersPerSecond:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersMaximum:I

    if-ge v0, v1, :cond_0

    .line 80
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mDuration:F

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    add-float/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    .line 81
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersPerSecond:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 93
    invoke-super {p0}, Lorg/anddev/andengine/entity/text/Text;->reset()V

    .line 95
    iput v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersVisible:I

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mSecondsElapsed:F

    .line 97
    iput-boolean v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mReverse:Z

    .line 98
    return-void
.end method

.method public setCharactersPerSecond(F)V
    .locals 2
    .parameter "pCharactersPerSecond"

    .prologue
    .line 58
    iput p1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersPerSecond:F

    .line 59
    iget v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersMaximum:I

    int-to-float v0, v0

    iget v1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mCharactersPerSecond:F

    mul-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/entity/text/TickerText;->mDuration:F

    .line 60
    return-void
.end method

.method public setReverse(Z)V
    .locals 0
    .parameter "pReverse"

    .prologue
    .line 50
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/text/TickerText;->mReverse:Z

    .line 51
    return-void
.end method
