.class public final enum Lorg/anddev/andengine/util/VerticalAlign;
.super Ljava/lang/Enum;
.source "VerticalAlign.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/util/VerticalAlign;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BOTTOM:Lorg/anddev/andengine/util/VerticalAlign;

.field public static final enum CENTER:Lorg/anddev/andengine/util/VerticalAlign;

.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/util/VerticalAlign;

.field public static final enum TOP:Lorg/anddev/andengine/util/VerticalAlign;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lorg/anddev/andengine/util/VerticalAlign;

    const-string v1, "TOP"

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/util/VerticalAlign;-><init>(Ljava/lang/String;I)V

    .line 12
    sput-object v0, Lorg/anddev/andengine/util/VerticalAlign;->TOP:Lorg/anddev/andengine/util/VerticalAlign;

    .line 13
    new-instance v0, Lorg/anddev/andengine/util/VerticalAlign;

    const-string v1, "CENTER"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/util/VerticalAlign;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/VerticalAlign;->CENTER:Lorg/anddev/andengine/util/VerticalAlign;

    .line 14
    new-instance v0, Lorg/anddev/andengine/util/VerticalAlign;

    const-string v1, "BOTTOM"

    invoke-direct {v0, v1, v4}, Lorg/anddev/andengine/util/VerticalAlign;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/VerticalAlign;->BOTTOM:Lorg/anddev/andengine/util/VerticalAlign;

    .line 7
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/anddev/andengine/util/VerticalAlign;

    sget-object v1, Lorg/anddev/andengine/util/VerticalAlign;->TOP:Lorg/anddev/andengine/util/VerticalAlign;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/util/VerticalAlign;->CENTER:Lorg/anddev/andengine/util/VerticalAlign;

    aput-object v1, v0, v3

    sget-object v1, Lorg/anddev/andengine/util/VerticalAlign;->BOTTOM:Lorg/anddev/andengine/util/VerticalAlign;

    aput-object v1, v0, v4

    sput-object v0, Lorg/anddev/andengine/util/VerticalAlign;->ENUM$VALUES:[Lorg/anddev/andengine/util/VerticalAlign;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/util/VerticalAlign;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/util/VerticalAlign;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/util/VerticalAlign;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/util/VerticalAlign;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/util/VerticalAlign;->ENUM$VALUES:[Lorg/anddev/andengine/util/VerticalAlign;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/util/VerticalAlign;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
