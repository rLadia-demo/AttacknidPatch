.class public Lorg/anddev/andengine/opengl/font/FontFactory;
.super Ljava/lang/Object;
.source "FontFactory.java"


# static fields
.field private static sAssetBasePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, ""

    sput-object v0, Lorg/anddev/andengine/opengl/font/FontFactory;->sAssetBasePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)Lorg/anddev/andengine/opengl/font/Font;
    .locals 6
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"

    .prologue
    .line 51
    new-instance v0, Lorg/anddev/andengine/opengl/font/Font;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/font/Font;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)V

    return-object v0
.end method

.method public static createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;FZI)Lorg/anddev/andengine/opengl/font/Font;
    .locals 6
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"

    .prologue
    .line 63
    new-instance v0, Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lorg/anddev/andengine/opengl/font/FontFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    move-object v1, p0

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/font/Font;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)V

    return-object v0
.end method

.method public static createStroke(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIII)Lorg/anddev/andengine/opengl/font/StrokeFont;
    .locals 8
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"

    .prologue
    .line 55
    new-instance v0, Lorg/anddev/andengine/opengl/font/StrokeFont;

    int-to-float v6, p5

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/opengl/font/StrokeFont;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFI)V

    return-object v0
.end method

.method public static createStroke(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIIIZ)Lorg/anddev/andengine/opengl/font/StrokeFont;
    .locals 9
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"
    .parameter "pStrokeOnly"

    .prologue
    .line 59
    new-instance v0, Lorg/anddev/andengine/opengl/font/StrokeFont;

    int-to-float v6, p5

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/anddev/andengine/opengl/font/StrokeFont;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFIZ)V

    return-object v0
.end method

.method public static createStrokeFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;FZIII)Lorg/anddev/andengine/opengl/font/StrokeFont;
    .locals 8
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"

    .prologue
    .line 67
    new-instance v0, Lorg/anddev/andengine/opengl/font/StrokeFont;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lorg/anddev/andengine/opengl/font/FontFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    int-to-float v6, p6

    move-object v1, p0

    move v3, p3

    move v4, p4

    move v5, p5

    move v7, p7

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/opengl/font/StrokeFont;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFI)V

    return-object v0
.end method

.method public static createStrokeFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;FZIIIZ)Lorg/anddev/andengine/opengl/font/StrokeFont;
    .locals 9
    .parameter "pTexture"
    .parameter "pContext"
    .parameter "pAssetPath"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"
    .parameter "pStrokeOnly"

    .prologue
    .line 71
    new-instance v0, Lorg/anddev/andengine/opengl/font/StrokeFont;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lorg/anddev/andengine/opengl/font/FontFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    int-to-float v6, p6

    move-object v1, p0

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lorg/anddev/andengine/opengl/font/StrokeFont;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFIZ)V

    return-object v0
.end method

.method public static setAssetBasePath(Ljava/lang/String;)V
    .locals 2
    .parameter "pAssetBasePath"

    .prologue
    .line 35
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 36
    :cond_0
    sput-object p0, Lorg/anddev/andengine/opengl/font/FontFactory;->sAssetBasePath:Ljava/lang/String;

    .line 40
    return-void

    .line 38
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "pAssetBasePath must end with \'/\' or be lenght zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
