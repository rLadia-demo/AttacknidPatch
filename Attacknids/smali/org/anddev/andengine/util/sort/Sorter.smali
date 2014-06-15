.class public abstract Lorg/anddev/andengine/util/sort/Sorter;
.super Ljava/lang/Object;
.source "Sorter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    .local p0, this:Lorg/anddev/andengine/util/sort/Sorter;,"Lorg/anddev/andengine/util/sort/Sorter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract sort(Ljava/util/List;IILjava/util/Comparator;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;II",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation
.end method

.method public final sort(Ljava/util/List;Ljava/util/Comparator;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, this:Lorg/anddev/andengine/util/sort/Sorter;,"Lorg/anddev/andengine/util/sort/Sorter<TT;>;"
    .local p1, pList:Ljava/util/List;,"Ljava/util/List<TT;>;"
    .local p2, pComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<TT;>;"
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/anddev/andengine/util/sort/Sorter;->sort(Ljava/util/List;IILjava/util/Comparator;)V

    .line 46
    return-void
.end method

.method public abstract sort([Ljava/lang/Object;IILjava/util/Comparator;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;II",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation
.end method

.method public final sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 2
    .parameter "pArray"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, this:Lorg/anddev/andengine/util/sort/Sorter;,"Lorg/anddev/andengine/util/sort/Sorter<TT;>;"
    .local p2, pComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<TT;>;"
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/anddev/andengine/util/sort/Sorter;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 42
    return-void
.end method
