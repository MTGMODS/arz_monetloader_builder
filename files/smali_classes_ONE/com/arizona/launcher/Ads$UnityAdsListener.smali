.class Lcom/arizona/launcher/Ads$UnityAdsListener;
.super Ljava/lang/Object;
.source "Ads.java"

# interfaces
.implements Lcom/unity3d/ads/IUnityAdsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arizona/launcher/Ads;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnityAdsListener"
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/arizona/launcher/Ads$UnityAdsListener;->context:Landroid/content/Context;

    .line 26
    return-void
.end method


# virtual methods
.method public onUnityAdsError(Lcom/unity3d/ads/UnityAds$UnityAdsError;Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Lcom/unity3d/ads/UnityAds$UnityAdsError;
    .param p2, "message"    # Ljava/lang/String;

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onUnityAdsError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MtgTools"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    return-void
.end method

.method public onUnityAdsFinish(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$FinishState;)V
    .locals 3
    .param p1, "placementVideo"    # Ljava/lang/String;
    .param p2, "finishState"    # Lcom/unity3d/ads/UnityAds$FinishState;

    .line 37
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->COMPLETED:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/arizona/launcher/Ads$UnityAdsListener;->context:Landroid/content/Context;

    const-string v1, "[MTG MODS]\n\u2764\ufe0f \u0421\u043f\u0430\u0441\u0438\u0431\u043e \u0437\u0430 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u2764\ufe0f"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 39
    :cond_0
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->SKIPPED:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 40
    iget-object v0, p0, Lcom/arizona/launcher/Ads$UnityAdsListener;->context:Landroid/content/Context;

    const-string v1, "[MTG MODS]\n\ud83d\ude2d \u0412\u044b \u043f\u0440\u043e\u043f\u0443\u0441\u0442\u0438\u043b\u0438 \ud83d\ude2d\ufe0f"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 41
    :cond_1
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->ERROR:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    .line 44
    :goto_0
    return-void
.end method

.method public onUnityAdsReady(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementVideo"    # Ljava/lang/String;

    .line 30
    return-void
.end method

.method public onUnityAdsStart(Ljava/lang/String;)V
    .locals 3
    .param p1, "placementVideo"    # Ljava/lang/String;

    .line 33
    iget-object v0, p0, Lcom/arizona/launcher/Ads$UnityAdsListener;->context:Landroid/content/Context;

    const-string v1, "[MTG MODS]\n\u2139\ufe0f\ufe0f VIP \u0443\u0431\u0438\u0440\u0430\u0435\u0442 \u0440\u0435\u043a\u043b\u0430\u043c\u0443 \u2139\ufe0f"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 34
    return-void
.end method
