.class public Lcom/SixClawWorm/application/BluetoothChatService;
.super Ljava/lang/Object;
.source "BluetoothChatService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;,
        Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;,
        Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;
    }
.end annotation


# static fields
.field public static Bluetoothfail:Z = false

.field private static final D:Z = true

.field private static final MY_UUID_INSECURE:Ljava/util/UUID; = null

.field private static final MY_UUID_SECURE:Ljava/util/UUID; = null

.field private static final NAME_INSECURE:Ljava/lang/String; = "BluetoothChatInsecure"

.field private static final NAME_SECURE:Ljava/lang/String; = "BluetoothChatSecure"

.field public static final STATE_CONNECTED:I = 0x3

.field public static final STATE_CONNECTING:I = 0x2

.field public static final STATE_LISTEN:I = 0x1

.field public static final STATE_NONE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BluetoothChatService"

.field public static firstUsed:Z


# instance fields
.field private final mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

.field private mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

.field private final mHandler:Landroid/os/Handler;

.field private mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

.field private mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

.field private mState:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 31
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    .line 30
    sput-object v0, Lcom/SixClawWorm/application/BluetoothChatService;->MY_UUID_SECURE:Ljava/util/UUID;

    .line 33
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    .line 32
    sput-object v0, Lcom/SixClawWorm/application/BluetoothChatService;->MY_UUID_INSECURE:Ljava/util/UUID;

    .line 49
    sput-boolean v1, Lcom/SixClawWorm/application/BluetoothChatService;->Bluetoothfail:Z

    .line 50
    sput-boolean v1, Lcom/SixClawWorm/application/BluetoothChatService;->firstUsed:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1
    .parameter "context"
    .parameter "handler"

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    .line 59
    iput-object p2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    .line 60
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .parameter

    .prologue
    .line 36
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChatService;->MY_UUID_SECURE:Ljava/util/UUID;

    return-object v0
.end method

.method static synthetic access$2()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChatService;->MY_UUID_INSECURE:Ljava/util/UUID;

    return-object v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/application/BluetoothChatService;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    return v0
.end method

.method static synthetic access$4(Lcom/SixClawWorm/application/BluetoothChatService;)V
    .locals 0
    .parameter

    .prologue
    .line 214
    invoke-direct {p0}, Lcom/SixClawWorm/application/BluetoothChatService;->connectionFailed()V

    return-void
.end method

.method static synthetic access$5(Lcom/SixClawWorm/application/BluetoothChatService;Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 40
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    return-void
.end method

.method static synthetic access$6(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 37
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/SixClawWorm/application/BluetoothChatService;)V
    .locals 0
    .parameter

    .prologue
    .line 235
    invoke-direct {p0}, Lcom/SixClawWorm/application/BluetoothChatService;->connectionLost()V

    return-void
.end method

.method private connectionFailed()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 216
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 217
    .local v1, msg:Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 218
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "toast"

    const-string v3, "The connection fails"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 220
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 223
    invoke-virtual {p0}, Lcom/SixClawWorm/application/BluetoothChatService;->start()V

    .line 224
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 225
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->connecting:Z

    .line 226
    sget-boolean v2, Lcom/SixClawWorm/application/BluetoothChatService;->firstUsed:Z

    if-eqz v2, :cond_0

    .line 227
    invoke-static {}, Lcom/SixClawWorm/utils/ProgressDialogHint;->Dismiss()V

    .line 229
    :cond_0
    const/4 v2, 0x1

    sput-boolean v2, Lcom/SixClawWorm/application/BluetoothChatService;->firstUsed:Z

    .line 230
    return-void
.end method

.method private connectionLost()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 237
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 238
    .local v1, msg:Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 239
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "toast"

    const-string v3, "Device connection was lost"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 241
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 243
    invoke-virtual {p0}, Lcom/SixClawWorm/application/BluetoothChatService;->start()V

    .line 244
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 245
    sput-boolean v4, Lcom/SixClawWorm/application/BluetoothChatService;->Bluetoothfail:Z

    .line 246
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->connecting:Z

    .line 247
    const/4 v2, 0x0

    sput-object v2, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 249
    return-void
.end method

.method private declared-synchronized setState(I)V
    .locals 3
    .parameter "state"

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    const-string v0, "BluetoothChatService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setState() "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iput p1, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    .line 71
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, p1, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized connect(Landroid/bluetooth/BluetoothDevice;Z)V
    .locals 4
    .parameter "device"
    .parameter "secure"

    .prologue
    const/4 v3, 0x2

    .line 111
    monitor-enter p0

    :try_start_0
    const-string v0, "BluetoothChatService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "connect to: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    iget v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    if-ne v0, v3, :cond_0

    .line 115
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 122
    :cond_1
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-direct {v0, p0, p1, p2}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;-><init>(Lcom/SixClawWorm/application/BluetoothChatService;Landroid/bluetooth/BluetoothDevice;Z)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    .line 123
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->start()V

    .line 124
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/SixClawWorm/application/BluetoothChatService;->setState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    monitor-exit p0

    return-void

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connected(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
    .locals 5
    .parameter "socket"
    .parameter "device"
    .parameter "socketType"

    .prologue
    .line 135
    monitor-enter p0

    :try_start_0
    const-string v2, "BluetoothChatService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "connected, Socket Type:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->cancel()V

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    .line 141
    :cond_0
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->cancel()V

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 144
    :cond_1
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-eqz v2, :cond_2

    .line 145
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->cancel()V

    .line 146
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 148
    :cond_2
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-eqz v2, :cond_3

    .line 149
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->cancel()V

    .line 150
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 154
    :cond_3
    new-instance v2, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-direct {v2, p0, p1, p3}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;-><init>(Lcom/SixClawWorm/application/BluetoothChatService;Landroid/bluetooth/BluetoothSocket;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 155
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->start()V

    .line 158
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 159
    .local v1, msg:Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 160
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "device_name"

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 162
    iget-object v2, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 163
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lcom/SixClawWorm/application/BluetoothChatService;->setState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    monitor-exit p0

    return-void

    .line 135
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #msg:Landroid/os/Message;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getState()I
    .locals 1

    .prologue
    .line 77
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start()V
    .locals 2

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    const-string v0, "BluetoothChatService"

    const-string v1, "start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    const/4 v0, 0x1

    sput-boolean v0, Lcom/SixClawWorm/application/BluetoothChatService;->Bluetoothfail:Z

    .line 87
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 92
    :cond_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/SixClawWorm/application/BluetoothChatService;->setState(I)V

    .line 95
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-nez v0, :cond_2

    .line 96
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;-><init>(Lcom/SixClawWorm/application/BluetoothChatService;Z)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 97
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->start()V

    .line 99
    :cond_2
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-nez v0, :cond_3

    .line 100
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;-><init>(Lcom/SixClawWorm/application/BluetoothChatService;Z)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 101
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :cond_3
    monitor-exit p0

    return-void

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stop()V
    .locals 2

    .prologue
    .line 170
    monitor-enter p0

    :try_start_0
    const-string v0, "BluetoothChatService"

    const-string v1, "stop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;->cancel()V

    .line 174
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->cancel()V

    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-eqz v0, :cond_2

    .line 183
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->cancel()V

    .line 184
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mSecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 187
    :cond_2
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    if-eqz v0, :cond_3

    .line 188
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;->cancel()V

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mInsecureAcceptThread:Lcom/SixClawWorm/application/BluetoothChatService$AcceptThread;

    .line 191
    :cond_3
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/SixClawWorm/application/BluetoothChatService;->setState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public write([B)V
    .locals 3
    .parameter "out"

    .prologue
    .line 203
    monitor-enter p0

    .line 204
    :try_start_0
    iget v1, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mState:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    monitor-exit p0

    .line 209
    :goto_0
    return-void

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChatService;->mConnectedThread:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;

    .line 203
    .local v0, r:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    invoke-virtual {v0, p1}, Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;->write([B)V

    goto :goto_0

    .line 203
    .end local v0           #r:Lcom/SixClawWorm/application/BluetoothChatService$ConnectedThread;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
