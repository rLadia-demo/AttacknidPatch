.class Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;
.super Landroid/view/SurfaceView;
.source "CameraPreviewSurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private final mSurfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "pContext"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 38
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 41
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .parameter "pSurfaceHolder"
    .parameter "pPixelFormat"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 67
    iget-object v1, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 68
    .local v0, parameters:Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0, p3, p4}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 69
    iget-object v1, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 70
    iget-object v1, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 71
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "pSurfaceHolder"

    .prologue
    .line 52
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v1

    iput-object v1, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    .line 54
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, e:Ljava/io/IOException;
    const-string v1, "Error in Camera.setPreviewDisplay"

    invoke-static {v1, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "pSurfaceHolder"

    .prologue
    .line 61
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 62
    iget-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/extension/augmentedreality/CameraPreviewSurfaceView;->mCamera:Landroid/hardware/Camera;

    .line 64
    return-void
.end method
