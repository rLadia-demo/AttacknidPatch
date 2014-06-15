.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXParseException;
.super Lorg/xml/sax/SAXException;
.source "TMXParseException.java"


# static fields
.field private static final serialVersionUID:J = 0x1eb994cbf1f49d54L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/xml/sax/SAXException;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 0
    .parameter "pException"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "pDetailMessage"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0
    .parameter "pMessage"
    .parameter "pException"

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 38
    return-void
.end method
