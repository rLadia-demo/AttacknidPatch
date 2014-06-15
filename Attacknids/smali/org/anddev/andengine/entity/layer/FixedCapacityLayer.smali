.class public Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;
.super Lorg/anddev/andengine/entity/layer/BaseLayer;
.source "FixedCapacityLayer.java"


# instance fields
.field private final mCapacity:I

.field private final mEntities:[Lorg/anddev/andengine/entity/IEntity;

.field private mEntityCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .parameter "pCapacity"

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/entity/layer/BaseLayer;-><init>()V

    .line 34
    iput p1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mCapacity:I

    .line 35
    new-array v0, p1, [Lorg/anddev/andengine/entity/IEntity;

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 37
    return-void
.end method

.method private checkIndex(I)V
    .locals 3
    .parameter "pIndex"

    .prologue
    .line 213
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    if-lt p1, v0, :cond_1

    .line 214
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (Size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | Capacity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mCapacity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_1
    return-void
.end method

.method private indexOfEntity(Lorg/anddev/andengine/entity/IEntity;)I
    .locals 4
    .parameter "pEntity"

    .prologue
    .line 153
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 154
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    array-length v3, v0

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_1

    .line 160
    const/4 v2, -0x1

    .end local v2           #i:I
    :cond_0
    return v2

    .line 155
    .restart local v2       #i:I
    :cond_1
    aget-object v1, v0, v2

    .line 156
    .local v1, entity:Lorg/anddev/andengine/entity/IEntity;
    if-eq v1, p1, :cond_0

    .line 154
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method


# virtual methods
.method public addEntity(Lorg/anddev/andengine/entity/IEntity;)V
    .locals 2
    .parameter "pEntity"

    .prologue
    .line 98
    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    iget v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mCapacity:I

    if-ge v0, v1, :cond_0

    .line 99
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    iget v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    aput-object p1, v0, v1

    .line 100
    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 102
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 90
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 93
    const/4 v2, 0x0

    iput v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 94
    return-void

    .line 91
    :cond_0
    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 90
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public findEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Lorg/anddev/andengine/entity/IEntity;
    .locals 4
    .parameter "pEntityMatcher"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 143
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    array-length v3, v0

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_1

    .line 149
    const/4 v1, 0x0

    :cond_0
    return-object v1

    .line 144
    :cond_1
    aget-object v1, v0, v2

    .line 145
    .local v1, entity:Lorg/anddev/andengine/entity/IEntity;
    invoke-interface {p1, v1}, Lorg/anddev/andengine/util/IEntityMatcher;->matches(Lorg/anddev/andengine/entity/IEntity;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 143
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method public getEntity(I)Lorg/anddev/andengine/entity/IEntity;
    .locals 1
    .parameter "pIndex"

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->checkIndex(I)V

    .line 84
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getEntityCount()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    return v0
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 54
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 55
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    iget v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 56
    .local v1, entityCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 59
    return-void

    .line 57
    :cond_0
    aget-object v3, v0, v2

    invoke-interface {v3, p1, p2}, Lorg/anddev/andengine/entity/IEntity;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 56
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected onManagedUpdate(F)V
    .locals 4
    .parameter "pSecondsElapsed"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 64
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    iget v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 65
    .local v1, entityCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 68
    return-void

    .line 66
    :cond_0
    aget-object v3, v0, v2

    invoke-interface {v3, p1}, Lorg/anddev/andengine/entity/IEntity;->onUpdate(F)V

    .line 65
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public removeEntity(I)Lorg/anddev/andengine/entity/IEntity;
    .locals 5
    .parameter "pIndex"

    .prologue
    const/4 v4, 0x0

    .line 111
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->checkIndex(I)V

    .line 113
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 114
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    aget-object v2, v0, p1

    .line 116
    .local v2, out:Lorg/anddev/andengine/entity/IEntity;
    iget v3, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    add-int/lit8 v1, v3, -0x1

    .line 117
    .local v1, lastIndex:I
    if-ne p1, v1, :cond_0

    .line 118
    iget-object v3, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    aput-object v4, v3, v1

    .line 123
    :goto_0
    iput v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    .line 125
    return-object v2

    .line 120
    :cond_0
    aget-object v3, v0, v1

    aput-object v3, v0, p1

    .line 121
    iget v3, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    aput-object v4, v0, v3

    goto :goto_0
.end method

.method public removeEntity(Lorg/anddev/andengine/entity/IEntity;)Z
    .locals 1
    .parameter "pEntity"

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->indexOfEntity(Lorg/anddev/andengine/entity/IEntity;)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->removeEntity(I)Lorg/anddev/andengine/entity/IEntity;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Z
    .locals 3
    .parameter "pEntityMatcher"

    .prologue
    .line 130
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 131
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    array-length v2, v0

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 137
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 132
    :cond_0
    aget-object v2, v0, v1

    invoke-interface {p1, v2}, Lorg/anddev/andengine/util/IEntityMatcher;->matches(Lorg/anddev/andengine/entity/IEntity;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 133
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->removeEntity(I)Lorg/anddev/andengine/entity/IEntity;

    .line 134
    const/4 v2, 0x1

    goto :goto_1

    .line 131
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public replaceEntity(ILorg/anddev/andengine/entity/IEntity;)Lorg/anddev/andengine/entity/IEntity;
    .locals 2
    .parameter "pIndex"
    .parameter "pEntity"

    .prologue
    .line 175
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->checkIndex(I)V

    .line 177
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 178
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    aget-object v1, v0, p1

    .line 179
    .local v1, oldEntity:Lorg/anddev/andengine/entity/IEntity;
    aput-object p2, v0, p1

    .line 180
    return-object v1
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 72
    invoke-super {p0}, Lorg/anddev/andengine/entity/layer/BaseLayer;->reset()V

    .line 74
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 75
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 78
    return-void

    .line 76
    :cond_0
    aget-object v2, v0, v1

    invoke-interface {v2}, Lorg/anddev/andengine/entity/IEntity;->reset()V

    .line 75
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public setEntity(ILorg/anddev/andengine/entity/IEntity;)V
    .locals 1
    .parameter "pIndex"
    .parameter "pEntity"

    .prologue
    .line 185
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->checkIndex(I)V

    .line 187
    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    if-ne p1, v0, :cond_1

    .line 188
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    iget v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    if-ge p1, v0, :cond_0

    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    aput-object p2, v0, p1

    goto :goto_0
.end method

.method public sortEntities()V
    .locals 4

    .prologue
    .line 165
    invoke-static {}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    const/4 v2, 0x0

    iget v3, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    invoke-virtual {v0, v1, v2, v3}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort([Lorg/anddev/andengine/entity/IEntity;II)V

    .line 166
    return-void
.end method

.method public sortEntities(Ljava/util/Comparator;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, pEntityComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-static {}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    const/4 v2, 0x0

    iget v3, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    invoke-virtual {v0, v1, v2, v3, p1}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 171
    return-void
.end method

.method public swapEntities(II)V
    .locals 4
    .parameter "pEntityIndexA"
    .parameter "pEntityIndexB"

    .prologue
    .line 196
    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    if-le p1, v2, :cond_0

    .line 197
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "pEntityIndexA was bigger than the EntityCount."

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 199
    :cond_0
    iget v2, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntityCount:I

    if-le p1, v2, :cond_1

    .line 200
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "pEntityIndexB was bigger than the EntityCount."

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 202
    :cond_1
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;->mEntities:[Lorg/anddev/andengine/entity/IEntity;

    .line 203
    .local v0, entities:[Lorg/anddev/andengine/entity/IEntity;
    aget-object v1, v0, p1

    .line 204
    .local v1, tmp:Lorg/anddev/andengine/entity/IEntity;
    aget-object v2, v0, p2

    aput-object v2, v0, p1

    .line 205
    aput-object v1, v0, p2

    .line 206
    return-void
.end method
