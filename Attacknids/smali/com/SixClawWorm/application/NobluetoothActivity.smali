.class public Lcom/SixClawWorm/application/NobluetoothActivity;
.super Landroid/app/Activity;
.source "NobluetoothActivity.java"


# static fields
.field private static final D:Z = true

.field public static final DEVICE_NAME:Ljava/lang/String; = "device_name"

.field public static EXTRA_DEVICE_ADDRESS:Ljava/lang/String; = null

.field public static final MESSAGE_DEVICE_NAME:I = 0x4

.field public static final MESSAGE_READ:I = 0x2

.field public static final MESSAGE_STATE_CHANGE:I = 0x1

.field public static final MESSAGE_TOAST:I = 0x5

.field public static final MESSAGE_WRITE:I = 0x3

.field private static final REQUEST_CONNECT_DEVICE_INSECURE:I = 0x2

.field private static final REQUEST_CONNECT_DEVICE_SECURE:I = 0x1

.field private static final REQUEST_ENABLE_BT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "BluetoothChat"

.field public static final TOAST:Ljava/lang/String; = "toast"

.field private static mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field public static mChatService:Lcom/SixClawWorm/application/BluetoothChatService;


# instance fields
.field private Mlayer:Landroid/widget/Button;

.field private StartBtn:Landroid/widget/Button;

.field private backBtn:Landroid/widget/Button;

.field private first:I

.field handler:Landroid/os/Handler;

.field private helpBtn:Landroid/widget/Button;

.field private mConnectedDeviceName:Ljava/lang/String;

.field private mConversationArrayAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mConversationView:Landroid/widget/ListView;

.field private final mHandler:Landroid/os/Handler;

.field private mOutEditText:Landroid/widget/EditText;

.field private mOutStringBuffer:Ljava/lang/StringBuffer;

.field private mSendButton:Landroid/widget/Button;

.field private mTitle:Landroid/widget/TextView;

.field private mWriteListener:Landroid/widget/TextView$OnEditorActionListener;

.field private okBtn:Landroid/widget/Button;

.field private rssiNum:Landroid/widget/Button;

.field runnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 66
    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 68
    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 74
    const-string v0, "device_address"

    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mConnectedDeviceName:Ljava/lang/String;

    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->first:I

    .line 125
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->handler:Landroid/os/Handler;

    .line 126
    new-instance v0, Lcom/SixClawWorm/application/NobluetoothActivity$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$1;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->runnable:Ljava/lang/Runnable;

    .line 208
    new-instance v0, Lcom/SixClawWorm/application/NobluetoothActivity$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$2;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mWriteListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 221
    new-instance v0, Lcom/SixClawWorm/application/NobluetoothActivity$3;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$3;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mHandler:Landroid/os/Handler;

    .line 32
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/NobluetoothActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 60
    iput-object p1, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mConnectedDeviceName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/NobluetoothActivity;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 60
    iget-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mConnectedDeviceName:Ljava/lang/String;

    return-object v0
.end method

.method public static connectDevice(Z)V
    .locals 3
    .parameter "secure"

    .prologue
    .line 295
    sget-object v0, Lcom/SixClawWorm/utils/Param;->address:Ljava/lang/String;

    .line 297
    .local v0, address:Ljava/lang/String;
    sget-object v2, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    .line 300
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    if-eqz v1, :cond_0

    sget-object v2, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v2, :cond_0

    .line 301
    sget-object v2, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2, v1, p0}, Lcom/SixClawWorm/application/BluetoothChatService;->connect(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 303
    :cond_0
    return-void
.end method

.method private setupChat()V
    .locals 2

    .prologue
    .line 182
    const-string v0, "BluetoothChat"

    const-string v1, "setupChat()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChatService;

    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/SixClawWorm/application/BluetoothChatService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 184
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 185
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    const/16 v1, 0x400

    const/4 v2, 0x1

    .line 80
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 81
    invoke-virtual {p0, v2}, Lcom/SixClawWorm/application/NobluetoothActivity;->requestWindowFeature(I)Z

    .line 82
    invoke-virtual {p0}, Lcom/SixClawWorm/application/NobluetoothActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 84
    const v0, 0x7f030009

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->setContentView(I)V

    .line 85
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 86
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 87
    const v0, 0x7f060015

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->okBtn:Landroid/widget/Button;

    .line 88
    iget-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->okBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/NobluetoothActivity$4;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$4;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    const v0, 0x7f060002

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->backBtn:Landroid/widget/Button;

    .line 98
    iget-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->backBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/NobluetoothActivity$5;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$5;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    const v0, 0x7f060016

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->helpBtn:Landroid/widget/Button;

    .line 108
    iget-object v0, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->helpBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/NobluetoothActivity$6;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/NobluetoothActivity$6;-><init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    sput-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 119
    sget-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    .line 120
    const-string v0, "Bluetooth is not available"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 124
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 201
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 203
    sget-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->stop()V

    .line 204
    :cond_0
    const-string v0, "BluetoothChat"

    const-string v1, "--- ON DESTROY ---"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 306
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 308
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/MenuActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 309
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivity(Landroid/content/Intent;)V

    .line 313
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method public declared-synchronized onPause()V
    .locals 2

    .prologue
    .line 189
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 190
    const-string v0, "BluetoothChat"

    const-string v1, "- ON PAUSE -"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    monitor-exit p0

    return-void

    .line 189
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onResume()V
    .locals 5

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 156
    sget-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->ifPlayControlActivity:Z

    if-nez v1, :cond_0

    .line 157
    sget-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity1280;->ifPlayControlActivity:Z

    if-nez v1, :cond_0

    .line 158
    sget-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity1920;->ifPlayControlActivity:Z

    if-eqz v1, :cond_1

    .line 159
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/MenuActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 160
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivity(Landroid/content/Intent;)V

    .line 162
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/SixClawWorm/application/NobluetoothActivity;->runnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 163
    const-string v1, "BluetoothChat"

    const-string v2, "+ ON RESUME +"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v1, :cond_2

    .line 170
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v1

    if-nez v1, :cond_3

    .line 172
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->start()V

    .line 177
    :goto_0
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    sput-object v1, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    :cond_2
    monitor-exit p0

    return-void

    .line 174
    :cond_3
    :try_start_1
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 155
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 142
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 144
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 145
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 146
    .local v0, enableIntent:Landroid/content/Intent;
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 151
    .end local v0           #enableIntent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    sget-object v1, Lcom/SixClawWorm/application/NobluetoothActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/SixClawWorm/application/NobluetoothActivity;->setupChat()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 195
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 196
    const-string v0, "BluetoothChat"

    const-string v1, "-- ON STOP --"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    return-void
.end method
