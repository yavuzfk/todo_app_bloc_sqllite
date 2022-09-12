import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/repo/yapilacak_dao_repo.dart';


class TodoKayitCubit extends Cubit<void> { // kaydederken veri göndermyeceğim için türü void
  TodoKayitCubit():super(0);

  var gorevRepo = YapilacakDaoRepository();

  Future<void> kayit(String yapilacak_is) async {
    await gorevRepo.gorevKayit(yapilacak_is);
  }
}