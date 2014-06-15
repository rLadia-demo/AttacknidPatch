.class Lorg/anddev/andengine/util/BetaUtils$1;
.super Ljava/lang/Object;
.source "BetaUtils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/util/BetaUtils;->finishWhenExpired(Landroid/app/Activity;Ljava/util/GregorianCalendar;IILandroid/content/Intent;Landroid/content/Intent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$pActivity:Landroid/app/Activity;

.field private final synthetic val$pOkIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Landroid/content/Intent;Landroid/app/Activity;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pOkIntent:Landroid/content/Intent;

    iput-object p2, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pActivity:Landroid/app/Activity;

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "pDialog"
    .parameter "pWhich"

    .prologue
    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pOkIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pActivity:Landroid/app/Activity;

    iget-object v1, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pOkIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 74
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/util/BetaUtils$1;->val$pActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 75
    return-void
.end method
