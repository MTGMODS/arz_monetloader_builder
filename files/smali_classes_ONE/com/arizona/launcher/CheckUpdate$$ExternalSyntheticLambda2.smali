.class public final synthetic Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/arizona/launcher/CheckUpdate$$ExternalSyntheticLambda2;->f$1:Landroid/content/Context;

    invoke-static {v0, v1, p1, p2}, Lcom/arizona/launcher/CheckUpdate;->lambda$isNeedUpdate$2(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
