.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;
.super Ljava/util/ArrayList;
.source "TMXProperties.java"

# interfaces
.implements Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperty;",
        ">",
        "Ljava/util/ArrayList",
        "<TT;>;",
        "Lorg/anddev/andengine/entity/layer/tiled/tmx/util/constants/TMXConstants;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7bb0885402fef4b1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    .local p0, this:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<TT;>;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method public containsTMXProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .parameter "pName"
    .parameter "pValue"

    .prologue
    .line 31
    .local p0, this:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;,"Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties<TT;>;"
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 37
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 32
    :cond_0
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperties;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperty;

    .line 33
    .local v1, tmxProperty:Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperty;,"TT;"
    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperty;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/TMXProperty;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 34
    const/4 v2, 0x1

    goto :goto_1

    .line 31
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
