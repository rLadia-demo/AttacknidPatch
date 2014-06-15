.class public Lcom/SixClawWorm/utils/GButton;
.super Lorg/anddev/andengine/engine/camera/hud/HUD;
.source "GButton.java"

# interfaces
.implements Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/SixClawWorm/utils/GButton$GButtonClickListener;
    }
.end annotation


# static fields
.field public static isPlayControl:Z

.field public static startPauseTime:J

.field public static stopTime:J


# instance fields
.field private final TAG:Ljava/lang/String;

.field handler:Landroid/os/Handler;

.field private mButonName:Lorg/anddev/andengine/entity/text/ChangeableText;

.field private mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

.field private final mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

.field private mStatus:Z

.field runnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 35
    const-wide/16 v0, 0x258

    sput-wide v0, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    .line 36
    const/4 v0, 0x0

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V
    .locals 13
    .parameter "pX"
    .parameter "pY"
    .parameter "pCamera"
    .parameter "engine"
    .parameter "pOnRegion"
    .parameter "pGButtonClickListener"
    .parameter "buttonName"

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>()V

    .line 28
    const-string v3, "GButton"

    iput-object v3, p0, Lcom/SixClawWorm/utils/GButton;->TAG:Ljava/lang/String;

    .line 33
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/SixClawWorm/utils/GButton;->mStatus:Z

    .line 140
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    iput-object v3, p0, Lcom/SixClawWorm/utils/GButton;->handler:Landroid/os/Handler;

    .line 141
    new-instance v3, Lcom/SixClawWorm/utils/GButton$1;

    invoke-direct {v3, p0}, Lcom/SixClawWorm/utils/GButton$1;-><init>(Lcom/SixClawWorm/utils/GButton;)V

    iput-object v3, p0, Lcom/SixClawWorm/utils/GButton;->runnable:Ljava/lang/Runnable;

    .line 42
    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/utils/GButton;->setCamera(Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 43
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

    .line 44
    new-instance v3, Lcom/SixClawWorm/utils/GButton$2;

    int-to-float v4, p1

    int-to-float v5, p2

    move-object/from16 v0, p5

    invoke-direct {v3, p0, v4, v5, v0}, Lcom/SixClawWorm/utils/GButton$2;-><init>(Lcom/SixClawWorm/utils/GButton;FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    iput-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    .line 112
    iget-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 113
    iget-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v3}, Lorg/anddev/andengine/engine/camera/Camera;->getHUD()Lorg/anddev/andengine/engine/camera/hud/HUD;

    move-result-object v3

    iget-object v4, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v3, v4}, Lorg/anddev/andengine/engine/camera/hud/HUD;->registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V

    .line 114
    iget-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v3}, Lorg/anddev/andengine/engine/camera/Camera;->getHUD()Lorg/anddev/andengine/engine/camera/hud/HUD;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setTouchAreaBindingEnabled(Z)V

    .line 115
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/GButton;->getBottomLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v3

    iget-object v4, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-interface {v3, v4}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 119
    if-eqz p7, :cond_0

    .line 122
    new-instance v2, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v3, 0x100

    const/16 v4, 0x100

    sget-object v5, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v2, v3, v4, v5}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 123
    .local v2, fontTexture:Lorg/anddev/andengine/opengl/texture/Texture;
    new-instance v1, Lorg/anddev/andengine/opengl/font/Font;

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v3

    .line 124
    const/high16 v4, 0x4180

    const/4 v5, 0x1

    const/4 v6, -0x1

    .line 123
    invoke-direct/range {v1 .. v6}, Lorg/anddev/andengine/opengl/font/Font;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)V

    .line 125
    .local v1, font:Lorg/anddev/andengine/opengl/font/Font;
    invoke-virtual/range {p4 .. p4}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 126
    invoke-virtual/range {p4 .. p4}, Lorg/anddev/andengine/engine/Engine;->getFontManager()Lorg/anddev/andengine/opengl/font/FontManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/anddev/andengine/opengl/font/FontManager;->loadFont(Lorg/anddev/andengine/opengl/font/Font;)V

    .line 127
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 128
    .local v9, paint:Landroid/graphics/Paint;
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 130
    .local v10, textBoundRect:Landroid/graphics/Rect;
    const/4 v3, 0x0

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result v4

    move-object/from16 v0, p7

    invoke-virtual {v9, v0, v3, v4, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 131
    iget-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v3}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getWidth()F

    move-result v3

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p1

    add-int/lit8 v11, v3, -0x5

    .line 132
    .local v11, textX:I
    iget-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v3}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getHeight()F

    move-result v3

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p2

    add-int/lit8 v12, v3, -0x2

    .line 135
    .local v12, textY:I
    new-instance v3, Lorg/anddev/andengine/entity/text/ChangeableText;

    int-to-float v4, v11

    int-to-float v5, v12

    const/16 v8, 0x8

    move-object v6, v1

    move-object/from16 v7, p7

    invoke-direct/range {v3 .. v8}, Lorg/anddev/andengine/entity/text/ChangeableText;-><init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;I)V

    iput-object v3, p0, Lcom/SixClawWorm/utils/GButton;->mButonName:Lorg/anddev/andengine/entity/text/ChangeableText;

    .line 137
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/GButton;->getBottomLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v3

    iget-object v4, p0, Lcom/SixClawWorm/utils/GButton;->mButonName:Lorg/anddev/andengine/entity/text/ChangeableText;

    invoke-interface {v3, v4}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 139
    .end local v1           #font:Lorg/anddev/andengine/opengl/font/Font;
    .end local v2           #fontTexture:Lorg/anddev/andengine/opengl/texture/Texture;
    .end local v9           #paint:Landroid/graphics/Paint;
    .end local v10           #textBoundRect:Landroid/graphics/Rect;
    .end local v11           #textX:I
    .end local v12           #textY:I
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/utils/GButton;)Lcom/SixClawWorm/utils/GButton$GButtonClickListener;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mGButtonClickListener:Lcom/SixClawWorm/utils/GButton$GButtonClickListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/utils/GButton;)Lorg/anddev/andengine/entity/sprite/AnimatedSprite;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    return-object v0
.end method

.method static synthetic access$2(Lcom/SixClawWorm/utils/GButton;)Z
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/SixClawWorm/utils/GButton;->mStatus:Z

    return v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/utils/GButton;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 33
    iput-boolean p1, p0, Lcom/SixClawWorm/utils/GButton;->mStatus:Z

    return-void
.end method


# virtual methods
.method public getX()F
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getX()F

    move-result v0

    .line 207
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getY()F
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->getY()F

    move-result v0

    .line 213
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Lorg/anddev/andengine/input/touch/detector/ClickDetector;Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 2
    .parameter "pClickDetector"
    .parameter "pTouchEvent"

    .prologue
    .line 187
    const-string v0, "GButton"

    const-string v1, "onClick"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    return-void
.end method

.method public setPosition(FF)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 199
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/SixClawWorm/utils/GButton;->mControlButton:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-virtual {v0, p1, p2}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setPosition(FF)V

    .line 201
    :cond_0
    return-void
.end method
