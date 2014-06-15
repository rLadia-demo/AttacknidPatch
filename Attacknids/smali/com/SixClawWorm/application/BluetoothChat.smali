.class public Lcom/SixClawWorm/application/BluetoothChat;
.super Landroid/app/Activity;
.source "BluetoothChat.java"


# static fields
.field private static final D:Z = true

.field public static final DEVICE_NAME:Ljava/lang/String; = "device_name"

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

.field private maxMemory:J

.field private rssiNum:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 67
    sput-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 69
    sput-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mConnectedDeviceName:Ljava/lang/String;

    .line 257
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChat$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/BluetoothChat$1;-><init>(Lcom/SixClawWorm/application/BluetoothChat;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mWriteListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 270
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChat$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/BluetoothChat$2;-><init>(Lcom/SixClawWorm/application/BluetoothChat;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mHandler:Landroid/os/Handler;

    .line 33
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/BluetoothChat;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 61
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChat;->mConnectedDeviceName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/BluetoothChat;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 61
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mConnectedDeviceName:Ljava/lang/String;

    return-object v0
.end method

.method public static connectDevice(Landroid/content/Intent;Z)V
    .locals 4
    .parameter "data"
    .parameter "secure"

    .prologue
    .line 363
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    sget-object v3, Lcom/SixClawWorm/application/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 365
    .local v0, address:Ljava/lang/String;
    sget-object v2, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    .line 368
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    if-eqz v1, :cond_0

    sget-object v2, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v2, :cond_0

    .line 369
    sget-object v2, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2, v1, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->connect(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 371
    :cond_0
    return-void
.end method

.method private ensureDiscoverable()V
    .locals 3

    .prologue
    .line 198
    const-string v1, "BluetoothChat"

    const-string v2, "ensure discoverable"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    sget-object v1, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getScanMode()I

    move-result v1

    .line 200
    const/16 v2, 0x17

    .line 199
    if-eq v1, v2, :cond_0

    .line 201
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_DISCOVERABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 202
    .local v0, discoverableIntent:Landroid/content/Intent;
    const-string v1, "android.bluetooth.adapter.extra.DISCOVERABLE_DURATION"

    const/16 v2, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 203
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/BluetoothChat;->startActivity(Landroid/content/Intent;)V

    .line 205
    .end local v0           #discoverableIntent:Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private sendMessage([B)V
    .locals 3
    .parameter "send"

    .prologue
    const/4 v2, 0x0

    .line 213
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 214
    const v0, 0x7f040002

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 219
    :cond_1
    array-length v0, p1

    if-lez v0, :cond_0

    .line 229
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 232
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_0
.end method

.method private setupChat()V
    .locals 2

    .prologue
    .line 145
    const-string v0, "BluetoothChat"

    const-string v1, "setupChat()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    new-instance v0, Lcom/SixClawWorm/application/BluetoothChatService;

    iget-object v1, p0, Lcom/SixClawWorm/application/BluetoothChat;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/SixClawWorm/application/BluetoothChatService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    sput-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 174
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 175
    return-void
.end method

.method private toStringHex(Ljava/lang/String;)[B
    .locals 5
    .parameter "s"

    .prologue
    .line 240
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    .line 241
    .local v0, baKeyword:[B
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v3, v0

    if-lt v2, v3, :cond_0

    .line 253
    :goto_1
    return-object v0

    .line 245
    :cond_0
    mul-int/lit8 v3, v2, 0x2

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x2

    :try_start_0
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 248
    :catch_0
    move-exception v1

    .line 250
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 241
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 333
    const-string v0, "BluetoothChat"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onActivityResult "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    packed-switch p1, :pswitch_data_0

    .line 359
    :cond_0
    :goto_0
    return-void

    .line 337
    :pswitch_0
    if-ne p2, v3, :cond_0

    .line 338
    const/4 v0, 0x1

    invoke-static {p3, v0}, Lcom/SixClawWorm/application/BluetoothChat;->connectDevice(Landroid/content/Intent;Z)V

    goto :goto_0

    .line 343
    :pswitch_1
    if-ne p2, v3, :cond_0

    .line 344
    invoke-static {p3, v4}, Lcom/SixClawWorm/application/BluetoothChat;->connectDevice(Landroid/content/Intent;Z)V

    goto :goto_0

    .line 349
    :pswitch_2
    if-ne p2, v3, :cond_1

    .line 351
    invoke-direct {p0}, Lcom/SixClawWorm/application/BluetoothChat;->setupChat()V

    goto :goto_0

    .line 354
    :cond_1
    const-string v0, "BluetoothChat"

    const-string v1, "BT not enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    const v0, 0x7f040003

    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 356
    invoke-virtual {p0}, Lcom/SixClawWorm/application/BluetoothChat;->finish()V

    goto :goto_0

    .line 334
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/BluetoothChat;->setContentView(I)V

    .line 78
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 80
    const v0, 0x7f060001

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/BluetoothChat;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->Mlayer:Landroid/widget/Button;

    .line 81
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->Mlayer:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/BluetoothChat$3;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/BluetoothChat$3;-><init>(Lcom/SixClawWorm/application/BluetoothChat;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    sput-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 93
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    .line 94
    const-string v0, "Bluetooth is not available"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 95
    invoke-virtual {p0}, Lcom/SixClawWorm/application/BluetoothChat;->finish()V

    .line 107
    :goto_0
    return-void

    .line 98
    :cond_0
    const v0, 0x7f060007

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/BluetoothChat;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->StartBtn:Landroid/widget/Button;

    .line 99
    iget-object v0, p0, Lcom/SixClawWorm/application/BluetoothChat;->StartBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/BluetoothChat$4;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/BluetoothChat$4;-><init>(Lcom/SixClawWorm/application/BluetoothChat;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 375
    invoke-virtual {p0}, Lcom/SixClawWorm/application/BluetoothChat;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 376
    .local v0, inflater:Landroid/view/MenuInflater;
    const/high16 v1, 0x7f05

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 377
    const/4 v1, 0x1

    return v1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 191
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 193
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->stop()V

    .line 194
    :cond_0
    const-string v0, "BluetoothChat"

    const-string v1, "--- ON DESTROY ---"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 396
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 397
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->exit(Landroid/content/Context;)V

    .line 400
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 382
    const/4 v0, 0x0

    .line 383
    .local v0, serverIntent:Landroid/content/Intent;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 392
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 385
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    .end local v0           #serverIntent:Landroid/content/Intent;
    const-class v2, Lcom/SixClawWorm/application/DeviceListActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 386
    .restart local v0       #serverIntent:Landroid/content/Intent;
    const/4 v2, 0x2

    invoke-virtual {p0, v0, v2}, Lcom/SixClawWorm/application/BluetoothChat;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 389
    :pswitch_1
    invoke-direct {p0}, Lcom/SixClawWorm/application/BluetoothChat;->ensureDiscoverable()V

    goto :goto_0

    .line 383
    nop

    :pswitch_data_0
    .packed-switch 0x7f060018
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public declared-synchronized onPause()V
    .locals 2

    .prologue
    .line 179
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 180
    const-string v0, "BluetoothChat"

    const-string v1, "- ON PAUSE -"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    monitor-exit p0

    return-void

    .line 179
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onResume()V
    .locals 2

    .prologue
    .line 125
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 126
    const-string v0, "BluetoothChat"

    const-string v1, "+ ON RESUME +"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v0, :cond_0

    .line 133
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v0

    if-nez v0, :cond_1

    .line 135
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->start()V

    .line 140
    :goto_0
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    sput-object v0, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    :cond_0
    monitor-exit p0

    return-void

    .line 137
    :cond_1
    :try_start_1
    sget-object v0, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 125
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 112
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 114
    sget-object v1, Lcom/SixClawWorm/application/BluetoothChat;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 115
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 116
    .local v0, enableIntent:Landroid/content/Intent;
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/SixClawWorm/application/BluetoothChat;->startActivityForResult(Landroid/content/Intent;I)V

    .line 121
    .end local v0           #enableIntent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 119
    :cond_1
    sget-object v1, Lcom/SixClawWorm/application/BluetoothChat;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/SixClawWorm/application/BluetoothChat;->setupChat()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 185
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 186
    const-string v0, "BluetoothChat"

    const-string v1, "-- ON STOP --"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    return-void
.end method
