.class public Lorg/anddev/andengine/entity/shape/modifier/PathModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/ShapeModifier;
.source "PathModifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    }
.end annotation


# instance fields
.field private final mPath:Lorg/anddev/andengine/util/Path;

.field private mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

.field private final mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/SequenceModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(FLorg/anddev/andengine/util/Path;)V
    .locals 2
    .parameter "pDuration"
    .parameter "pPath"

    .prologue
    .line 34
    const/4 v0, 0x0

    sget-object v1, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 35
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pPath"
    .parameter "pShapeModifierListener"

    .prologue
    .line 42
    const/4 v4, 0x0

    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 43
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pPath"
    .parameter "pShapeModifierListener"
    .parameter "pPathModifierListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 50
    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 51
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 18
    .parameter "pDuration"
    .parameter "pPath"
    .parameter "pShapeModifierListener"
    .parameter "pPathModifierListener"
    .parameter "pEaseFunction"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct/range {p0 .. p0}, Lorg/anddev/andengine/entity/shape/modifier/ShapeModifier;-><init>()V

    .line 54
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/util/Path;->getSize()I

    move-result v16

    .line 56
    .local v16, pathSize:I
    const/4 v2, 0x2

    move/from16 v0, v16

    if-ge v0, v2, :cond_0

    .line 57
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Path needs at least 2 waypoints!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 60
    :cond_0
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPath:Lorg/anddev/andengine/util/Path;

    .line 61
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    .line 62
    move-object/from16 v0, p4

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    .line 64
    add-int/lit8 v2, v16, -0x1

    new-array v15, v2, [Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;

    .line 66
    .local v15, moveModifiers:[Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/util/Path;->getCoordinatesX()[F

    move-result-object v11

    .line 67
    .local v11, coordinatesX:[F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/util/Path;->getCoordinatesY()[F

    move-result-object v12

    .line 69
    .local v12, coordinatesY:[F
    invoke-virtual/range {p2 .. p2}, Lorg/anddev/andengine/util/Path;->getLength()F

    move-result v2

    div-float v17, v2, p1

    .line 71
    .local v17, velocity:F
    array-length v14, v15

    .line 72
    .local v14, modifierCount:I
    const/4 v13, 0x0

    .local v13, i:I
    :goto_0
    if-lt v13, v14, :cond_1

    .line 95
    new-instance v2, Lorg/anddev/andengine/util/modifier/SequenceModifier;

    .line 96
    new-instance v3, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v14}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;-><init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;I)V

    .line 107
    new-instance v5, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;-><init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)V

    .line 115
    invoke-direct {v2, v3, v5, v15}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 95
    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    .line 117
    return-void

    .line 73
    :cond_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/anddev/andengine/util/Path;->getSegmentLength(I)F

    move-result v2

    div-float v4, v2, v17

    .line 75
    .local v4, duration:F
    if-nez v13, :cond_2

    .line 78
    new-instance v2, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;

    aget v5, v11, v13

    add-int/lit8 v3, v13, 0x1

    aget v6, v11, v3

    aget v7, v12, v13

    add-int/lit8 v3, v13, 0x1

    aget v8, v12, v3

    const/4 v9, 0x0

    move-object/from16 v3, p0

    move-object/from16 v10, p5

    invoke-direct/range {v2 .. v10}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;-><init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    aput-object v2, v15, v13

    .line 72
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 88
    :cond_2
    new-instance v3, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;

    aget v5, v11, v13

    add-int/lit8 v2, v13, 0x1

    aget v6, v11, v2

    aget v7, v12, v13

    add-int/lit8 v2, v13, 0x1

    aget v8, v12, v2

    const/4 v9, 0x0

    move-object/from16 v10, p5

    invoke-direct/range {v3 .. v10}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    aput-object v3, v15, v13

    goto :goto_1
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pPath"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 46
    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 47
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 1
    .parameter "pDuration"
    .parameter "pPath"
    .parameter "pEaseFunction"

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 39
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)V
    .locals 1
    .parameter "pPathModifier"

    .prologue
    .line 119
    invoke-direct {p0}, Lorg/anddev/andengine/entity/shape/modifier/ShapeModifier;-><init>()V

    .line 120
    iget-object v0, p1, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPath:Lorg/anddev/andengine/util/Path;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/Path;->clone()Lorg/anddev/andengine/util/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPath:Lorg/anddev/andengine/util/Path;

    .line 121
    iget-object v0, p1, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->clone()Lorg/anddev/andengine/util/modifier/SequenceModifier;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    .line 122
    return-void
.end method

.method static synthetic access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    return-object v0
.end method

.method static synthetic access$3(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    .locals 1
    .parameter

    .prologue
    .line 14
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    return-object v0
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/PathModifier;
    .locals 1

    .prologue
    .line 126
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    move-result-object v0

    return-object v0
.end method

.method public getDuration()F
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->getDuration()F

    move-result v0

    return v0
.end method

.method public getPath()Lorg/anddev/andengine/util/Path;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPath:Lorg/anddev/andengine/util/Path;

    return-object v0
.end method

.method public getPathModifierListener()Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    return-object v0
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->isFinished()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic onUpdate(FLjava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p2, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->onUpdate(FLorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method public onUpdate(FLorg/anddev/andengine/entity/shape/IShape;)V
    .locals 1
    .parameter "pSecondsElapsed"
    .parameter "pShape"

    .prologue
    .line 166
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-virtual {v0, p1, p2}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->onUpdate(FLjava/lang/Object;)V

    .line 167
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->reset()V

    .line 162
    return-void
.end method

.method public setPathModifierListener(Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;)V
    .locals 0
    .parameter "pPathModifierListener"

    .prologue
    .line 156
    iput-object p1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    .line 157
    return-void
.end method
