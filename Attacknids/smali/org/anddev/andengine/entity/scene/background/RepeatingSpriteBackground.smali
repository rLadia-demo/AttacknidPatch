.class public Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;
.super Lorg/anddev/andengine/entity/scene/background/SpriteBackground;
.source "RepeatingSpriteBackground.java"


# instance fields
.field private mTexture:Lorg/anddev/andengine/opengl/texture/Texture;


# direct methods
.method public constructor <init>(FFFFFLorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pCameraWidth"
    .parameter "pCameraHeight"
    .parameter "pTextureManager"
    .parameter "pTextureSource"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/scene/background/SpriteBackground;-><init>(FFFLorg/anddev/andengine/entity/sprite/BaseSprite;)V

    .line 52
    invoke-direct {p0, p4, p5, p6, p7}, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->loadSprite(FFLorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 53
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)V
    .locals 1
    .parameter "pCameraWidth"
    .parameter "pCameraHeight"
    .parameter "pTextureManager"
    .parameter "pTextureSource"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/anddev/andengine/entity/scene/background/SpriteBackground;-><init>(Lorg/anddev/andengine/entity/sprite/BaseSprite;)V

    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->loadSprite(FFLorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mEntity:Lorg/anddev/andengine/entity/IEntity;

    .line 39
    return-void
.end method

.method private loadSprite(FFLorg/anddev/andengine/opengl/texture/TextureManager;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)Lorg/anddev/andengine/entity/sprite/Sprite;
    .locals 9
    .parameter "pCameraWidth"
    .parameter "pCameraHeight"
    .parameter "pTextureManager"
    .parameter "pTextureSource"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v1, 0x0

    .line 72
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-interface {p4}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v2

    invoke-interface {p4}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v3

    sget-object v4, Lorg/anddev/andengine/opengl/texture/TextureOptions;->REPEATING_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v2, v3, v4}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-static {v0, p4, v8, v8}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromSource(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v5

    .line 75
    .local v5, textureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 76
    .local v7, width:I
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 78
    .local v6, height:I
    invoke-virtual {v5, v7}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->setWidth(I)V

    .line 79
    invoke-virtual {v5, v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;->setHeight(I)V

    .line 81
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {p3, v0}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 83
    new-instance v0, Lorg/anddev/andengine/entity/sprite/Sprite;

    int-to-float v3, v7

    int-to-float v4, v6

    move v2, v1

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFFFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    return-object v0
.end method


# virtual methods
.method public getTexture()Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/RepeatingSpriteBackground;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    return-object v0
.end method
