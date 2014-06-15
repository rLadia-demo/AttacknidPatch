.class public Lorg/anddev/andengine/entity/layer/ZIndexSorter;
.super Lorg/anddev/andengine/util/sort/InsertionSorter;
.source "ZIndexSorter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/sort/InsertionSorter",
        "<",
        "Lorg/anddev/andengine/entity/IEntity;",
        ">;"
    }
.end annotation


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/entity/layer/ZIndexSorter;


# instance fields
.field private final mZIndexComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/anddev/andengine/util/sort/InsertionSorter;-><init>()V

    .line 20
    new-instance v0, Lorg/anddev/andengine/entity/layer/ZIndexSorter$1;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter$1;-><init>(Lorg/anddev/andengine/entity/layer/ZIndexSorter;)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->mZIndexComparator:Ljava/util/Comparator;

    .line 33
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->INSTANCE:Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    invoke-direct {v0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;-><init>()V

    sput-object v0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->INSTANCE:Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    .line 39
    :cond_0
    sget-object v0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->INSTANCE:Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    return-object v0
.end method


# virtual methods
.method public sort(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, pEntities:Ljava/util/List;,"Ljava/util/List<Lorg/anddev/andengine/entity/IEntity;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->mZIndexComparator:Ljava/util/Comparator;

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 64
    return-void
.end method

.method public sort(Ljava/util/List;II)V
    .locals 1
    .parameter
    .parameter "pStart"
    .parameter "pEnd"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/anddev/andengine/entity/IEntity;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, pEntities:Ljava/util/List;,"Ljava/util/List<Lorg/anddev/andengine/entity/IEntity;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->mZIndexComparator:Ljava/util/Comparator;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort(Ljava/util/List;IILjava/util/Comparator;)V

    .line 68
    return-void
.end method

.method public sort([Lorg/anddev/andengine/entity/IEntity;)V
    .locals 1
    .parameter "pEntities"

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->mZIndexComparator:Ljava/util/Comparator;

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 56
    return-void
.end method

.method public sort([Lorg/anddev/andengine/entity/IEntity;II)V
    .locals 1
    .parameter "pEntities"
    .parameter "pStart"
    .parameter "pEnd"

    .prologue
    .line 59
    iget-object v0, p0, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->mZIndexComparator:Ljava/util/Comparator;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 60
    return-void
.end method
