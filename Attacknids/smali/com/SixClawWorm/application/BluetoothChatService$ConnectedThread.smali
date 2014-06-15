.class Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;
.super Ljava/lang/Thread;
.source "BluetoothChatService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/BluetoothChatService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectedThread"
.end annotation


# instance fields
.field private final mmInStream:Ljava/io/InputStream;

.field private final mmOutStream:Ljava/io/OutputStream;

.field private final mmSocket:Landroid/bluetooth/BluetoothSocket;

.field final synthetic this$0:Lcom/SixClawWorm/application/BluetoothChatService;


# direct methods
.method public constructor <init>(Lcom/SixClawWorm/application/BluetoothChatService;Landroid/bluetooth/BluetoothSocket;Ljava/lang/String;)V
    .locals 6
    .parameter
    .parameter "socket"
    .parameter "socketType"

    .prologue
    .line 422
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 423
    const-string v3, "BluetoothChatService"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "create ConnectedThread: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    iput-object p2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    .line 425
    const/4 v1, 0x0

    .line 426
    .local v1, tmpIn:Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 430
    .local v2, tmpOut:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 431
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 436
    :goto_0
    iput-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmInStream:Ljava/io/InputStream;

    .line 437
    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmOutStream:Ljava/io/OutputStream;

    .line 438
    return-void

    .line 432
    :catch_0
    move-exception v0

    .line 433
    .local v0, e:Ljava/io/IOException;
    const-string v3, "BluetoothChatService"

    const-string v4, "temp sockets not created"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 480
    :try_start_0
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 484
    :goto_0
    return-void

    .line 481
    :catch_0
    move-exception v0

    .line 482
    .local v0, e:Ljava/io/IOException;
    const-string v1, "BluetoothChatService"

    const-string v2, "close() of connect socket failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 441
    const-string v3, "BluetoothChatService"

    const-string v4, "BEGIN mConnectedThread"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 449
    .local v0, buffer:[B
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmInStream:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 452
    .local v1, bytes:I
    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/SixClawWorm/application/BluetoothChatService;->access$6(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/os/Handler;

    move-result-object v3

    const/4 v4, 0x2

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v1, v5, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 453
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 454
    .end local v1           #bytes:I
    :catch_0
    move-exception v2

    .line 455
    .local v2, e:Ljava/io/IOException;
    const-string v3, "BluetoothChatService"

    const-string v4, "disconnected"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 456
    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #calls: Lcom/SixClawWorm/application/BluetoothChatService;->connectionLost()V
    invoke-static {v3}, Lcom/SixClawWorm/application/BluetoothChatService;->access$7(Lcom/SixClawWorm/application/BluetoothChatService;)V

    .line 460
    return-void
.end method

.method public write([B)V
    .locals 5
    .parameter "buffer"

    .prologue
    .line 468
    :try_start_0
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->mmOutStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 471
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->access$6(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, -0x1

    const/4 v4, -0x1

    invoke-virtual {v1, v2, v3, v4, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 472
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 476
    :goto_0
    return-void

    .line 473
    :catch_0
    move-exception v0

    .line 474
    .local v0, e:Ljava/io/IOException;
    const-string v1, "BluetoothChatService"

    const-string v2, "Exception during write"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
