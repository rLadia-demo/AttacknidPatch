.class Lorg/helllabs/android/xmp/ModInfo;
.super Ljava/lang/Object;
.source "ModInfo.java"


# instance fields
.field bpm:I

.field chn:I

.field filename:Ljava/lang/String;

.field ins:I

.field len:I

.field name:Ljava/lang/String;

.field pat:I

.field smp:I

.field time:I

.field tpo:I

.field trk:I

.field type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIIIIII)V
    .locals 0
    .parameter "_name"
    .parameter "_type"
    .parameter "_filename"
    .parameter "_chn"
    .parameter "_pat"
    .parameter "_ins"
    .parameter "_trk"
    .parameter "_smp"
    .parameter "_len"
    .parameter "_bpm"
    .parameter "_tpo"
    .parameter "_time"

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lorg/helllabs/android/xmp/ModInfo;->name:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lorg/helllabs/android/xmp/ModInfo;->type:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lorg/helllabs/android/xmp/ModInfo;->filename:Ljava/lang/String;

    .line 24
    iput p4, p0, Lorg/helllabs/android/xmp/ModInfo;->chn:I

    .line 25
    iput p5, p0, Lorg/helllabs/android/xmp/ModInfo;->pat:I

    .line 26
    iput p6, p0, Lorg/helllabs/android/xmp/ModInfo;->ins:I

    .line 27
    iput p7, p0, Lorg/helllabs/android/xmp/ModInfo;->trk:I

    .line 28
    iput p8, p0, Lorg/helllabs/android/xmp/ModInfo;->smp:I

    .line 29
    iput p9, p0, Lorg/helllabs/android/xmp/ModInfo;->len:I

    .line 30
    iput p10, p0, Lorg/helllabs/android/xmp/ModInfo;->bpm:I

    .line 31
    iput p11, p0, Lorg/helllabs/android/xmp/ModInfo;->tpo:I

    .line 32
    iput p12, p0, Lorg/helllabs/android/xmp/ModInfo;->time:I

    .line 33
    return-void
.end method
