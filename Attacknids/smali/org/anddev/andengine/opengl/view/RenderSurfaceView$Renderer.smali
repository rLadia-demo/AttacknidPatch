.class public Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;
.super Ljava/lang/Object;
.source "RenderSurfaceView.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/view/RenderSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Renderer"
.end annotation


# instance fields
.field private final mEngine:Lorg/anddev/andengine/engine/Engine;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/Engine;)V
    .locals 0
    .parameter "pEngine"

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;

    .line 95
    return-void
.end method

.method static synthetic access$0(Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;)Lorg/anddev/andengine/engine/Engine;
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;

    return-object v0
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 148
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v1, p1}, Lorg/anddev/andengine/engine/Engine;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v1, "GLThread interrupted!"

    invoke-static {v1, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 3
    .parameter "pGL"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    const/4 v2, 0x0

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onSurfaceChanged: pWidth="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  pHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0, p2, p3}, Lorg/anddev/andengine/engine/Engine;->setSurfaceSize(II)V

    .line 109
    invoke-interface {p1, v2, v2, p2, p3}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 110
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 111
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 1
    .parameter "pGL"
    .parameter "pConfig"

    .prologue
    .line 115
    const-string v0, "onSurfaceCreated"

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 116
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->reset(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 118
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setPerspectiveCorrectionHintFastest(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 126
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setShadeModelFlat(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 128
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableLightning(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 129
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableDither(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 130
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableDepthTest(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 131
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableMultisample(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 133
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableBlend(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 134
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 135
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 136
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableVertexArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 138
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableCulling(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 139
    const/16 v0, 0x901

    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glFrontFace(I)V

    .line 140
    const/16 v0, 0x405

    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    .line 142
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/RenderSurfaceView$Renderer;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getEngineOptions()Lorg/anddev/andengine/engine/options/EngineOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/options/EngineOptions;->getRenderOptions()Lorg/anddev/andengine/engine/options/RenderOptions;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableExtensions(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/options/RenderOptions;)V

    .line 143
    return-void
.end method
