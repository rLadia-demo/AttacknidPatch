.class public final enum Lcom/badlogic/gdx/physics/box2d/Shape$Type;
.super Ljava/lang/Enum;
.source "Shape.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/Shape;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/badlogic/gdx/physics/box2d/Shape$Type;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field private static final synthetic ENUM$VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

.field public static final enum Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 37
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const-string v1, "Circle"

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    const-string v1, "Polygon"

    invoke-direct {v0, v1, v3}, Lcom/badlogic/gdx/physics/box2d/Shape$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    .line 35
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    aput-object v1, v0, v3

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->ENUM$VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method

.method public static values()[Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->ENUM$VALUES:[Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    array-length v1, v0

    new-array v2, v1, [Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
