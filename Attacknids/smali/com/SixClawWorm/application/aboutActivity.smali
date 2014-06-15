.class public Lcom/SixClawWorm/application/aboutActivity;
.super Landroid/app/Activity;
.source "aboutActivity.java"


# instance fields
.field private Mlayer:Landroid/widget/Button;

.field private Myt_Btn:Landroid/widget/Button;

.field private about_logoBtn:Landroid/widget/Button;

.field private backBtn:Landroid/widget/Button;

.field private facebook_Btn:Landroid/widget/Button;

.field private mtwitter_button:Landroid/widget/Button;

.field private wow_Btn:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    const/16 v1, 0x400

    .line 23
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->requestWindowFeature(I)Z

    .line 25
    invoke-virtual {p0}, Lcom/SixClawWorm/application/aboutActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 27
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->setContentView(I)V

    .line 28
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 29
    const v0, 0x7f060002

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->backBtn:Landroid/widget/Button;

    .line 30
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->backBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$1;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$1;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    const v0, 0x7f060001

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->Mlayer:Landroid/widget/Button;

    .line 38
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->Mlayer:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$2;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$2;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const v0, 0x7f060003

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->wow_Btn:Landroid/widget/Button;

    .line 48
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->wow_Btn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$3;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$3;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    const v0, 0x7f060004

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->facebook_Btn:Landroid/widget/Button;

    .line 58
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->facebook_Btn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$4;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$4;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    const v0, 0x7f060005

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->mtwitter_button:Landroid/widget/Button;

    .line 68
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->mtwitter_button:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$5;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$5;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    const v0, 0x7f060006

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->Myt_Btn:Landroid/widget/Button;

    .line 78
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->Myt_Btn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$6;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$6;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    const/high16 v0, 0x7f06

    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/aboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->about_logoBtn:Landroid/widget/Button;

    .line 89
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity;->about_logoBtn:Landroid/widget/Button;

    new-instance v1, Lcom/SixClawWorm/application/aboutActivity$7;

    invoke-direct {v1, p0}, Lcom/SixClawWorm/application/aboutActivity$7;-><init>(Lcom/SixClawWorm/application/aboutActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    return-void
.end method
