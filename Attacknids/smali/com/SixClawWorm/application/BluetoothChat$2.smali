.class Lcom/SixClawWorm/application/BluetoothChat$2;
.super Landroid/os/Handler;
.source "BluetoothChat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/BluetoothChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/BluetoothChat;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/BluetoothChat;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    .line 270
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v5, 0x0

    .line 273
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 329
    :goto_0
    :pswitch_0
    return-void

    .line 275
    :pswitch_1
    const-string v2, "BluetoothChat"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "MESSAGE_STATE_CHANGE: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    iget v2, p1, Landroid/os/Message;->arg1:I

    packed-switch v2, :pswitch_data_1

    goto :goto_0

    .line 300
    :pswitch_2
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    const-string v3, "The connection fails"

    invoke-static {v2, v3}, Lcom/SixClawWorm/utils/ToastHint;->show(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :pswitch_3
    invoke-static {}, Lcom/SixClawWorm/utils/ProgressDialogHint;->Dismiss()V

    .line 283
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    const-string v3, "The connection is successful"

    invoke-static {v2, v3}, Lcom/SixClawWorm/utils/ToastHint;->show(Landroid/content/Context;Ljava/lang/String;)V

    .line 284
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    goto :goto_0

    .line 307
    :pswitch_4
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, [B

    .line 311
    .local v1, writeBuf:[B
    goto :goto_0

    .line 313
    .end local v1           #writeBuf:[B
    :pswitch_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    .line 317
    .local v0, readBuf:[B
    goto :goto_0

    .line 320
    .end local v0           #readBuf:[B
    :pswitch_6
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "device_name"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Lcom/SixClawWorm/application/BluetoothChat;->mConnectedDeviceName:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/SixClawWorm/application/BluetoothChat;->access$0(Lcom/SixClawWorm/application/BluetoothChat;Ljava/lang/String;)V

    .line 321
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChat;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Connected to "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    #getter for: Lcom/SixClawWorm/application/BluetoothChat;->mConnectedDeviceName:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/BluetoothChat;->access$1(Lcom/SixClawWorm/application/BluetoothChat;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 321
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 322
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 325
    :pswitch_7
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChat$2;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChat;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "toast"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 326
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 273
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_7
    .end packed-switch

    .line 276
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
