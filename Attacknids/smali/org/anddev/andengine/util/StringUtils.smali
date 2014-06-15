.class public Lorg/anddev/andengine/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static countOccurrences(Ljava/lang/String;C)I
    .locals 3
    .parameter "pString"
    .parameter "pCharacter"

    .prologue
    .line 49
    const/4 v0, 0x0

    .line 51
    .local v0, count:I
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 53
    .local v1, lastOccurrence:I
    :goto_0
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 58
    return v0

    .line 54
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 55
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    goto :goto_0
.end method

.method public static padFront(Ljava/lang/String;CI)Ljava/lang/String;
    .locals 4
    .parameter "pString"
    .parameter "pPadChar"
    .parameter "pLength"

    .prologue
    .line 33
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v1, p2, v3

    .line 34
    .local v1, padCount:I
    if-gtz v1, :cond_0

    .line 44
    .end local p0
    :goto_0
    return-object p0

    .line 37
    .restart local p0
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .local v2, sb:Ljava/lang/StringBuilder;
    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_1

    .line 42
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static split(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1
    .parameter "pString"
    .parameter "pCharacter"

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/anddev/andengine/util/StringUtils;->split(Ljava/lang/String;C[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;C[Ljava/lang/String;)[Ljava/lang/String;
    .locals 8
    .parameter "pString"
    .parameter "pCharacter"
    .parameter "pReuse"

    .prologue
    const/4 v6, 0x0

    .line 83
    invoke-static {p0, p1}, Lorg/anddev/andengine/util/StringUtils;->countOccurrences(Ljava/lang/String;C)I

    move-result v7

    add-int/lit8 v3, v7, 0x1

    .line 85
    .local v3, partCount:I
    if-eqz p2, :cond_0

    array-length v7, p2

    if-ne v7, v3, :cond_0

    const/4 v4, 0x1

    .line 86
    .local v4, reuseable:Z
    :goto_0
    if-eqz v4, :cond_1

    move-object v2, p2

    .line 88
    .local v2, out:[Ljava/lang/String;
    :goto_1
    if-nez v3, :cond_2

    .line 89
    aput-object p0, v2, v6

    .line 103
    :goto_2
    return-object v2

    .end local v2           #out:[Ljava/lang/String;
    .end local v4           #reuseable:Z
    :cond_0
    move v4, v6

    .line 85
    goto :goto_0

    .line 86
    .restart local v4       #reuseable:Z
    :cond_1
    new-array v2, v3, [Ljava/lang/String;

    goto :goto_1

    .line 91
    .restart local v2       #out:[Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .line 94
    .local v0, from:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_3
    add-int/lit8 v6, v3, -0x1

    if-lt v1, v6, :cond_3

    .line 100
    add-int/lit8 v6, v3, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {p0, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    goto :goto_2

    .line 95
    :cond_3
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 96
    .local v5, to:I
    invoke-virtual {p0, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    .line 97
    add-int/lit8 v0, v5, 0x1

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method
