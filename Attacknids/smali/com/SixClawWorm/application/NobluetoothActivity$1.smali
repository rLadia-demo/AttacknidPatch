.class Lcom/SixClawWorm/application/NobluetoothActivity$1;
.super Ljava/lang/Object;
.source "NobluetoothActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/NobluetoothActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/NobluetoothActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$1;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 129
    sget-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-nez v1, :cond_0

    sget-object v1, Lcom/SixClawWorm/utils/Param;->address:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/SixClawWorm/utils/Param;->connecting:Z

    if-nez v1, :cond_0

    .line 130
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 131
    .local v0, intent:Landroid/content/Intent;
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    sget-object v2, Lcom/SixClawWorm/utils/Param;->address:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$1;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->setResult(ILandroid/content/Intent;)V

    .line 133
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/SixClawWorm/application/NobluetoothActivity;->connectDevice(Z)V

    .line 137
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$1;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    iget-object v1, v1, Lcom/SixClawWorm/application/NobluetoothActivity;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 138
    return-void
.end method
