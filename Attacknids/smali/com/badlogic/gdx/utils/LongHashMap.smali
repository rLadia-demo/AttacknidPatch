.class public Lcom/badlogic/gdx/utils/LongHashMap;
.super Ljava/lang/Object;
.source "LongHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/LongHashMap$Entry;,
        Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private capacity:I

.field iterable:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongHashMap",
            "<TT;>.EntryIterable;"
        }
    .end annotation
.end field

.field private loadFactor:F

.field private mask:I

.field private size:I

.field private table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

.field private threshold:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 21
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    const/16 v0, 0x10

    const/high16 v1, 0x3f40

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/LongHashMap;-><init>(IF)V

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "initialCapacity"

    .prologue
    .line 25
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    const/high16 v0, 0x3f40

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/LongHashMap;-><init>(IF)V

    .line 26
    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2
    .parameter "initialCapacity"
    .parameter "loadFactor"

    .prologue
    .line 28
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;-><init>(Lcom/badlogic/gdx/utils/LongHashMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->iterable:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    .line 29
    const/high16 v0, 0x4000

    if-le p1, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "initialCapacity is too large."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_0
    if-gez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "initialCapacity must be greater than zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_1
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "initialCapacity must be greater than zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_2
    const/4 v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    .line 33
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    if-lt v0, p1, :cond_3

    .line 36
    iput p2, p0, Lcom/badlogic/gdx/utils/LongHashMap;->loadFactor:F

    .line 37
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->threshold:I

    .line 38
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    new-array v0, v0, [Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 39
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    .line 40
    return-void

    .line 34
    :cond_3
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/badlogic/gdx/utils/LongHashMap;)[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    .locals 1
    .parameter

    .prologue
    .line 16
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 3

    .prologue
    .line 127
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 128
    .local v1, table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    array-length v0, v1

    .local v0, index:I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-gez v0, :cond_0

    .line 130
    const/4 v2, 0x0

    iput v2, p0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    .line 131
    return-void

    .line 129
    :cond_0
    const/4 v2, 0x0

    aput-object v2, v1, v0

    goto :goto_0
.end method

.method public containsKey(J)Z
    .locals 4
    .parameter "key"

    .prologue
    .line 51
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    long-to-int v2, p1

    iget v3, p0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    and-int v1, v2, v3

    .line 52
    .local v1, index:I
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aget-object v0, v2, v1

    .local v0, e:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :goto_0
    if-nez v0, :cond_0

    .line 54
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 53
    :cond_0
    iget-wide v2, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    .line 52
    :cond_1
    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 5
    .parameter "value"

    .prologue
    .line 43
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 44
    .local v3, table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    array-length v1, v3

    .local v1, i:I
    move v2, v1

    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    add-int/lit8 v1, v2, -0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    if-gtz v2, :cond_0

    .line 47
    const/4 v4, 0x0

    :goto_1
    return v4

    .line 45
    :cond_0
    aget-object v0, v3, v1

    .local v0, e:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :goto_2
    if-nez v0, :cond_1

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 46
    .end local v2           #i:I
    .restart local v1       #i:I
    :cond_1
    iget-object v4, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_1

    .line 45
    :cond_2
    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_2
.end method

.method public get(J)Ljava/lang/Object;
    .locals 4
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget v2, p0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    int-to-long v2, v2

    and-long/2addr v2, p1

    long-to-int v1, v2

    .line 59
    .local v1, index:I
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aget-object v0, v2, v1

    .local v0, e:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :goto_0
    if-nez v0, :cond_0

    .line 61
    const/4 v2, 0x0

    :goto_1
    return-object v2

    .line 60
    :cond_0
    iget-wide v2, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_1

    .line 59
    :cond_1
    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_0
.end method

.method public put(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .parameter "key"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)TT;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    .local p3, value:Ljava/lang/Object;,"TT;"
    move-object/from16 v0, p0

    iget v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    int-to-long v12, v12

    and-long v12, v12, p1

    long-to-int v5, v12

    .line 67
    .local v5, index:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aget-object v4, v12, v5

    .local v4, e:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :goto_0
    if-nez v4, :cond_1

    .line 73
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    new-instance v13, Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aget-object v14, v14, v5

    move-wide/from16 v0, p1

    move-object/from16 v2, p3

    invoke-direct {v13, v0, v1, v2, v14}, Lcom/badlogic/gdx/utils/LongHashMap$Entry;-><init>(JLjava/lang/Object;Lcom/badlogic/gdx/utils/LongHashMap$Entry;)V

    aput-object v13, v12, v5

    .line 74
    move-object/from16 v0, p0

    iget v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    add-int/lit8 v13, v12, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/badlogic/gdx/utils/LongHashMap;->threshold:I

    if-lt v12, v13, :cond_0

    .line 76
    move-object/from16 v0, p0

    iget v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    mul-int/lit8 v7, v12, 0x2

    .line 77
    .local v7, newCapacity:I
    new-array v8, v7, [Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 78
    .local v8, newTable:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 79
    .local v11, src:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    add-int/lit8 v3, v7, -0x1

    .line 80
    .local v3, bucketmask:I
    const/4 v6, 0x0

    .local v6, j:I
    :goto_1
    array-length v12, v11

    if-lt v6, v12, :cond_3

    .line 93
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 94
    move-object/from16 v0, p0

    iput v7, v0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    .line 95
    int-to-float v12, v7

    move-object/from16 v0, p0

    iget v13, v0, Lcom/badlogic/gdx/utils/LongHashMap;->loadFactor:F

    mul-float/2addr v12, v13

    float-to-int v12, v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->threshold:I

    .line 96
    move-object/from16 v0, p0

    iget v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->capacity:I

    add-int/lit8 v12, v12, -0x1

    move-object/from16 v0, p0

    iput v12, v0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    .line 98
    .end local v3           #bucketmask:I
    .end local v6           #j:I
    .end local v7           #newCapacity:I
    .end local v8           #newTable:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    .end local v11           #src:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    :cond_0
    const/4 v10, 0x0

    :goto_2
    return-object v10

    .line 68
    :cond_1
    iget-wide v12, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    cmp-long v12, v12, p1

    if-eqz v12, :cond_2

    .line 67
    iget-object v4, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_0

    .line 69
    :cond_2
    iget-object v10, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 70
    .local v10, oldValue:Ljava/lang/Object;
    move-object/from16 v0, p3

    iput-object v0, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_2

    .line 81
    .end local v10           #oldValue:Ljava/lang/Object;
    .restart local v3       #bucketmask:I
    .restart local v6       #j:I
    .restart local v7       #newCapacity:I
    .restart local v8       #newTable:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    .restart local v11       #src:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    :cond_3
    aget-object v4, v11, v6

    .line 82
    if-eqz v4, :cond_5

    .line 83
    const/4 v12, 0x0

    aput-object v12, v11, v6

    .line 85
    :cond_4
    iget-object v9, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 86
    .local v9, next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    iget-wide v12, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    int-to-long v14, v3

    and-long/2addr v12, v14

    long-to-int v5, v12

    .line 87
    aget-object v12, v8, v5

    iput-object v12, v4, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 88
    aput-object v4, v8, v5

    .line 89
    move-object v4, v9

    .line 90
    if-nez v4, :cond_4

    .line 80
    .end local v9           #next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method

.method public remove(J)Ljava/lang/Object;
    .locals 6
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget v4, p0, Lcom/badlogic/gdx/utils/LongHashMap;->mask:I

    int-to-long v4, v4

    and-long/2addr v4, p1

    long-to-int v1, v4

    .line 103
    .local v1, index:I
    iget-object v4, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aget-object v3, v4, v1

    .line 104
    .local v3, prev:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    move-object v0, v3

    .line 105
    .local v0, e:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    :goto_0
    if-nez v0, :cond_0

    .line 119
    const/4 v4, 0x0

    :goto_1
    return-object v4

    .line 106
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 107
    .local v2, next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    iget-wide v4, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    cmp-long v4, v4, p1

    if-nez v4, :cond_2

    .line 108
    iget v4, p0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    .line 109
    if-ne v3, v0, :cond_1

    .line 110
    iget-object v4, p0, Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    aput-object v2, v4, v1

    .line 114
    :goto_2
    iget-object v4, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    goto :goto_1

    .line 112
    :cond_1
    iput-object v2, v3, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_2

    .line 116
    :cond_2
    move-object v3, v0

    .line 117
    move-object v0, v2

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 123
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->size:I

    return v0
.end method

.method public values()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, this:Lcom/badlogic/gdx/utils/LongHashMap;,"Lcom/badlogic/gdx/utils/LongHashMap<TT;>;"
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->iterable:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->reset()V

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap;->iterable:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    return-object v0
.end method
