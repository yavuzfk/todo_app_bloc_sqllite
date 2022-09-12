
import 'package:todo_bloc_pattern_and_sqllite/entity/yapilacak_model.dart';
import 'package:todo_bloc_pattern_and_sqllite/sqlite/veritabani_yardimcisi.dart';

class YapilacakDaoRepository {

  Future<void> gorevKayit(String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", bilgiler); // kisiler tablosuna bilgiler'i kaydet
  }

  Future<void> gorevUpdate(int yapilacak_id, String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_id"] = yapilacak_id;
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.update("yapilacaklar", bilgiler,where: "yapilacak_id = ?",whereArgs: [yapilacak_id]); // id 5 gelirse soru işaretinin yerine yerleşicek
  }

  Future<List<Yapilacak>> yapilacaklariGetir() async {
    var db = await VeritabaniYardimcisi
        .veritabaniErisim(); // static old icin sınıf ismi ile erisebiliyoruz
    List<Map<String, dynamic>> maps =
    await db.rawQuery("SELECT * FROM yapilacaklar");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(
          yapilacak_id: satir["yapilacak_id"],
          yapilacak_is: satir["yapilacak_is"],
         );
    });
  }



  Future<List<Yapilacak>> gorevAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi
        .veritabaniErisim(); // static old icin sınıf ismi ile erisebiliyoruz
    List<Map<String, dynamic>> maps =
    await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacak(
        yapilacak_id: satir["yapilacak_id"],
        yapilacak_is: satir["yapilacak_is"],
      );
    });
  }

  Future<void> kisiSil(int yapilacak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar",where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);

  }
}