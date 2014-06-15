.class public Lorg/anddev/andengine/entity/primitive/Rectangle;
.super Lorg/anddev/andengine/entity/primitive/BaseRectangle;
.source "Rectangle.java"


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;-><init>(FFFF)V

    .line 27
    return-void
.end method

.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pRectangleVertexBuffer"

    .prologue
    .line 30
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;-><init>(FFFFLorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .line 31
    return-void
.end method


# virtual methods
.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 43
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 44
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 45
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 46
    return-void
.end method
