.class Lnet/rbgrn/opengl/EglHelper;
.super Ljava/lang/Object;
.source "EglHelper.java"


# instance fields
.field private final mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

.field private final mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

.field private final mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

.field private mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field private mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private final mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;


# direct methods
.method public constructor <init>(Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V
    .locals 0
    .parameter "chooser"
    .parameter "contextFactory"
    .parameter "surfaceFactory"
    .parameter "wrapper"

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 43
    iput-object p2, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 44
    iput-object p3, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 45
    iput-object p4, p0, Lnet/rbgrn/opengl/EglHelper;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 46
    return-void
.end method


# virtual methods
.method public createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
    .locals 6
    .parameter "holder"

    .prologue
    .line 103
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v1, v2, :cond_0

    .line 108
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v2, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 109
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v1, v2, v3, v4}, Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 115
    :cond_0
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v1, v2, v3, v4, p1}, Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v1

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 117
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v1, v2, :cond_2

    .line 118
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "createWindowSurface failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    :cond_2
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v5, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v2, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 126
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglMakeCurrent failed."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 129
    :cond_3
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v1}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    .line 130
    .local v0, gl:Ljavax/microedition/khronos/opengles/GL;
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    if-eqz v1, :cond_4

    .line 131
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    invoke-interface {v1, v0}, Landroid/opengl/GLSurfaceView$GLWrapper;->wrap(Ljavax/microedition/khronos/opengles/GL;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    .line 142
    :cond_4
    return-object v0
.end method

.method public destroySurface()V
    .locals 5

    .prologue
    .line 162
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 163
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 164
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2, v3}, Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 165
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 167
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 170
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3}, Landroid/opengl/GLSurfaceView$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 172
    iput-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 174
    :cond_0
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_1

    .line 175
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 176
    iput-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 178
    :cond_1
    return-void
.end method

.method public start()V
    .locals 5

    .prologue
    .line 69
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 74
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 79
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 80
    .local v0, version:[I
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 81
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v3}, Landroid/opengl/GLSurfaceView$EGLConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v1

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 87
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lnet/rbgrn/opengl/EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v1, v2, v3, v4}, Landroid/opengl/GLSurfaceView$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 88
    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v1, v2, :cond_1

    .line 89
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "createContext failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 92
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 93
    return-void
.end method

.method public swap()Z
    .locals 3

    .prologue
    .line 151
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lnet/rbgrn/opengl/EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lnet/rbgrn/opengl/EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 158
    iget-object v0, p0, Lnet/rbgrn/opengl/EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    const/16 v1, 0x300e

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
