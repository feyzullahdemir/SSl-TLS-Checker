# SSl-TLS-Checker


Dosyaya Çalıştırılabilir İzin Verme:

Scripti çalıştırmadan önce, dosyaya çalıştırma izni vermeniz gerekir.

Aşağıdaki komutla dosyanıza çalıştırma izni verin:
```javascript
chmod +x checker.sh
```
1. Scripti Çalıştırmak:

Dosyayı çalıştırmak için aşağıdaki komutu kullanabilirsiniz:
```javascript
./checker.sh
```

Eğer dosya başka bir dizindeyse, dosyanın tam yolunu kullanarak çalıştırabilirsiniz:
```javascript
/path/to/checker.sh
```
2. Çıktıyı Görme:

Çalıştırdığınızda, script belirtilen IP adresleri için SSL ve TLS durumlarını kontrol edip sonuçları terminalde görüntüleyecektir.

Eğer herhangi bir hata alırsanız veya komut çalışmazsa, chmod +x komutunun doğru çalışıp çalışmadığını veya dosyanın doğru dizinde olduğunu kontrol edebilirsiniz.

Örnek Çıktı : 
```javascript
1.1.1.1 → SSL mevcut (Evet), Issuer: Some Issuer, TLS Versiyonu: TLSv1.2
8.8.8.8 → SSL mevcut (Evet), Issuer: Some Issuer, TLS Versiyonu: TLSv1.3
192.168.1.10 → SSL yok (Hayır), TLS versiyonu tespit edilemedi.
...

