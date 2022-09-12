
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/repo/yapilacak_dao_repo.dart';

class TodoGuncelleCubit extends Cubit<void> {
  TodoGuncelleCubit():super(0);

  var gorevlerRepo = YapilacakDaoRepository();

  Future<void> guncelle(int yapilacak_id,String yapilacak_is) async {
    await gorevlerRepo.gorevUpdate(yapilacak_id, yapilacak_is);
  }
}