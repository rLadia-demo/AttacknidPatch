.class public interface abstract Lorg/anddev/andengine/entity/layer/ILayer;
.super Ljava/lang/Object;
.source "ILayer.java"

# interfaces
.implements Lorg/anddev/andengine/entity/IEntity;


# virtual methods
.method public abstract addEntity(Lorg/anddev/andengine/entity/IEntity;)V
.end method

.method public abstract clear()V
.end method

.method public abstract findEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Lorg/anddev/andengine/entity/IEntity;
.end method

.method public abstract getEntity(I)Lorg/anddev/andengine/entity/IEntity;
.end method

.method public abstract getEntityCount()I
.end method

.method public abstract getTouchAreas()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;",
            ">;"
        }
    .end annotation
.end method

.method public abstract registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
.end method

.method public abstract removeEntity(I)Lorg/anddev/andengine/entity/IEntity;
.end method

.method public abstract removeEntity(Lorg/anddev/andengine/entity/IEntity;)Z
.end method

.method public abstract removeEntity(Lorg/anddev/andengine/util/IEntityMatcher;)Z
.end method

.method public abstract replaceEntity(ILorg/anddev/andengine/entity/IEntity;)Lorg/anddev/andengine/entity/IEntity;
.end method

.method public abstract setEntity(ILorg/anddev/andengine/entity/IEntity;)V
.end method

.method public abstract sortEntities()V
.end method

.method public abstract sortEntities(Ljava/util/Comparator;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract swapEntities(II)V
.end method

.method public abstract unregisterTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
.end method
