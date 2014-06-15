.class public Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;
.super Lorg/anddev/andengine/engine/Engine;
.source "DoubleSceneSplitScreenEngine.java"


# instance fields
.field private mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;

.field private mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/options/EngineOptions;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 0
    .parameter "pEngineOptions"
    .parameter "pSecondCamera"

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 32
    iput-object p2, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 33
    return-void
.end method


# virtual methods
.method protected convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 3
    .parameter "pCamera"
    .parameter "pSurfaceTouchEvent"

    .prologue
    .line 146
    iget v1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceWidth:I

    shr-int/lit8 v0, v1, 0x1

    .line 148
    .local v0, surfaceWidthHalf:I
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 149
    iget v1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V

    .line 154
    :goto_0
    return-void

    .line 151
    :cond_0
    neg-int v1, v0

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Lorg/anddev/andengine/input/touch/TouchEvent;->offset(FF)V

    .line 152
    iget v1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v0, v1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSurfaceToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;II)V

    goto :goto_0
.end method

.method public getCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method protected getCameraFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/engine/camera/Camera;
    .locals 2
    .parameter "pTouchEvent"

    .prologue
    .line 120
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceWidth:I

    shr-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 121
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 123
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    goto :goto_0
.end method

.method public getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lorg/anddev/andengine/engine/Engine;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method public getFirstScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1

    .prologue
    .line 60
    invoke-super {p0}, Lorg/anddev/andengine/engine/Engine;->getScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    return-object v0
.end method

.method public getScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 56
    invoke-super {p0}, Lorg/anddev/andengine/engine/Engine;->getScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    return-object v0
.end method

.method protected getSceneFromSurfaceTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Lorg/anddev/andengine/entity/scene/Scene;
    .locals 2
    .parameter "pTouchEvent"

    .prologue
    .line 129
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v0

    iget v1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceWidth:I

    shr-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getFirstScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    .line 132
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getSecondScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    goto :goto_0
.end method

.method public getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method public getSecondScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;

    return-object v0
.end method

.method protected onDrawScene(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 8
    .parameter "pGL"

    .prologue
    const/16 v7, 0xc11

    const/4 v6, 0x0

    .line 87
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getFirstCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    .line 88
    .local v0, firstCamera:Lorg/anddev/andengine/engine/camera/Camera;
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v1

    .line 90
    .local v1, secondCamera:Lorg/anddev/andengine/engine/camera/Camera;
    iget v3, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceWidth:I

    .line 91
    .local v3, surfaceWidth:I
    shr-int/lit8 v4, v3, 0x1

    .line 93
    .local v4, surfaceWidthHalf:I
    iget v2, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSurfaceHeight:I

    .line 95
    .local v2, surfaceHeight:I
    invoke-interface {p1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 99
    invoke-interface {p1, v6, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glScissor(IIII)V

    .line 100
    invoke-interface {p1, v6, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 102
    iget-object v5, p0, Lorg/anddev/andengine/engine/Engine;->mScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v5, p1, v0}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 103
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 108
    invoke-interface {p1, v4, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glScissor(IIII)V

    .line 109
    invoke-interface {p1, v4, v6, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 111
    iget-object v5, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v5, p1, v1}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 112
    invoke-virtual {v1, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onDrawHUD(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 115
    invoke-interface {p1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 116
    return-void
.end method

.method protected onUpdateScene(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 138
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/Engine;->onUpdateScene(F)V

    .line 139
    iget-object v0, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onUpdate(F)V

    .line 142
    :cond_0
    return-void
.end method

.method public setFirstScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter "pScene"

    .prologue
    .line 74
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/Engine;->setScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 75
    return-void
.end method

.method public setScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter "pScene"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 70
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/Engine;->setScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 71
    return-void
.end method

.method public setSecondScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter "pScene"

    .prologue
    .line 78
    iput-object p1, p0, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->mSecondScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 79
    return-void
.end method

.method protected updateUpdateHandlers(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 158
    invoke-super {p0, p1}, Lorg/anddev/andengine/engine/Engine;->updateUpdateHandlers(F)V

    .line 159
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/DoubleSceneSplitScreenEngine;->getSecondCamera()Lorg/anddev/andengine/engine/camera/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onUpdate(F)V

    .line 160
    return-void
.end method
