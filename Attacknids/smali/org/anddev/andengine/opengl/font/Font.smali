.class public Lorg/anddev/andengine/opengl/font/Font;
.super Ljava/lang/Object;
.source "Font.java"


# static fields
.field private static final LETTER_EXTRA_WIDTH:I = 0xa

.field protected static final LETTER_LEFT_OFFSET:F


# instance fields
.field private final mBackgroundPaint:Landroid/graphics/Paint;

.field protected final mCanvas:Landroid/graphics/Canvas;

.field private final mCreateLetterTemporarySize:Lorg/anddev/andengine/opengl/font/Size;

.field private mCurrentTextureX:I

.field private mCurrentTextureY:I

.field protected final mFontMetrics:Landroid/graphics/Paint$FontMetrics;

.field private final mGetLetterBitmapTemporaryRect:Landroid/graphics/Rect;

.field private final mGetLetterBoundsTemporaryRect:Landroid/graphics/Rect;

.field private final mGetStringWidthTemporaryRect:Landroid/graphics/Rect;

.field private final mLettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/font/Letter;",
            ">;"
        }
    .end annotation
.end field

.field private final mLineGap:I

.field private final mLineHeight:I

.field private final mManagedCharacterToLetterMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lorg/anddev/andengine/opengl/font/Letter;",
            ">;"
        }
    .end annotation
.end field

.field protected final mPaint:Landroid/graphics/Paint;

.field private final mTemporaryTextWidthFetchers:[F

.field private final mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field private final mTextureHeight:F

.field private final mTextureWidth:F


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/graphics/Typeface;FZI)V
    .locals 2
    .parameter "pTexture"
    .parameter "pTypeface"
    .parameter "pSize"
    .parameter "pAntiAlias"
    .parameter "pColor"

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    .line 42
    iput v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureY:I

    .line 44
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mManagedCharacterToLetterMap:Landroid/util/SparseArray;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mLettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;

    .line 54
    new-instance v0, Lorg/anddev/andengine/opengl/font/Size;

    invoke-direct {v0}, Lorg/anddev/andengine/opengl/font/Size;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mCreateLetterTemporarySize:Lorg/anddev/andengine/opengl/font/Size;

    .line 55
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetLetterBitmapTemporaryRect:Landroid/graphics/Rect;

    .line 56
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetStringWidthTemporaryRect:Landroid/graphics/Rect;

    .line 57
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetLetterBoundsTemporaryRect:Landroid/graphics/Rect;

    .line 58
    const/4 v0, 0x1

    new-array v0, v0, [F

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mTemporaryTextWidthFetchers:[F

    .line 60
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mCanvas:Landroid/graphics/Canvas;

    .line 67
    iput-object p1, p0, Lorg/anddev/andengine/opengl/font/Font;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 68
    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureWidth:F

    .line 69
    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureHeight:F

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    .line 72
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 77
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 78
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 81
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    .line 82
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->descent:F

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    add-float/2addr v0, v1

    invoke-static {v0}, Landroid/util/FloatMath;->ceil(F)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mLineHeight:I

    .line 83
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->leading:F

    invoke-static {v0}, Landroid/util/FloatMath;->ceil(F)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mLineGap:I

    .line 84
    return-void
.end method

.method private createLetter(C)Lorg/anddev/andengine/opengl/font/Letter;
    .locals 14
    .parameter "pCharacter"

    .prologue
    .line 170
    iget v13, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureWidth:F

    .line 171
    .local v13, textureWidth:F
    iget v12, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureHeight:F

    .line 173
    .local v12, textureHeight:F
    iget-object v9, p0, Lorg/anddev/andengine/opengl/font/Font;->mCreateLetterTemporarySize:Lorg/anddev/andengine/opengl/font/Size;

    .line 174
    .local v9, createLetterTemporarySize:Lorg/anddev/andengine/opengl/font/Size;
    invoke-direct {p0, p1, v9}, Lorg/anddev/andengine/opengl/font/Font;->getLetterBounds(CLorg/anddev/andengine/opengl/font/Size;)V

    .line 176
    invoke-virtual {v9}, Lorg/anddev/andengine/opengl/font/Size;->getWidth()F

    move-result v11

    .line 177
    .local v11, letterWidth:F
    invoke-virtual {v9}, Lorg/anddev/andengine/opengl/font/Size;->getHeight()F

    move-result v10

    .line 179
    .local v10, letterHeight:F
    iget v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    int-to-float v1, v1

    add-float/2addr v1, v11

    cmpl-float v1, v1, v13

    if-ltz v1, :cond_0

    .line 180
    const/4 v1, 0x0

    iput v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    .line 181
    iget v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureY:I

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/font/Font;->getLineGap()I

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v1, v2

    iput v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureY:I

    .line 184
    :cond_0
    iget v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    int-to-float v1, v1

    div-float v5, v1, v13

    .line 185
    .local v5, letterTextureX:F
    iget v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureY:I

    int-to-float v1, v1

    div-float v6, v1, v12

    .line 186
    .local v6, letterTextureY:F
    div-float v7, v11, v13

    .line 187
    .local v7, letterTextureWidth:F
    div-float v8, v10, v12

    .line 189
    .local v8, letterTextureHeight:F
    new-instance v0, Lorg/anddev/andengine/opengl/font/Letter;

    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/font/Font;->getLetterAdvance(C)I

    move-result v2

    float-to-int v3, v11

    float-to-int v4, v10

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lorg/anddev/andengine/opengl/font/Letter;-><init>(CIIIFFFF)V

    .line 190
    .local v0, letter:Lorg/anddev/andengine/opengl/font/Letter;
    iget v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    int-to-float v1, v1

    add-float/2addr v1, v11

    float-to-int v1, v1

    iput v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mCurrentTextureX:I

    .line 192
    return-object v0
.end method

.method private getLetterAdvance(C)I
    .locals 3
    .parameter "pCharacter"

    .prologue
    .line 121
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/Font;->mTemporaryTextWidthFetchers:[F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 122
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mTemporaryTextWidthFetchers:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-static {v0}, Landroid/util/FloatMath;->ceil(F)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private getLetterBitmap(C)Landroid/graphics/Bitmap;
    .locals 10
    .parameter "pCharacter"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 126
    iget-object v8, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetLetterBitmapTemporaryRect:Landroid/graphics/Rect;

    .line 127
    .local v8, getLetterBitmapTemporaryRect:Landroid/graphics/Rect;
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    .line 128
    .local v7, characterAsString:Ljava/lang/String;
    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v7, v3, v0, v8}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 130
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v9

    .line 131
    .local v9, lineHeight:I
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v9, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 132
    .local v6, bitmap:Landroid/graphics/Bitmap;
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 135
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v2

    add-int/lit8 v2, v2, 0xa

    int-to-float v3, v2

    int-to-float v4, v9

    iget-object v5, p0, Lorg/anddev/andengine/opengl/font/Font;->mBackgroundPaint:Landroid/graphics/Paint;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 138
    invoke-virtual {p0, v7}, Lorg/anddev/andengine/opengl/font/Font;->drawCharacterString(Ljava/lang/String;)V

    .line 140
    return-object v6

    .line 131
    .end local v6           #bitmap:Landroid/graphics/Bitmap;
    :cond_0
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    goto :goto_0
.end method

.method private getLetterBounds(CLorg/anddev/andengine/opengl/font/Size;)V
    .locals 5
    .parameter "pCharacter"
    .parameter "pSize"

    .prologue
    .line 153
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetLetterBoundsTemporaryRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 154
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetLetterBoundsTemporaryRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Lorg/anddev/andengine/opengl/font/Size;->set(II)V

    .line 155
    return-void
.end method


# virtual methods
.method protected drawCharacterString(Ljava/lang/String;)V
    .locals 4
    .parameter "pCharacterAsString"

    .prologue
    .line 144
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mCanvas:Landroid/graphics/Canvas;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/Font;->mFontMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->ascent:F

    neg-float v2, v2

    iget-object v3, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 145
    return-void
.end method

.method public declared-synchronized getLetter(C)Lorg/anddev/andengine/opengl/font/Letter;
    .locals 3
    .parameter "pCharacter"

    .prologue
    .line 158
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mManagedCharacterToLetterMap:Landroid/util/SparseArray;

    .line 159
    .local v1, managedCharacterToLetterMap:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/opengl/font/Letter;>;"
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/font/Letter;

    .line 160
    .local v0, letter:Lorg/anddev/andengine/opengl/font/Letter;
    if-nez v0, :cond_0

    .line 161
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/font/Font;->createLetter(C)Lorg/anddev/andengine/opengl/font/Letter;

    move-result-object v0

    .line 163
    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/Font;->mLettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    :cond_0
    monitor-exit p0

    return-object v0

    .line 158
    .end local v0           #letter:Lorg/anddev/andengine/opengl/font/Letter;
    .end local v1           #managedCharacterToLetterMap:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/opengl/font/Letter;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getLineGap()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mLineGap:I

    return v0
.end method

.method public getLineHeight()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mLineHeight:I

    return v0
.end method

.method public getStringWidth(Ljava/lang/String;)I
    .locals 4
    .parameter "pText"

    .prologue
    .line 148
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetStringWidthTemporaryRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, v1, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 149
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mGetStringWidthTemporaryRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getTexture()Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/Font;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    return-object v0
.end method

.method public declared-synchronized reload()V
    .locals 4

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/Font;->mLettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;

    .line 112
    .local v1, lettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Letter;>;"
    iget-object v2, p0, Lorg/anddev/andengine/opengl/font/Font;->mManagedCharacterToLetterMap:Landroid/util/SparseArray;

    .line 115
    .local v2, managedCharacterToLetterMap:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/opengl/font/Letter;>;"
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 118
    monitor-exit p0

    return-void

    .line 116
    :cond_0
    :try_start_1
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/opengl/font/Letter;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 111
    .end local v0           #i:I
    .end local v1           #lettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Letter;>;"
    .end local v2           #managedCharacterToLetterMap:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/opengl/font/Letter;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized update(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 11
    .parameter "pGL"

    .prologue
    .line 196
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lorg/anddev/andengine/opengl/font/Font;->mLettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;

    .line 197
    .local v4, lettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Letter;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_0

    .line 198
    iget-object v7, p0, Lorg/anddev/andengine/opengl/font/Font;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v7}, Lorg/anddev/andengine/opengl/texture/Texture;->getHardwareTextureID()I

    move-result v1

    .line 200
    .local v1, hardwareTextureID:I
    iget v6, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureWidth:F

    .line 201
    .local v6, textureWidth:F
    iget v5, p0, Lorg/anddev/andengine/opengl/font/Font;->mTextureHeight:F

    .line 203
    .local v5, textureHeight:F
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_1

    .line 212
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 213
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    .end local v1           #hardwareTextureID:I
    .end local v2           #i:I
    .end local v5           #textureHeight:F
    .end local v6           #textureWidth:F
    :cond_0
    monitor-exit p0

    return-void

    .line 204
    .restart local v1       #hardwareTextureID:I
    .restart local v2       #i:I
    .restart local v5       #textureHeight:F
    .restart local v6       #textureWidth:F
    :cond_1
    :try_start_1
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/opengl/font/Letter;

    .line 205
    .local v3, letter:Lorg/anddev/andengine/opengl/font/Letter;
    iget-char v7, v3, Lorg/anddev/andengine/opengl/font/Letter;->mCharacter:C

    invoke-direct {p0, v7}, Lorg/anddev/andengine/opengl/font/Font;->getLetterBitmap(C)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 207
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 208
    const/16 v7, 0xde1

    const/4 v8, 0x0

    iget v9, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureX:F

    mul-float/2addr v9, v6

    float-to-int v9, v9

    iget v10, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureY:F

    mul-float/2addr v10, v5

    float-to-int v10, v10

    invoke-static {v7, v8, v9, v10, v0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 210
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 196
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v1           #hardwareTextureID:I
    .end local v2           #i:I
    .end local v3           #letter:Lorg/anddev/andengine/opengl/font/Letter;
    .end local v4           #lettersPendingToBeDrawnToTexture:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Letter;>;"
    .end local v5           #textureHeight:F
    .end local v6           #textureWidth:F
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method
