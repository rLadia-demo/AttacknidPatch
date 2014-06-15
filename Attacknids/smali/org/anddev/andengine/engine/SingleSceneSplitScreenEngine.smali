.class public Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;
.super Lorg/anddev/andengine/engine/Engine;
.source "SingleSceneSplitScreenEngine.java"


# instance fields
.field private final mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/options/EngineOptions;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 0
    .parameter "pEngineOptions"
    .parameter "pSecondCamera"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 30
    iput-object p2, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 31
    return-void
.end method


# virtual methods
.method protected convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 3
    .parameter "pCamera"
    .parameter "pSurfaceTouchEvent"

    .prologue
    .line 99
    iget v1, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceWidth:I

    shr-int/lit8 v0, v1, 0x1

    .line 101
    .local v0, surfaceWidthHalf:I
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 102
    iget v1, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V

    .line 107
    :goto_0
    return-void

    .line 104
    :cond_0
    neg-int v1, v0

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->offset(FF)V

    .line 105
    iget v1, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V

    goto :goto_0
.end method

.method public getCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method protected getCameraFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/engine/camera/Camera;
    .locals 2
    .parameter "pTouchEvent"

    .prologue
    .line 90
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceWidth:I

    shr-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 93
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    goto :goto_0
.end method

.method public getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method public getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method protected onDrawScene(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 8
    .parameter "pGL"

    .prologue
    const/16 v7, 0xc11

    const/4 v6, 0x0

    .line 57
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 58
    .local v0, firstCamera:Lorg/anddev/andengine/engine/camera/Camera;
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v1

    .line 60
    .local v1, secondCamera:Lorg/anddev/andengine/engine/camera/Camera;
    iget v3, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceWidth:I

    .line 61
    .local v3, surfaceWidth:I
    shr-int/lit8 v4, v3, 0x1

    .line 63
    .local v4, surfaceWidthHalf:I
    iget v2, p0, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->mSurfaceHeight:I

    .line 65
    .local v2, surfaceHeight:I
    invoke-interface {p1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 69
    invoke-interface {p1, v6, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glScissor(IIII)V

    .line 70
    invoke-interface {p1, v6, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 72
    iget-object v5, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v5, p1, v0}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 73
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 78
    invoke-interface {p1, v4, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glScissor(IIII)V

    .line 79
    invoke-interface {p1, v4, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 81
    iget-object v5, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v5, p1, v1}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 82
    invoke-virtual {v1, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 85
    invoke-interface {p1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 86
    return-void
.end method

.method protected updateUpdateHandlers(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 111
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/Engine;->updateUpdateHandlers(F)V

    .line 112
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/SingleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onUpdate(F)V

    .line 113
    return-void
.end method
