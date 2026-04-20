.class public Lcom/ghost/MainActivity;
.super Landroid/app/Activity;

# Конструктор (қолданба бұзылмауы үшін міндетті)
.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    # Жаңа WebView құру
    new-instance v0, Landroid/webkit/WebView;
    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    
    # WebView баптауларын алу
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v1
    
    # JavaScript-ті іске қосу (Мәзір жұмыс істеуі үшін маңызды)
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    
    # Фонды мөлдір қылу
    const/4 v2, 0x0
    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V
    
    # WebView ішіндегі сілтемелер сыртқы браузерге кетіп қалмауы үшін клиент орнату
    new-instance v1, Landroid/webkit/WebViewClient;
    invoke-direct {v1}, Landroid/webkit/WebViewClient;-><init>()V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
    
    # HTML файлды жүктеу
    const-string v1, "file:///android_asset/www/index.html"
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    
    # Экранға шығару
    invoke-virtual {p0, v0}, Lcom/ghost/MainActivity;->setContentView(Landroid/view/View;)V
    
    return-void
.end method
