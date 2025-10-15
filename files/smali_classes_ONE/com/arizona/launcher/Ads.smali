.class public Lcom/arizona/launcher/Ads;
.super Ljava/lang/Object;
.source "Ads.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arizona/launcher/Ads$UnityAdsListener;
    }
.end annotation


# static fields
.field public static placementVideo:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-string v0, "Interstitial_Android"

    sput-object v0, Lcom/arizona/launcher/Ads;->placementVideo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initializeAds(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 55
    new-instance v0, Lcom/arizona/launcher/Ads$UnityAdsListener;

    invoke-direct {v0, p1}, Lcom/arizona/launcher/Ads$UnityAdsListener;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "UnityAdsListener":Lcom/arizona/launcher/Ads$UnityAdsListener;
    invoke-static {v0}, Lcom/unity3d/ads/UnityAds;->addListener(Lcom/unity3d/ads/IUnityAdsListener;)V

    .line 57
    const-string v1, "4595401"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/unity3d/ads/UnityAds;->initialize(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 58
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/arizona/launcher/Ads$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/arizona/launcher/Ads$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 69
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 70
    return-void
.end method

.method static synthetic lambda$initializeAds$0(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 67
    sget-object v0, Lcom/arizona/launcher/Ads;->placementVideo:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/unity3d/ads/UnityAds;->show(Landroid/app/Activity;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method static synthetic lambda$initializeAds$1(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .line 59
    nop

    :goto_0
    sget-object v0, Lcom/arizona/launcher/Ads;->placementVideo:Ljava/lang/String;

    invoke-static {v0}, Lcom/unity3d/ads/UnityAds;->isReady(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :goto_1
    goto :goto_0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "MtgTools"

    const-string v2, "Error ads: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "e":Ljava/lang/InterruptedException;
    goto :goto_1

    .line 66
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/Ads$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/arizona/launcher/Ads$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 69
    return-void
.end method
