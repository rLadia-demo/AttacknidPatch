.class final enum Lcom/SixClawWorm/utils/DragImageView$MODE;
.super Ljava/lang/Enum;
.source "DragImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/utils/DragImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "MODE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/SixClawWorm/utils/DragImageView$MODE;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DRAG:Lcom/SixClawWorm/utils/DragImageView$MODE;

.field private static final synthetic ENUM$VALUES:[Lcom/SixClawWorm/utils/DragImageView$MODE;

.field public static final enum NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

.field public static final enum ZOOM:Lcom/SixClawWorm/utils/DragImageView$MODE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 58
    new-instance v0, Lcom/SixClawWorm/utils/DragImageView$MODE;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/SixClawWorm/utils/DragImageView$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    new-instance v0, Lcom/SixClawWorm/utils/DragImageView$MODE;

    const-string v1, "DRAG"

    invoke-direct {v0, v1, v3}, Lcom/SixClawWorm/utils/DragImageView$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->DRAG:Lcom/SixClawWorm/utils/DragImageView$MODE;

    new-instance v0, Lcom/SixClawWorm/utils/DragImageView$MODE;

    const-string v1, "ZOOM"

    invoke-direct {v0, v1, v4}, Lcom/SixClawWorm/utils/DragImageView$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->ZOOM:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/SixClawWorm/utils/DragImageView$MODE;

    sget-object v1, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/SixClawWorm/utils/DragImageView$MODE;->DRAG:Lcom/SixClawWorm/utils/DragImageView$MODE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/SixClawWorm/utils/DragImageView$MODE;->ZOOM:Lcom/SixClawWorm/utils/DragImageView$MODE;

    aput-object v1, v0, v4

    sput-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->ENUM$VALUES:[Lcom/SixClawWorm/utils/DragImageView$MODE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/SixClawWorm/utils/DragImageView$MODE;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/SixClawWorm/utils/DragImageView$MODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/SixClawWorm/utils/DragImageView$MODE;

    return-object v0
.end method

.method public static values()[Lcom/SixClawWorm/utils/DragImageView$MODE;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->ENUM$VALUES:[Lcom/SixClawWorm/utils/DragImageView$MODE;

    array-length v1, v0

    new-array v2, v1, [Lcom/SixClawWorm/utils/DragImageView$MODE;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
