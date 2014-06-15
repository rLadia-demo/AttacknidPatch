.class public final enum Lorg/anddev/andengine/sensor/location/LocationProviderStatus;
.super Ljava/lang/Enum;
.source "LocationProviderStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/sensor/location/LocationProviderStatus;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

.field public static final enum OUT_OF_SERVICE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

.field public static final enum TEMPORARILY_UNAVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    const-string v1, "AVAILABLE"

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;-><init>(Ljava/lang/String;I)V

    .line 12
    sput-object v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->AVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    .line 13
    new-instance v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    const-string v1, "OUT_OF_SERVICE"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->OUT_OF_SERVICE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    .line 14
    new-instance v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    const-string v1, "TEMPORARILY_UNAVAILABLE"

    invoke-direct {v0, v1, v4}, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->TEMPORARILY_UNAVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    .line 7
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->AVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->OUT_OF_SERVICE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    aput-object v1, v0, v3

    sget-object v1, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->TEMPORARILY_UNAVAILABLE:Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    aput-object v1, v0, v4

    sput-object v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->ENUM$VALUES:[Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

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

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/sensor/location/LocationProviderStatus;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/sensor/location/LocationProviderStatus;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/sensor/location/LocationProviderStatus;->ENUM$VALUES:[Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/sensor/location/LocationProviderStatus;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
