.class Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;
.super Ljava/lang/Object;
.source "LongHashMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private loadNextEntry()Z
    .locals 3

    .prologue
    .line 186
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget v1, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->this$0:Lcom/badlogic/gdx/utils/LongHashMap;
    invoke-static {v1}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->access$0(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)Lcom/badlogic/gdx/utils/LongHashMap;

    move-result-object v1

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    invoke-static {v1}, Lcom/badlogic/gdx/utils/LongHashMap;->access$0(Lcom/badlogic/gdx/utils/LongHashMap;)[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    move-result-object v1

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 188
    const/4 v0, 0x0

    .line 195
    :goto_0
    return v0

    .line 190
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->this$0:Lcom/badlogic/gdx/utils/LongHashMap;
    invoke-static {v0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->access$0(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)Lcom/badlogic/gdx/utils/LongHashMap;

    move-result-object v0

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    invoke-static {v0}, Lcom/badlogic/gdx/utils/LongHashMap;->access$0(Lcom/badlogic/gdx/utils/LongHashMap;)[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->this$0:Lcom/badlogic/gdx/utils/LongHashMap;
    invoke-static {v1}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->access$0(Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;)Lcom/badlogic/gdx/utils/LongHashMap;

    move-result-object v1

    #getter for: Lcom/badlogic/gdx/utils/LongHashMap;->table:[Lcom/badlogic/gdx/utils/LongHashMap$Entry;
    invoke-static {v1}, Lcom/badlogic/gdx/utils/LongHashMap;->access$0(Lcom/badlogic/gdx/utils/LongHashMap;)[Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget v2, v2, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currIndex:I

    aget-object v1, v1, v2

    iput-object v1, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 195
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 163
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    if-nez v1, :cond_1

    .line 165
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->loadNextEntry()Z

    move-result v1

    if-nez v1, :cond_2

    .line 179
    :cond_0
    :goto_0
    return v0

    .line 170
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    if-nez v1, :cond_3

    .line 172
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->loadNextEntry()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 179
    :cond_2
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 176
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    goto :goto_1
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 203
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable$1;->this$1:Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$EntryIterable;->currEntry:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 209
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
