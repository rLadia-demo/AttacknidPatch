.class Lcom/SixClawWorm/application/BluetoothChat$1;
.super Ljava/lang/Object;
.source "BluetoothChat.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    iput-object p1, p0, Lcom/SixClawWorm/application/BluetoothChat$1;->this$0:Lcom/SixClawWorm/application/BluetoothChat;

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "view"
    .parameter "actionId"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 260
    if-nez p2, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 261
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 264
    :cond_0
    const-string v0, "BluetoothChat"

    const-string v1, "END onEditorAction"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    return v2
.end method
