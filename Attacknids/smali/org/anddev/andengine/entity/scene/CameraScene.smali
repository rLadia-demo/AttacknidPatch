.class public Lorg/anddev/andengine/entity/scene/CameraScene;
.super Lorg/anddev/andengine/entity/scene/Scene;
.source "CameraScene.java"


# instance fields
.field protected mCamera:Lorg/anddev/andengine/engine/camera/Camera;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .parameter "pLayerCount"

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/entity/scene/CameraScene;-><init>(ILorg/anddev/andengine/engine/camera/Camera;)V

    .line 33
    return-void
.end method

.method public constructor <init>(ILorg/anddev/andengine/engine/camera/Camera;)V
    .locals 0
    .parameter "pLayerCount"
    .parameter "pCamera"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;-><init>(I)V

    .line 37
    iput-object p2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 38
    return-void
.end method


# virtual methods
.method public centerShapeInCamera(Lorg/anddev/andengine/entity/shape/Shape;)V
    .locals 5
    .parameter "pShape"

    .prologue
    const/high16 v4, 0x3f00

    .line 110
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 111
    .local v0, camera:Lorg/anddev/andengine/engine/camera/Camera;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v1

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getWidth()F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, v4

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v2

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getHeight()F

    move-result v3

    sub-float/2addr v2, v3

    mul-float/2addr v2, v4

    invoke-virtual {p1, v1, v2}, Lorg/anddev/andengine/entity/shape/Shape;->setPosition(FF)V

    .line 112
    return-void
.end method

.method public centerShapeInCameraHorizontally(Lorg/anddev/andengine/entity/shape/Shape;)V
    .locals 2
    .parameter "pShape"

    .prologue
    .line 115
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getWidth()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x3f00

    mul-float/2addr v0, v1

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/anddev/andengine/entity/shape/Shape;->setPosition(FF)V

    .line 116
    return-void
.end method

.method public centerShapeInCameraVertically(Lorg/anddev/andengine/entity/shape/Shape;)V
    .locals 3
    .parameter "pShape"

    .prologue
    .line 119
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getX()F

    move-result v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v1

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getHeight()F

    move-result v2

    sub-float/2addr v1, v2

    const/high16 v2, 0x3f00

    mul-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Lorg/anddev/andengine/entity/shape/Shape;->setPosition(FF)V

    .line 120
    return-void
.end method

.method public getCamera()Lorg/anddev/andengine/engine/camera/Camera;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    return-object v0
.end method

.method protected onChildSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 3
    .parameter "pSceneTouchEvent"

    .prologue
    .line 76
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    instance-of v0, v2, Lorg/anddev/andengine/entity/scene/CameraScene;

    .line 77
    .local v0, childIsCameraScene:Z
    if-eqz v0, :cond_0

    .line 78
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->convertCameraSceneToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 79
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onChildSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v1

    .line 80
    .local v1, result:Z
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSceneToCameraSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 83
    .end local v1           #result:Z
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onChildSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 2
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    const/16 v1, 0x1701

    .line 89
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    if-eqz v0, :cond_0

    .line 90
    invoke-interface {p1, v1}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 91
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onApplyCameraSceneMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 93
    const/16 v0, 0x1700

    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 94
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPushMatrix()V

    .line 95
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 97
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/Scene;->onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 99
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glPopMatrix()V

    .line 101
    invoke-interface {p1, v1}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 103
    :cond_0
    return-void
.end method

.method public onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 3
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v1, 0x0

    .line 58
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    if-nez v2, :cond_0

    .line 69
    :goto_0
    return v1

    .line 61
    :cond_0
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->convertSceneToCameraSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    .line 63
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    .line 65
    .local v0, handled:Z
    if-eqz v0, :cond_1

    .line 66
    const/4 v1, 0x1

    goto :goto_0

    .line 68
    :cond_1
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->convertCameraSceneToSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)V

    goto :goto_0
.end method

.method public setCamera(Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 0
    .parameter "pCamera"

    .prologue
    .line 49
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/CameraScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 50
    return-void
.end method
