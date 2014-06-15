.class public Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;
.super Lorg/anddev/andengine/entity/scene/popup/PopupScene;
.source "TextPopupScene.java"


# instance fields
.field private final mText:Lorg/anddev/andengine/entity/text/Text;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;F)V
    .locals 8
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pDurationSeconds"

    .prologue
    const/4 v6, 0x0

    .line 30
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v7, v6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier;Ljava/lang/Runnable;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLjava/lang/Runnable;)V
    .locals 8
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pDurationSeconds"
    .parameter "pRunnable"

    .prologue
    .line 38
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier;Ljava/lang/Runnable;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 8
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pDurationSeconds"
    .parameter "pShapeModifier"

    .prologue
    .line 34
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier;Ljava/lang/Runnable;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier;Ljava/lang/Runnable;)V
    .locals 6
    .parameter "pCamera"
    .parameter "pParentScene"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pDurationSeconds"
    .parameter "pShapeModifier"
    .parameter "pRunnable"

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0, p1, p2, p5, p7}, Lorg/anddev/andengine/entity/scene/popup/PopupScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/Scene;FLjava/lang/Runnable;)V

    .line 44
    new-instance v0, Lorg/anddev/andengine/entity/text/Text;

    sget-object v5, Lorg/anddev/andengine/util/HorizontalAlign;->CENTER:Lorg/anddev/andengine/util/HorizontalAlign;

    move v2, v1

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/text/Text;-><init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->mText:Lorg/anddev/andengine/entity/text/Text;

    .line 45
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->mText:Lorg/anddev/andengine/entity/text/Text;

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->centerShapeInCamera(Lorg/anddev/andengine/entity/shape/Shape;)V

    .line 47
    if-eqz p6, :cond_0

    .line 48
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->mText:Lorg/anddev/andengine/entity/text/Text;

    invoke-virtual {v0, p6}, Lorg/anddev/andengine/entity/text/Text;->addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 51
    :cond_0
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->mText:Lorg/anddev/andengine/entity/text/Text;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 52
    return-void
.end method


# virtual methods
.method public getText()Lorg/anddev/andengine/entity/text/Text;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/popup/TextPopupScene;->mText:Lorg/anddev/andengine/entity/text/Text;

    return-object v0
.end method
