.class public final synthetic Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/arizona/launcher/MtgTools$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    invoke-static {v0, v1, p1, p2}, Lcom/arizona/launcher/MtgTools;->lambda$showVipDialog$6(Landroid/widget/EditText;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
