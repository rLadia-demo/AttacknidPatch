.class public Lorg/anddev/andengine/entity/scene/SplashScene;
.super Lorg/anddev/andengine/entity/scene/Scene;
.source "SplashScene.java"


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;)V
    .locals 6
    .parameter "pCamera"
    .parameter "pTextureRegion"

    .prologue
    const/high16 v4, 0x3f80

    .line 27
    const/high16 v3, -0x4080

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/scene/SplashScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FFF)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FFF)V
    .locals 7
    .parameter "pCamera"
    .parameter "pTextureRegion"
    .parameter "pDuration"
    .parameter "pScaleFrom"
    .parameter "pScaleTo"

    .prologue
    const/high16 v6, 0x3f80

    .line 31
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/anddev/andengine/entity/scene/Scene;-><init>(I)V

    .line 33
    new-instance v0, Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v1

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v2

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v3

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v4

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFFFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    .line 34
    .local v0, loadingScreenSprite:Lorg/anddev/andengine/entity/sprite/Sprite;
    cmpl-float v1, p4, v6

    if-nez v1, :cond_0

    cmpl-float v1, p5, v6

    if-eqz v1, :cond_1

    .line 35
    :cond_0
    invoke-virtual {v0, p4}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 36
    new-instance v1, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;

    sget-object v2, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {v1, p3, p4, p5, v2}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/entity/sprite/Sprite;->addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 39
    :cond_1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/SplashScene;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 40
    return-void
.end method
