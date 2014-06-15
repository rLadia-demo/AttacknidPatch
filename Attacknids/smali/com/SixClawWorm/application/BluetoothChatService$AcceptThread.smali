.class Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;
.super Ljava/lang/Thread;
.source "BluetoothChatService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/BluetoothChatService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AcceptThread"
.end annotation


# instance fields
.field private mSocketType:Ljava/lang/String;

.field private final mmServerSocket:Landroid/bluetooth/BluetoothServerSocket;

.field final synthetic this$0:Lcom/SixClawWorm/application/BluetoothChatService;


# direct methods
.method public constructor <init>(Lcom/SixClawWorm/application/BluetoothChatService;Z)V
    .locals 5
    .parameter
    .parameter "secure"

    .prologue
    .line 261
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 262
    const/4 v1, 0x0

    .line 263
    .local v1, tmp:Landroid/bluetooth/BluetoothServerSocket;
    if-eqz p2, :cond_0

    const-string v2, "Secure"

    :goto_0
    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    .line 267
    if-eqz p2, :cond_1

    .line 268
    :try_start_0
    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-static {p1}, Lcom/SixClawWorm/application/BluetoothChatService;->access$0(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    const-string v3, "BluetoothChatSecure"

    .line 269
    invoke-static {}, Lcom/SixClawWorm/application/BluetoothChatService;->access$1()Ljava/util/UUID;

    move-result-object v4

    .line 268
    invoke-virtual {v2, v3, v4}, Landroid/bluetooth/BluetoothAdapter;->listenUsingRfcommWithServiceRecord(Ljava/lang/String;Ljava/util/UUID;)Landroid/bluetooth/BluetoothServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 277
    :goto_1
    iput-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mmServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    .line 278
    return-void

    .line 263
    :cond_0
    const-string v2, "Insecure"

    goto :goto_0

    .line 271
    :cond_1
    :try_start_1
    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-static {p1}, Lcom/SixClawWorm/application/BluetoothChatService;->access$0(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    .line 272
    const-string v3, "BluetoothChatInsecure"

    invoke-static {}, Lcom/SixClawWorm/application/BluetoothChatService;->access$2()Ljava/util/UUID;

    move-result-object v4

    .line 271
    invoke-virtual {v2, v3, v4}, Landroid/bluetooth/BluetoothAdapter;->listenUsingInsecureRfcommWithServiceRecord(Ljava/lang/String;Ljava/util/UUID;)Landroid/bluetooth/BluetoothServerSocket;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_1

    .line 274
    :catch_0
    move-exception v0

    .line 275
    .local v0, e:Ljava/io/IOException;
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Socket Type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "listen() failed"

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
    .line 328
    const-string v1, "BluetoothChatService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Socket Type"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "cancel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    :try_start_0
    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mmServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    :goto_0
    return-void

    .line 331
    :catch_0
    move-exception v0

    .line 332
    .local v0, e:Ljava/io/IOException;
    const-string v1, "BluetoothChatService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Socket Type"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "close() of server failed"

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
    .line 280
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Socket Type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 281
    const-string v4, "BEGIN mAcceptThread"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 280
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AcceptThread"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->setName(Ljava/lang/String;)V

    .line 284
    const/4 v1, 0x0

    .line 287
    .local v1, socket:Landroid/bluetooth/BluetoothSocket;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mState:I
    invoke-static {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->access$3(Lcom/SixClawWorm/application/BluetoothChatService;)I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 323
    :goto_1
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "END mAcceptThread, socket Type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    return-void

    .line 291
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mmServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    if-eqz v2, :cond_2

    .line 292
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mmServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothServerSocket;->accept()Landroid/bluetooth/BluetoothSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 301
    :cond_2
    if-eqz v1, :cond_0

    .line 302
    iget-object v3, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    monitor-enter v3

    .line 303
    :try_start_1
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    #getter for: Lcom/SixClawWorm/application/BluetoothChatService;->mState:I
    invoke-static {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->access$3(Lcom/SixClawWorm/application/BluetoothChatService;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 302
    :goto_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 295
    :catch_0
    move-exception v0

    .line 296
    .local v0, e:Ljava/io/IOException;
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Socket Type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "accept() failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 307
    .end local v0           #e:Ljava/io/IOException;
    :pswitch_0
    :try_start_2
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->this$0:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    .line 308
    iget-object v5, p0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->mSocketType:Ljava/lang/String;

    .line 307
    invoke-virtual {v2, v1, v4, v5}, Lcom/SixClawWorm/application/BluetoothChatService;->connected(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 314
    :pswitch_1
    :try_start_3
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    .line 315
    :catch_1
    move-exception v0

    .line 316
    .restart local v0       #e:Ljava/io/IOException;
    :try_start_4
    const-string v2, "BluetoothChatService"

    const-string v4, "Could not close unwanted socket"

    invoke-static {v2, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 303
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
