import 'package:todo_bloc_pattern_and_sqllite/entity/yapilacak_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/repo/yapilacak_dao_repo.dart';

class AnasayfaCubit extends Cubit<List<Yapilacak>> {
  AnasayfaCubit():super(<Yapilacak>[]); // boş liste gönderdik

  var gorevRepo = YapilacakDaoRepository();

  Future<void> gorevleriYukle() async {
    var liste = await gorevRepo.yapilacaklariGetir();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await gorevRepo.gorevAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await gorevRepo.kisiSil(yapilacak_id);
    await gorevleriYukle();
  }
}