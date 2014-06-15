.class public Lcom/SixClawWorm/application/MeetingApplication;
.super Landroid/app/Application;
.source "MeetingApplication.java"


# static fields
.field public static VERSION:Ljava/lang/String;

.field private static instance:Lcom/SixClawWorm/application/MeetingApplication;


# instance fields
.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const-string v0, "1.0"

    sput-object v0, Lcom/SixClawWorm/application/MeetingApplication;->VERSION:Ljava/lang/String;

    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 9
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/MeetingApplication;->mList:Ljava/util/List;

    .line 22
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/SixClawWorm/application/MeetingApplication;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lcom/SixClawWorm/application/MeetingApplication;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/SixClawWorm/application/MeetingApplication;->instance:Lcom/SixClawWorm/application/MeetingApplication;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/SixClawWorm/application/MeetingApplication;

    invoke-direct {v0}, Lcom/SixClawWorm/application/MeetingApplication;-><init>()V

    sput-object v0, Lcom/SixClawWorm/application/MeetingApplication;->instance:Lcom/SixClawWorm/application/MeetingApplication;

    .line 27
    :cond_0
    sget-object v0, Lcom/SixClawWorm/application/MeetingApplication;->instance:Lcom/SixClawWorm/application/MeetingApplication;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addActivity(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/SixClawWorm/application/MeetingApplication;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    return-void
.end method

.method public exit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 37
    :try_start_0
    iget-object v2, p0, Lcom/SixClawWorm/application/MeetingApplication;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_1

    .line 44
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    .line 46
    :goto_1
    return-void

    .line 37
    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 38
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 41
    .end local v0           #activity:Landroid/app/Activity;
    :catch_0
    move-exception v1

    .line 42
    .local v1, e:Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    goto :goto_1

    .line 43
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 44
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    .line 45
    throw v2
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 12
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 13
    sput-object p0, Lcom/SixClawWorm/application/MeetingApplication;->instance:Lcom/SixClawWorm/application/MeetingApplication;

    .line 16
    return-void
.end method

.method public onExit()V
    .locals 0

    .prologue
    .line 21
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .prologue
    .line 50
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 51
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 52
    return-void
.end method
