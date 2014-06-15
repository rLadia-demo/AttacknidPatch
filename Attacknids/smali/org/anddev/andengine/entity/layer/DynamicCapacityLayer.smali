.class public Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;
.super Lorg/anddev/andengine/entity/layer/BaseLayer;
.source "DynamicCapacityLayer.java"


# static fields
.field private static final CAPACITY_DEFAULT:I = 0xa


# instance fields
.field private final mEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;-><init>(I)V

    .line 36
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pExpectedCapacity"

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/anddev/andengine/entity/layer/BaseLayer;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 40
    return-void
.end method


# virtual methods
.method public addEntity(Lorg/anddev/andengine/entity/IEntity;)V
    .locals 1
    .parameter "pEntity"

    .prologue
    .line 95
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 91
    return-void
.end method

.method public findEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Lorg/anddev/andengine/entity/IEntity;
    .locals 4
    .parameter "pEntityMatcher"

    .prologue
    .line 122
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 123
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_1

    .line 129
    const/4 v1, 0x0

    :cond_0
    return-object v1

    .line 124
    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/IEntity;

    .line 125
    .local v1, entity:Lorg/anddev/andengine/entity/IEntity;
    invoke-interface {p1, v1}, Lorg/anddev/andengine/util/IEntityMatcher;->matches(Lorg/anddev/andengine/entity/IEntity;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 123
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method public getEntity(I)Lorg/anddev/andengine/entity/IEntity;
    .locals 1
    .parameter "pIndex"

    .prologue
    .line 52
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/entity/IEntity;

    return-object v0
.end method

.method public getEntityCount()I
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 62
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 63
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 64
    .local v1, entityCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 67
    return-void

    .line 65
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {v3, p1, p2}, Lorg/anddev/andengine/entity/IEntity;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 64
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected onManagedUpdate(F)V
    .locals 4
    .parameter "pSecondsElapsed"

    .prologue
    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 72
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 73
    .local v1, entityCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 76
    return-void

    .line 74
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {v3, p1}, Lorg/anddev/andengine/entity/IEntity;->onUpdate(F)V

    .line 73
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public removeEntity(I)Lorg/anddev/andengine/entity/IEntity;
    .locals 1
    .parameter "pIndex"

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/entity/IEntity;

    return-object v0
.end method

.method public removeEntity(Lorg/anddev/andengine/entity/IEntity;)Z
    .locals 1
    .parameter "pEntity"

    .prologue
    .line 100
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Z
    .locals 3
    .parameter "pEntityMatcher"

    .prologue
    .line 110
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 111
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 117
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 112
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {p1, v2}, Lorg/anddev/andengine/util/IEntityMatcher;->matches(Lorg/anddev/andengine/entity/IEntity;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 113
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 114
    const/4 v2, 0x1

    goto :goto_1

    .line 111
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public replaceEntity(ILorg/anddev/andengine/entity/IEntity;)Lorg/anddev/andengine/entity/IEntity;
    .locals 2
    .parameter "pEntityIndex"
    .parameter "pEntity"

    .prologue
    .line 144
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 145
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/IEntity;

    .line 146
    .local v1, oldEntity:Lorg/anddev/andengine/entity/IEntity;
    return-object v1
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 80
    invoke-super {p0}, Lorg/anddev/andengine/entity/layer/BaseLayer;->reset()V

    .line 82
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 83
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 86
    return-void

    .line 84
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/entity/IEntity;

    invoke-interface {v2}, Lorg/anddev/andengine/entity/IEntity;->reset()V

    .line 83
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public setEntity(ILorg/anddev/andengine/entity/IEntity;)V
    .locals 1
    .parameter "pEntityIndex"
    .parameter "pEntity"

    .prologue
    .line 151
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 152
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 156
    :goto_0
    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public sortEntities()V
    .locals 2

    .prologue
    .line 134
    invoke-static {}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort(Ljava/util/List;)V

    .line 135
    return-void
.end method

.method public sortEntities(Ljava/util/Comparator;)V
    .locals 2
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
    .line 139
    .local p1, pEntityComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-static {}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 140
    return-void
.end method

.method public swapEntities(II)V
    .locals 3
    .parameter "pEntityIndexA"
    .parameter "pEntityIndexB"

    .prologue
    .line 160
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;->mEntities:Ljava/util/ArrayList;

    .line 161
    .local v0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/IEntity;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/IEntity;

    .line 162
    .local v1, entityA:Lorg/anddev/andengine/entity/IEntity;
    invoke-virtual {v0, p2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/entity/IEntity;

    .line 163
    .local v2, entityB:Lorg/anddev/andengine/entity/IEntity;
    invoke-virtual {v0, p1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 164
    return-void
.end method
