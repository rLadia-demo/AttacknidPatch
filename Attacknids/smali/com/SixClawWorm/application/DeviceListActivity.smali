.class public Lcom/SixClawWorm/application/DeviceListActivity;
.super Landroid/app/Activity;
.source "DeviceListActivity.java"


# static fields
.field private static final D:Z = true

.field public static EXTRA_DEVICE_ADDRESS:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "DeviceListActivity"


# instance fields
.field private mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPairedDevicesArrayAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-string v0, "device_address"

    sput-object v0, Lcom/SixClawWorm/application/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 125
    new-instance v0, Lcom/SixClawWorm/application/DeviceListActivity$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/DeviceListActivity$1;-><init>(Lcom/SixClawWorm/application/DeviceListActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 151
    new-instance v0, Lcom/SixClawWorm/application/DeviceListActivity$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/DeviceListActivity$2;-><init>(Lcom/SixClawWorm/application/DeviceListActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/DeviceListActivity;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/DeviceListActivity;)Landroid/widget/ArrayAdapter;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    return-object v0
.end method

.method static synthetic access$2(Lcom/SixClawWorm/application/DeviceListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/SixClawWorm/application/DeviceListActivity;->doDiscovery()V

    return-void
.end method

.method private doDiscovery()V
    .locals 2

    .prologue
    .line 106
    const-string v0, "DeviceListActivity"

    const-string v1, "doDiscovery()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/DeviceListActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 110
    const v0, 0x7f040007

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/DeviceListActivity;->setTitle(I)V

    .line 113
    const v0, 0x7f06000c

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 116
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->startDiscovery()Z

    .line 122
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"

    .prologue
    const v9, 0x7f030004

    const/4 v8, 0x0

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const/4 v7, 0x5

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->requestWindowFeature(I)Z

    .line 37
    const v7, 0x7f030003

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->setContentView(I)V

    .line 38
    invoke-virtual {p0, v8}, Lcom/SixClawWorm/application/DeviceListActivity;->setResult(I)V

    .line 39
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v7

    invoke-virtual {v7, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 40
    const v7, 0x7f06000e

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 41
    .local v6, scanButton:Landroid/widget/Button;
    new-instance v7, Lcom/SixClawWorm/application/DeviceListActivity$3;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/DeviceListActivity$3;-><init>(Lcom/SixClawWorm/application/DeviceListActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    new-instance v7, Landroid/widget/ArrayAdapter;

    invoke-direct {v7, p0, v9}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    iput-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mPairedDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    .line 51
    new-instance v7, Landroid/widget/ArrayAdapter;

    invoke-direct {v7, p0, v9}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    iput-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    .line 54
    const v7, 0x7f06000b

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    .line 55
    .local v5, pairedListView:Landroid/widget/ListView;
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mPairedDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 56
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v5, v7}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 59
    const v7, 0x7f06000d

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 60
    .local v2, newDevicesListView:Landroid/widget/ListView;
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 61
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v2, v7}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 64
    new-instance v1, Landroid/content/IntentFilter;

    const-string v7, "android.bluetooth.device.action.FOUND"

    invoke-direct {v1, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 65
    .local v1, filter:Landroid/content/IntentFilter;
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v7, v1}, Lcom/SixClawWorm/application/DeviceListActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 68
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    const-string v7, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-direct {v1, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 69
    .restart local v1       #filter:Landroid/content/IntentFilter;
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v7, v1}, Lcom/SixClawWorm/application/DeviceListActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 72
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v7

    iput-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 75
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v4

    .line 78
    .local v4, pairedDevices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v7

    if-lez v7, :cond_1

    .line 79
    const v7, 0x7f06000a

    invoke-virtual {p0, v7}, Lcom/SixClawWorm/application/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 80
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 87
    :goto_1
    return-void

    .line 80
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 81
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v8, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mPairedDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 84
    .end local v0           #device:Landroid/bluetooth/BluetoothDevice;
    :cond_1
    invoke-virtual {p0}, Lcom/SixClawWorm/application/DeviceListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f040009

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 85
    .local v3, noDevices:Ljava/lang/String;
    iget-object v7, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mPairedDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v7, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 94
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/DeviceListActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 100
    return-void
.end method
