.class Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;
.super Ljava/lang/Thread;
.source "BluetoothChatService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/BluetoothChatService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectThread"
.end annotation


# instance fields
.field private mSocketType:Ljava/lang/String;

.field private final mmDevice:Landroid/bluetooth/BluetoothDevice;

.field private final mmSocket:Landroid/bluetooth/BluetoothSocket;

.field final synthetic this$0:Lcom/SixClawWorm/application/BluetoothChatService;


# direct methods
.method public constructor <init>(Lcom/SixClawWorm/application/BluetoothChatService;Landroid/bluetooth/BluetoothDevice;Z)V
    .locals 5
    .parameter
    .parameter "device"
    .parameter "secure"

    .prologue
    .line 348
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 349
    iput-object p2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmDevice:Landroid/bluetooth/BluetoothDevice;

    .line 350
    const/4 v1, 0x0

    .line 351
    .local v1, tmp:Landroid/bluetooth/BluetoothSocket;
    if-eqz p3, :cond_0

    const-string v2, "Secure"

    :goto_0
    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    .line 355
    if-eqz p3, :cond_1

    .line 357
    :try_start_0
    invoke-static {}, Lcom/SixClawWorm/application/BluetoothChatService;->access$1()Ljava/util/UUID;

    move-result-object v2

    .line 356
    invoke-virtual {p2, v2}, Landroid/bluetooth/BluetoothDevice;->createRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 365
    :goto_1
    iput-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    .line 366
    return-void

    .line 351
    :cond_0
    const-string v2, "Insecure"

    goto :goto_0

    .line 360
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/SixClawWorm/application/BluetoothChatService;->access$2()Ljava/util/UUID;

    move-result-object v2

    .line 359
    invoke-virtual {p2, v2}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_1

    .line 362
    :catch_0
    move-exception v0

    .line 363
    .local v0, e:Ljava/io/IOException;
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Socket Type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "create() failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .prologue
    .line 403
    :try_start_0
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v1, :cond_0

    .line 404
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 410
    :cond_0
    :goto_0
    return-void

    .line 407
    :catch_0
    move-exception v0

    .line 408
    .local v0, e:Ljava/io/IOException;
    const-string v1, "BluetoothChatService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "close() of connect "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " socket failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 369
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "BEGIN mConnectThread SocketType:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ConnectThread"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->setName(Ljava/lang/String;)V

    .line 373
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-static {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->access$0(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 379
    :try_start_0
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    monitor-enter v3

    .line 394
    :try_start_1
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    const/4 v4, 0x0

    #setter for: Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;
    invoke-static {v2, v4}, Lcom/SixClawWorm/application/BluetoothChatService;->access$5(Lcom/SixClawWorm/application/BluetoothChatService;Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;)V

    .line 393
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 398
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v5, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lcom/SixClawWorm/application/BluetoothChatService;->connected(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V

    .line 399
    :goto_0
    return-void

    .line 380
    :catch_0
    move-exception v0

    .line 383
    .local v0, e:Ljava/io/IOException;
    :try_start_2
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mmSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 388
    :goto_1
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #calls: Lcom/SixClawWorm/application/BluetoothChatService;->connectionFailed()V
    invoke-static {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->access$4(Lcom/SixClawWorm/application/BluetoothChatService;)V

    goto :goto_0

    .line 384
    :catch_1
    move-exception v1

    .line 385
    .local v1, e2:Ljava/io/IOException;
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "unable to close() "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 386
    const-string v4, " socket during connection failure"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 385
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 393
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #e2:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method
