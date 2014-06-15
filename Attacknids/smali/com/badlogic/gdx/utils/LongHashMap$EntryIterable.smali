.class Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;
.super Ljava/lang/Object;
.source "LongHashMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/LongHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EntryIterable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

.field currIndex:I

.field iter:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/badlogic/gdx/utils/LongHashMap;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/LongHashMap;)V
    .locals 1
    .parameter

    .prologue
    .line 153
    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->this$0:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    const/4 v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    .line 156
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 158
    new-instance v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;-><init>(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->iter:Ljava/util/Iterator;

    return-void
.end method

.method static synthetic access$0(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)Lcom/badlogic/gdx/utils/LongHashMap;
    .locals 1
    .parameter

    .prologue
    .line 153
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->this$0:Lcom/badlogic/gdx/utils/LongHashMap;

    return-object v0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 223
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->iter:Ljava/util/Iterator;

    return-object v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 216
    const/4 v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    .line 217
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 218
    return-void
.end method
