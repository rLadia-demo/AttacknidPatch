.class public abstract Lorg/anddev/andengine/entity/shape/GLShape;
.super Lorg/anddev/andengine/entity/shape/Shape;
.source "GLShape.java"


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/Shape;-><init>(FF)V

    .line 28
    return-void
.end method


# virtual methods
.method protected abstract getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
.end method

.method protected onApplyVertices(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 39
    sget-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 40
    check-cast v0, Ljavax/microedition/khronos/opengles/GL11;

    .line 42
    .local v0, gl11:Ljavax/microedition/khronos/opengles/GL11;
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;->selectOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 43
    invoke-static {v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->vertexZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 47
    .end local v0           #gl11:Ljavax/microedition/khronos/opengles/GL11;
    :goto_0
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->vertexPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V

    goto :goto_0
.end method

.method protected abstract onUpdateVertexBuffer()V
.end method

.method protected updateVertexBuffer()V
    .locals 0

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->onUpdateVertexBuffer()V

    .line 59
    return-void
.end method
