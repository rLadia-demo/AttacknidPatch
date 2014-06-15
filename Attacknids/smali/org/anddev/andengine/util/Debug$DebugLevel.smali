.class public final enum Lorg/anddev/andengine/util/Debug$DebugLevel;
.super Ljava/lang/Enum;
.source "Debug.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/util/Debug;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DebugLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/util/Debug$DebugLevel;",
        ">;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/anddev/andengine/util/Debug$DebugLevel;",
        ">;"
    }
.end annotation


# static fields
.field public static ALL:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum DEBUG:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum ERROR:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum INFO:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum NONE:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

.field public static final enum WARNING:Lorg/anddev/andengine/util/Debug$DebugLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 120
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->NONE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 121
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v4}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->ERROR:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 122
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "WARNING"

    invoke-direct {v0, v1, v5}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->WARNING:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 123
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "INFO"

    invoke-direct {v0, v1, v6}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->INFO:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 124
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "DEBUG"

    invoke-direct {v0, v1, v7}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->DEBUG:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 125
    new-instance v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    const-string v1, "VERBOSE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/util/Debug$DebugLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    const/4 v0, 0x6

    new-array v0, v0, [Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->NONE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v1, v0, v3

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->ERROR:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v1, v0, v4

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->WARNING:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v1, v0, v5

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->INFO:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v1, v0, v6

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->DEBUG:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/anddev/andengine/util/Debug$DebugLevel;->VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    aput-object v2, v0, v1

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->ENUM$VALUES:[Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 127
    sget-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sput-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->ALL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 119
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    return v0
.end method

.method private isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    .locals 1
    .parameter "pDebugLevel"

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/util/Debug$DebugLevel;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/util/Debug$DebugLevel;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/util/Debug$DebugLevel;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->ENUM$VALUES:[Lorg/anddev/andengine/util/Debug$DebugLevel;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/util/Debug$DebugLevel;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
