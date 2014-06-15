.class public final enum Lorg/anddev/andengine/sensor/SensorDelay;
.super Ljava/lang/Enum;
.source "SensorDelay.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/sensor/SensorDelay;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/sensor/SensorDelay;

.field public static final enum FASTEST:Lorg/anddev/andengine/sensor/SensorDelay;

.field public static final enum GAME:Lorg/anddev/andengine/sensor/SensorDelay;

.field public static final enum NORMAL:Lorg/anddev/andengine/sensor/SensorDelay;

.field public static final enum UI:Lorg/anddev/andengine/sensor/SensorDelay;


# instance fields
.field private final mDelay:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lorg/anddev/andengine/sensor/SensorDelay;

    const-string v1, "NORMAL"

    .line 15
    invoke-direct {v0, v1, v2, v5}, Lorg/anddev/andengine/sensor/SensorDelay;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->NORMAL:Lorg/anddev/andengine/sensor/SensorDelay;

    .line 16
    new-instance v0, Lorg/anddev/andengine/sensor/SensorDelay;

    const-string v1, "UI"

    invoke-direct {v0, v1, v3, v4}, Lorg/anddev/andengine/sensor/SensorDelay;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->UI:Lorg/anddev/andengine/sensor/SensorDelay;

    .line 17
    new-instance v0, Lorg/anddev/andengine/sensor/SensorDelay;

    const-string v1, "GAME"

    invoke-direct {v0, v1, v4, v3}, Lorg/anddev/andengine/sensor/SensorDelay;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->GAME:Lorg/anddev/andengine/sensor/SensorDelay;

    .line 18
    new-instance v0, Lorg/anddev/andengine/sensor/SensorDelay;

    const-string v1, "FASTEST"

    invoke-direct {v0, v1, v5, v2}, Lorg/anddev/andengine/sensor/SensorDelay;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->FASTEST:Lorg/anddev/andengine/sensor/SensorDelay;

    .line 10
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/anddev/andengine/sensor/SensorDelay;

    sget-object v1, Lorg/anddev/andengine/sensor/SensorDelay;->NORMAL:Lorg/anddev/andengine/sensor/SensorDelay;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/sensor/SensorDelay;->UI:Lorg/anddev/andengine/sensor/SensorDelay;

    aput-object v1, v0, v3

    sget-object v1, Lorg/anddev/andengine/sensor/SensorDelay;->GAME:Lorg/anddev/andengine/sensor/SensorDelay;

    aput-object v1, v0, v4

    sget-object v1, Lorg/anddev/andengine/sensor/SensorDelay;->FASTEST:Lorg/anddev/andengine/sensor/SensorDelay;

    aput-object v1, v0, v5

    sput-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->ENUM$VALUES:[Lorg/anddev/andengine/sensor/SensorDelay;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "pDelay"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 35
    iput p3, p0, Lorg/anddev/andengine/sensor/SensorDelay;->mDelay:I

    .line 36
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/sensor/SensorDelay;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/sensor/SensorDelay;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/sensor/SensorDelay;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/sensor/SensorDelay;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/sensor/SensorDelay;->ENUM$VALUES:[Lorg/anddev/andengine/sensor/SensorDelay;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/sensor/SensorDelay;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getDelay()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lorg/anddev/andengine/sensor/SensorDelay;->mDelay:I

    return v0
.end method
