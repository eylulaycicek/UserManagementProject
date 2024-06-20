**Proje Adı** :
SOUNDERY

**Proje Tanımı** :
Bu proje, kullanıcı yönetimi ve görüntüleme işlevlerine sahip iki sayfalık, responsive bir web uygulamasıdır. Uygulama, kullanıcının detaylı bilgilerini ve albümlerini görüntülemeyi sağlar. Ayrıca kullanıcı arama ve düzenleme işlevlerine de sahiptir.

**Uygulama Akış Senaryosu** :
Uygulama iki ana sayfadan oluşmaktadır:
_ UsersPage (Ana Sayfa) _
_EditPage (Düzenleme Sayfası) _


**Uygulama İşlevleri** :
- Kullanıcı oluşturma
- Kullanıcıların listelenmesi
- Kullanıcı detaylarının görüntülenmesi
- Kullanıcıya ait albümlerin listelenmesi
- Kullanıcı arama

**UsersPage (Ana Sayfa)** :
UsersPage, kullanıcıların listelendiği ve arama yapıldığı ana sayfadır.

_Kullanıcı Verileri: Kullanıcılar, JSONPlaceholder API'sinden HTTP request ile alınır.
Kullanıcı Ara: "Kullanıcı Ara" alanına girilen karakterlere göre kullanıcılar username alanına göre filtrelenir. Arama sonucunda bir kullanıcı bulunamazsa "Kullanıcı Bulunamadı!" mesajı gösterilir.
Arama Sonuçlarının Temizlenmesi: "Kullanıcı Ara" alanına girilen karakterler tamamen silindiğinde tüm kullanıcılar yeniden listelenir. Kullanıcıların karakterleri tamamen silmesini sağlayan bir buton eklenmiştir.
Kullanıcı Resimleri: Kullanıcı resimleri, kullanıcının id alanına göre Picsum Photos adresinden çekilir. (Örnek: 5 numaralı id’ye sahip kullanıcının fotoğrafı için https://picsum.photos/id/5/info adresine istek yapılır.)
Kullanıcı Detayları ve Albümler: Kullanıcı listesindeki bir kullanıcıya tıklandığında, kullanıcının detayları ve albümleri gösterilir. Albümler, JSONPlaceholder API'sinden alınır ve detay bilgileri JSONPlaceholder Photos adresinde bulunur._


**EditPage (Düzenleme Sayfası)** :
_Kullanıcı düzenleme bölümü, seçili kullanıcının bilgilerini güncelleyebileceği bir sayfadır._
