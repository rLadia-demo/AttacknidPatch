.class public Lcom/SixClawWorm/application/MenuActivity;
.super Landroid/app/Activity;
.source "MenuActivity.java"


# instance fields
.field private Mlayer:Landroid/widget/Button;

.field private aboutBtn:Landroid/widget/Button;

.field private backBtn:Landroid/widget/Button;

.field private introdutionBtn:Landroid/widget/Button;

.field private playBtn:Landroid/widget/Button;

.field private rssiNum:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 23
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    const v0, 0x7f030007

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->setContentView(I)V

    .line 25
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 26
    const v0, 0x7f060001

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->Mlayer:Landroid/widget/Button;

    .line 27
    iget-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->Mlayer:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/MenuActivity$1;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/MenuActivity$1;-><init>(Lcom/SixClawWorm/application/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    const v0, 0x7f060014

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->aboutBtn:Landroid/widget/Button;

    .line 38
    iget-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->aboutBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/MenuActivity$2;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/MenuActivity$2;-><init>(Lcom/SixClawWorm/application/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    const v0, 0x7f060002

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->backBtn:Landroid/widget/Button;

    .line 49
    iget-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->backBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/MenuActivity$3;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/MenuActivity$3;-><init>(Lcom/SixClawWorm/application/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    const v0, 0x7f060012

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->playBtn:Landroid/widget/Button;

    .line 59
    iget-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->playBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/MenuActivity$4;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/MenuActivity$4;-><init>(Lcom/SixClawWorm/application/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    const v0, 0x7f060013

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->introdutionBtn:Landroid/widget/Button;

    .line 90
    iget-object v0, p0, Lcom/SixClawWorm/application/MenuActivity;->introdutionBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/MenuActivity$5;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/MenuActivity$5;-><init>(Lcom/SixClawWorm/application/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 100
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 101
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/BluetoothChat;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 106
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method
