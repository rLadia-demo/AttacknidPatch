.class public final enum Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;
.super Ljava/lang/Enum;
.source "LinearGradientFillTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LinearGradientDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BOTTOMLEFT_TO_TOPRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum BOTTOMRIGHT_TO_TOPLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum BOTTOM_TO_TOP:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum LEFT_TO_RIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum RIGHT_TO_LEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum TOPLEFT_TO_BOTTOMRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum TOPRIGHT_TO_BOTTOMLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field public static final enum TOP_TO_BOTTOM:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;


# instance fields
.field private final mFromX:I

.field private final mFromY:I

.field private final mToX:I

.field private final mToY:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .prologue
    const/4 v15, 0x4

    const/4 v14, 0x3

    const/4 v13, 0x2

    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 83
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v1, "LEFT_TO_RIGHT"

    move v3, v2

    move v4, v2

    move v6, v2

    .line 86
    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->LEFT_TO_RIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 87
    new-instance v3, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v4, "RIGHT_TO_LEFT"

    move v6, v5

    move v7, v2

    move v8, v2

    move v9, v2

    invoke-direct/range {v3 .. v9}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v3, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->RIGHT_TO_LEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 88
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "BOTTOM_TO_TOP"

    move v8, v13

    move v9, v2

    move v10, v2

    move v11, v2

    move v12, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOM_TO_TOP:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 89
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "TOP_TO_BOTTOM"

    move v8, v14

    move v9, v2

    move v10, v5

    move v11, v2

    move v12, v2

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOP_TO_BOTTOM:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 90
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "TOPLEFT_TO_BOTTOMRIGHT"

    move v8, v15

    move v9, v2

    move v10, v2

    move v11, v5

    move v12, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOPLEFT_TO_BOTTOMRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 91
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "BOTTOMRIGHT_TO_TOPLEFT"

    const/4 v8, 0x5

    move v9, v5

    move v10, v5

    move v11, v2

    move v12, v2

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOMRIGHT_TO_TOPLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 92
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "TOPRIGHT_TO_BOTTOMLEFT"

    const/4 v8, 0x6

    move v9, v5

    move v10, v2

    move v11, v2

    move v12, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOPRIGHT_TO_BOTTOMLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 93
    new-instance v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    const-string v7, "BOTTOMLEFT_TO_TOPRIGHT"

    const/4 v8, 0x7

    move v9, v2

    move v10, v5

    move v11, v5

    move v12, v2

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;-><init>(Ljava/lang/String;IIIII)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOMLEFT_TO_TOPRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 82
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->LEFT_TO_RIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->RIGHT_TO_LEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v1, v0, v5

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOM_TO_TOP:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v1, v0, v13

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOP_TO_BOTTOM:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v1, v0, v14

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOPLEFT_TO_BOTTOMRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v1, v0, v15

    const/4 v1, 0x5

    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOMRIGHT_TO_TOPLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->TOPRIGHT_TO_BOTTOMLEFT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->BOTTOMLEFT_TO_TOPRIGHT:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    aput-object v2, v0, v1

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIII)V
    .locals 0
    .parameter
    .parameter
    .parameter "pFromX"
    .parameter "pFromY"
    .parameter "pToX"
    .parameter "pToY"

    .prologue
    .line 112
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 113
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mFromX:I

    .line 114
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mFromY:I

    .line 115
    iput p5, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mToX:I

    .line 116
    iput p6, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mToY:I

    .line 117
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method final getFromX()I
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mFromX:I

    return v0
.end method

.method final getFromY()I
    .locals 1

    .prologue
    .line 128
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mFromY:I

    return v0
.end method

.method final getToX()I
    .locals 1

    .prologue
    .line 132
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mToX:I

    return v0
.end method

.method final getToY()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->mToY:I

    return v0
.end method
