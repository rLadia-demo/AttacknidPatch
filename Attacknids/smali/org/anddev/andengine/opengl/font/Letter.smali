.class public Lorg/anddev/andengine/opengl/font/Letter;
.super Ljava/lang/Object;
.source "Letter.java"


# instance fields
.field public final mAdvance:I

.field public final mCharacter:C

.field public final mHeight:I

.field public final mTextureHeight:F

.field public final mTextureWidth:F

.field public final mTextureX:F

.field public final mTextureY:F

.field public final mWidth:I


# direct methods
.method constructor <init>(CIIIFFFF)V
    .locals 0
    .parameter "pCharacter"
    .parameter "pAdvance"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureX"
    .parameter "pTextureY"
    .parameter "pTextureWidth"
    .parameter "pTextureHeight"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-char p1, p0, Lorg/anddev/andengine/opengl/font/Letter;->mCharacter:C

    .line 34
    iput p2, p0, Lorg/anddev/andengine/opengl/font/Letter;->mAdvance:I

    .line 35
    iput p3, p0, Lorg/anddev/andengine/opengl/font/Letter;->mWidth:I

    .line 36
    iput p4, p0, Lorg/anddev/andengine/opengl/font/Letter;->mHeight:I

    .line 37
    iput p5, p0, Lorg/anddev/andengine/opengl/font/Letter;->mTextureX:F

    .line 38
    iput p6, p0, Lorg/anddev/andengine/opengl/font/Letter;->mTextureY:F

    .line 39
    iput p7, p0, Lorg/anddev/andengine/opengl/font/Letter;->mTextureWidth:F

    .line 40
    iput p8, p0, Lorg/anddev/andengine/opengl/font/Letter;->mTextureHeight:F

    .line 41
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 61
    if-ne p0, p1, :cond_1

    .line 74
    :cond_0
    :goto_0
    return v1

    .line 64
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 65
    goto :goto_0

    .line 67
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 68
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 70
    check-cast v0, Lorg/anddev/andengine/opengl/font/Letter;

    .line 71
    .local v0, other:Lorg/anddev/andengine/opengl/font/Letter;
    iget-char v3, p0, Lorg/anddev/andengine/opengl/font/Letter;->mCharacter:C

    iget-char v4, v0, Lorg/anddev/andengine/opengl/font/Letter;->mCharacter:C

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 72
    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 53
    const/16 v0, 0x1f

    .line 54
    .local v0, prime:I
    const/4 v1, 0x1

    .line 55
    .local v1, result:I
    iget-char v2, p0, Lorg/anddev/andengine/opengl/font/Letter;->mCharacter:C

    add-int/lit8 v1, v2, 0x1f

    .line 56
    return v1
.end method
