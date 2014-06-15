.class public Lorg/anddev/andengine/opengl/font/StrokeFont;
.super Lorg/anddev/andengine/opengl/font/Font;
.source "StrokeFont.java"


# instance fields
.field private final mStrokeOnly:Z

.field private final mStrokePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFI)V
    .locals 9
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"

    .prologue
    .line 30
    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lorg/anddev/andengine/opengl/font/StrokeFont;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFIZ)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZIFIZ)V
    .locals 2
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"
    .parameter "pStrokeWidth"
    .parameter "pStrokeColor"
    .parameter "pStrokeOnly"

    .prologue
    .line 34
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/opengl/font/Font;-><init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)V

    .line 35
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    .line 36
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 37
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 38
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p7}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 41
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 43
    iput-boolean p8, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokeOnly:Z

    .line 44
    return-void
.end method


# virtual methods
.method protected drawCharacterString(Ljava/lang/String;)V
    .locals 4
    .parameter "pCharacterAsString"

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokeOnly:Z

    if-nez v0, :cond_0

    .line 57
    invoke-super {p0, p1}, Lorg/anddev/andengine/opengl/font/Font;->drawCharacterString(Ljava/lang/String;)V

    .line 59
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mCanvas:Landroid/graphics/Canvas;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->ascent:F

    neg-float v2, v2

    iget-object v3, p0, Lorg/anddev/andengine/opengl/font/StrokeFont;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 60
    return-void
.end method
