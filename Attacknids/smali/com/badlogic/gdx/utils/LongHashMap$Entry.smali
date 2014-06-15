.class Lcom/badlogic/gdx/utils/LongHashMap$Entry;
.super Ljava/lang/Object;
.source "LongHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/LongHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Entry"
.end annotation


# instance fields
.field final key:J

.field next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>(JLjava/lang/Object;Lcom/badlogic/gdx/utils/LongHashMap$Entry;)V
    .locals 0
    .parameter "k"
    .parameter "v"
    .parameter

    .prologue
    .line 138
    .local p4, n:Lcom/badlogic/gdx/utils/LongHashMap$Entry;,"Lcom/badlogic/gdx/utils/LongHashMap$Entry;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput-wide p1, p0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->key:J

    .line 140
    iput-object p3, p0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 141
    iput-object p4, p0, Lcom/badlogic/gdx/utils/LongHashMap$Entry;->next:Lcom/badlogic/gdx/utils/LongHashMap$Entry;

    .line 142
    return-void
.end method
