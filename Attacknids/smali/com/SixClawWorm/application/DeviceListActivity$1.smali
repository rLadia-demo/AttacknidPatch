.class Lcom/SixClawWorm/application/DeviceListActivity$1;
.super Ljava/lang/Object;
.source "DeviceListActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/application/DeviceListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/DeviceListActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/DeviceListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/DeviceListActivity$1;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter "v"
    .parameter "arg2"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, av:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v4, p0, Lcom/SixClawWorm/application/DeviceListActivity$1;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    #getter for: Lcom/SixClawWorm/application/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-static {v4}, Lcom/SixClawWorm/application/DeviceListActivity;->access$0(Lcom/SixClawWorm/application/DeviceListActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 131
    check-cast p2, Landroid/widget/TextView;

    .end local p2
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, info:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x11

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, address:Ljava/lang/String;
    sput-object v0, Lcom/SixClawWorm/utils/Param;->address:Ljava/lang/String;

    .line 136
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 137
    .local v3, intent:Landroid/content/Intent;
    sget-object v4, Lcom/SixClawWorm/application/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    iget-object v4, p0, Lcom/SixClawWorm/application/DeviceListActivity$1;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    const/4 v5, -0x1

    invoke-virtual {v4, v5, v3}, Lcom/SixClawWorm/application/DeviceListActivity;->setResult(ILandroid/content/Intent;)V

    .line 141
    iget-object v4, p0, Lcom/SixClawWorm/application/DeviceListActivity$1;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    invoke-virtual {v4}, Lcom/SixClawWorm/application/DeviceListActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v0           #address:Ljava/lang/String;
    .end local v3           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v1

    .line 143
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->fillInStackTrace()Ljava/lang/Throwable;

    goto :goto_0
.end method
