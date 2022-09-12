
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
  static final String veritabaniAdi = "todo.sqllite.db";

  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);
    if(await databaseExists(veritabaniYolu)){
      print("veritabanı zaten var");
    }else{
      //copy process
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi"); // bundle dan veri almak diye aratılabilir, veritabanından veriyi aldık byte a çevirdik
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);// byte a çevirmek için kullanılan func
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("veritabani kopyalandı");
    }
    return openDatabase(veritabaniYolu);
  }
}