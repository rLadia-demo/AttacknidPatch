.class Lorg/anddev/andengine/opengl/font/Size;
.super Ljava/lang/Object;
.source "Size.java"


# instance fields
.field private mHeight:F

.field private mWidth:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0, v0}, Lorg/anddev/andengine/opengl/font/Size;-><init>(FF)V

    .line 25
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/opengl/font/Size;->setWidth(F)V

    .line 29
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/opengl/font/Size;->setHeight(F)V

    .line 30
    return-void
.end method


# virtual methods
.method public getHeight()F
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/anddev/andengine/opengl/font/Size;->mHeight:F

    return v0
.end method

.method public getWidth()F
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lorg/anddev/andengine/opengl/font/Size;->mWidth:F

    return v0
.end method

.method public set(II)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 53
    int-to-float v0, p1

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/opengl/font/Size;->setWidth(F)V

    .line 54
    int-to-float v0, p2

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/opengl/font/Size;->setHeight(F)V

    .line 55
    return-void
.end method

.method public setHeight(F)V
    .locals 0
    .parameter "height"

    .prologue
    .line 45
    iput p1, p0, Lorg/anddev/andengine/opengl/font/Size;->mHeight:F

    .line 46
    return-void
.end method

.method public setWidth(F)V
    .locals 0
    .parameter "width"

    .prologue
    .line 37
    iput p1, p0, Lorg/anddev/andengine/opengl/font/Size;->mWidth:F

    .line 38
    return-void
.end method
