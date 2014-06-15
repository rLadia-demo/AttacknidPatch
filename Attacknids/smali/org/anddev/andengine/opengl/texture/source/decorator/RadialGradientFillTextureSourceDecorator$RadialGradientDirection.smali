.class public final enum Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
.super Ljava/lang/Enum;
.source "RadialGradientFillTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RadialGradientDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

.field public static final enum INSIDE_OUT:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

.field public static final enum OUTSIDE_IN:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 90
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    const-string v1, "INSIDE_OUT"

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;-><init>(Ljava/lang/String;I)V

    .line 94
    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->INSIDE_OUT:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    .line 95
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    const-string v1, "OUTSIDE_IN"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->OUTSIDE_IN:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    .line 89
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->INSIDE_OUT:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->OUTSIDE_IN:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    aput-object v1, v0, v3

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
