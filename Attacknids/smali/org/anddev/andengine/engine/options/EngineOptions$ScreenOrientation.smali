.class public final enum Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
.super Ljava/lang/Enum;
.source "EngineOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/engine/options/EngineOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScreenOrientation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

.field public static final enum LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

.field public static final enum PORTRAIT:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 125
    new-instance v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    const-string v1, "LANDSCAPE"

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;-><init>(Ljava/lang/String;I)V

    .line 129
    sput-object v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 130
    new-instance v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    const-string v1, "PORTRAIT"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->PORTRAIT:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 124
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    sget-object v1, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->PORTRAIT:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    aput-object v1, v0, v3

    sput-object v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->ENUM$VALUES:[Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->ENUM$VALUES:[Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
