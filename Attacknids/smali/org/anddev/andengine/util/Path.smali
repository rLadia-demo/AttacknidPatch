.class public Lorg/anddev/andengine/util/Path;
.super Ljava/lang/Object;
.source "Path.java"


# instance fields
.field private final mCoordinatesX:[F

.field private final mCoordinatesY:[F

.field private mIndex:I

.field private mLength:F

.field private mLengthChanged:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .parameter "pLength"

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-boolean v1, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 31
    new-array v0, p1, [F

    iput-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    .line 32
    new-array v0, p1, [F

    iput-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    .line 34
    iput v1, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    .line 35
    iput-boolean v1, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/Path;)V
    .locals 4
    .parameter "pPath"

    .prologue
    const/4 v3, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-boolean v3, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 51
    invoke-virtual {p1}, Lorg/anddev/andengine/util/Path;->getSize()I

    move-result v0

    .line 52
    .local v0, size:I
    new-array v1, v0, [F

    iput-object v1, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    .line 53
    new-array v1, v0, [F

    iput-object v1, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    .line 55
    iget-object v1, p1, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    iget-object v2, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    iget-object v1, p1, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    iget-object v2, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    iget v1, p1, Lorg/anddev/andengine/util/Path;->mIndex:I

    iput v1, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    .line 59
    iget-boolean v1, p1, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    iput-boolean v1, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 60
    iget v1, p1, Lorg/anddev/andengine/util/Path;->mLength:F

    iput v1, p0, Lorg/anddev/andengine/util/Path;->mLength:F

    .line 61
    return-void
.end method

.method public constructor <init>([F[F)V
    .locals 2
    .parameter "pCoordinatesX"
    .parameter "pCoordinatesY"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 39
    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_0

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Coordinate-Arrays must have the same length."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    iput-object p1, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    .line 44
    iput-object p2, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    .line 46
    array-length v0, p1

    iput v0, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 48
    return-void
.end method

.method private updateLength()V
    .locals 3

    .prologue
    .line 123
    const/4 v1, 0x0

    .line 125
    .local v1, length:F
    iget v2, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    add-int/lit8 v0, v2, -0x2

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 128
    iput v1, p0, Lorg/anddev/andengine/util/Path;->mLength:F

    .line 129
    return-void

    .line 126
    :cond_0
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/util/Path;->getSegmentLength(I)F

    move-result v2

    add-float/2addr v1, v2

    .line 125
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/Path;->clone()Lorg/anddev/andengine/util/Path;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/util/Path;
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lorg/anddev/andengine/util/Path;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/Path;-><init>(Lorg/anddev/andengine/util/Path;)V

    return-object v0
.end method

.method public getCoordinatesX()[F
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    return-object v0
.end method

.method public getCoordinatesY()[F
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    return-object v0
.end method

.method public getLength()F
    .locals 1

    .prologue
    .line 96
    iget-boolean v0, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    if-eqz v0, :cond_0

    .line 97
    invoke-direct {p0}, Lorg/anddev/andengine/util/Path;->updateLength()V

    .line 99
    :cond_0
    iget v0, p0, Lorg/anddev/andengine/util/Path;->mLength:F

    return v0
.end method

.method public getSegmentLength(I)F
    .locals 7
    .parameter "pSegmentIndex"

    .prologue
    .line 103
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    .line 104
    .local v0, coordinatesX:[F
    iget-object v1, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    .line 106
    .local v1, coordinatesY:[F
    add-int/lit8 v4, p1, 0x1

    .line 108
    .local v4, nextSegmentIndex:I
    aget v5, v0, p1

    aget v6, v0, v4

    sub-float v2, v5, v6

    .line 109
    .local v2, dx:F
    aget v5, v1, p1

    aget v6, v1, v4

    sub-float v3, v5, v6

    .line 111
    .local v3, dy:F
    mul-float v5, v2, v2

    mul-float v6, v3, v3

    add-float/2addr v5, v6

    invoke-static {v5}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v5

    return v5
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    array-length v0, v0

    return v0
.end method

.method public to(FF)Lorg/anddev/andengine/util/Path;
    .locals 2
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesX:[F

    iget v1, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    aput p1, v0, v1

    .line 74
    iget-object v0, p0, Lorg/anddev/andengine/util/Path;->mCoordinatesY:[F

    iget v1, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    aput p2, v0, v1

    .line 76
    iget v0, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/util/Path;->mIndex:I

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/util/Path;->mLengthChanged:Z

    .line 80
    return-object p0
.end method
