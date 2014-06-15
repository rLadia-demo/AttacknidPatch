.class Lcom/SixClawWorm/application/NobluetoothActivity$3;
.super Landroid/os/Handler;
.source "NobluetoothActivity.java"


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
    iput-object p1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    .line 221
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .parameter "msg"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 224
    iget v5, p1, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_0

    .line 289
    :goto_0
    return-void

    .line 226
    :pswitch_0
    const-string v5, "BluetoothChat"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "MESSAGE_STATE_CHANGE: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    iget v5, p1, Landroid/os/Message;->arg1:I

    packed-switch v5, :pswitch_data_1

    goto :goto_0

    .line 263
    :pswitch_1
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-string v6, "The connection fails"

    invoke-static {v5, v6}, Lcom/SixClawWorm/utils/ToastHint;->show(Landroid/content/Context;Ljava/lang/String;)V

    .line 264
    sput-boolean v8, Lcom/SixClawWorm/utils/Param;->connecting:Z

    .line 265
    sput-boolean v8, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    goto :goto_0

    .line 230
    :pswitch_2
    invoke-static {}, Lcom/SixClawWorm/utils/ProgressDialogHint;->Dismiss()V

    .line 231
    sput-boolean v9, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 232
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-string v6, "The connection is successful"

    invoke-static {v5, v6}, Lcom/SixClawWorm/utils/ToastHint;->show(Landroid/content/Context;Ljava/lang/String;)V

    .line 233
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-static {v5}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    .line 234
    .local v1, CAMERA_WIDTH:I
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-static {v5}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    .line 235
    .local v0, CAMERA_HEIGHT:I
    const/16 v5, 0x500

    if-ne v1, v5, :cond_0

    .line 237
    new-instance v2, Landroid/content/Intent;

    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-class v6, Lcom/SixClawWorm/application/PlayControlActivity1280;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 238
    .local v2, play:Landroid/content/Intent;
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    iget-object v6, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v5, v6, v2, v8}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivityFromChild(Landroid/app/Activity;Landroid/content/Intent;I)V

    .line 251
    :goto_1
    sput-boolean v8, Lcom/SixClawWorm/utils/Param;->connecting:Z

    .line 252
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    iget-object v5, v5, Lcom/SixClawWorm/application/NobluetoothActivity;->handler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    iget-object v6, v6, Lcom/SixClawWorm/application/NobluetoothActivity;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v5, v6}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 240
    .end local v2           #play:Landroid/content/Intent;
    :cond_0
    const/16 v5, 0x780

    if-ne v1, v5, :cond_1

    .line 242
    new-instance v2, Landroid/content/Intent;

    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-class v6, Lcom/SixClawWorm/application/PlayControlActivity1920;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 243
    .restart local v2       #play:Landroid/content/Intent;
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v5, v2}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 247
    .end local v2           #play:Landroid/content/Intent;
    :cond_1
    new-instance v2, Landroid/content/Intent;

    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-class v6, Lcom/SixClawWorm/application/PlayControlActivity;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 248
    .restart local v2       #play:Landroid/content/Intent;
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v5, v2}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 256
    .end local v0           #CAMERA_HEIGHT:I
    .end local v1           #CAMERA_WIDTH:I
    .end local v2           #play:Landroid/content/Intent;
    :pswitch_3
    sput-boolean v9, Lcom/SixClawWorm/utils/Param;->connecting:Z

    goto/16 :goto_0

    .line 260
    :pswitch_4
    sput-boolean v8, Lcom/SixClawWorm/utils/Param;->connecting:Z

    goto/16 :goto_0

    .line 271
    :pswitch_5
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [B

    .line 273
    .local v4, writeBuf:[B
    goto/16 :goto_0

    .line 275
    .end local v4           #writeBuf:[B
    :pswitch_6
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, [B

    .line 277
    .local v3, readBuf:[B
    goto/16 :goto_0

    .line 280
    .end local v3           #readBuf:[B
    :pswitch_7
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "device_name"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    #setter for: Lcom/SixClawWorm/application/NobluetoothActivity;->mConnectedDeviceName:Ljava/lang/String;
    invoke-static {v5, v6}, Lcom/SixClawWorm/application/NobluetoothActivity;->access$0(Lcom/SixClawWorm/application/NobluetoothActivity;Ljava/lang/String;)V

    .line 281
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v5}, Lcom/SixClawWorm/application/NobluetoothActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Connected to "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 282
    iget-object v7, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    #getter for: Lcom/SixClawWorm/application/NobluetoothActivity;->mConnectedDeviceName:Ljava/lang/String;
    invoke-static {v7}, Lcom/SixClawWorm/application/NobluetoothActivity;->access$1(Lcom/SixClawWorm/application/NobluetoothActivity;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 281
    invoke-static {v5, v6, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    .line 282
    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 285
    :pswitch_8
    iget-object v5, p0, Lcom/SixClawWorm/application/NobluetoothActivity$3;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v5}, Lcom/SixClawWorm/application/NobluetoothActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "toast"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    .line 286
    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 224
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 227
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
