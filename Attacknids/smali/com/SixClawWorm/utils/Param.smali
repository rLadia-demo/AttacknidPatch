.class public Lcom/SixClawWorm/utils/Param;
.super Ljava/lang/Object;
.source "Param.java"


# static fields
.field public static ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

.field public static ConntectSucceed:Z

.field public static address:Ljava/lang/String;

.field public static connecting:Z

.field public static ifinTrodutionActivity:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 7
    sput-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 8
    const-string v0, ""

    sput-object v0, Lcom/SixClawWorm/utils/Param;->address:Ljava/lang/String;

    .line 9
    const/4 v0, 0x0

    sput-object v0, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 10
    sput-boolean v1, Lcom/SixClawWorm/utils/Param;->connecting:Z

    .line 11
    sput-boolean v1, Lcom/SixClawWorm/utils/Param;->ifinTrodutionActivity:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
