import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/cubit/anasayfa_cubit.dart';
import 'package:todo_bloc_pattern_and_sqllite/entity/yapilacak_model.dart';
import 'package:todo_bloc_pattern_and_sqllite/views/todo_kayit_sayfa.dart';
import 'package:todo_bloc_pattern_and_sqllite/views/todo_update_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().gorevleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : const Text("Gorevler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().gorevleriYukle();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yapilacak>>(
        builder: (context, gorevlerListesi) {
          if (gorevlerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: gorevlerListesi.length,
              itemBuilder: (context, indeks) {
                var gorev = gorevlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TodoUpdateSayfa(gorev: gorev))).then((value) {
                      context.read<AnasayfaCubit>().gorevleriYukle();
                    });
                  }, // sayfaya dönünce şunu yap demek için bu alanı kullanıyoruz

                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(gorev.yapilacak_is),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("${gorev.yapilacak_is} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context
                                          .read<AnasayfaCubit>()
                                          .sil(gorev.yapilacak_id);
                                    },
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoKayitSayfasi())).then((value) {
            context.read<AnasayfaCubit>().gorevleriYukle();
          });
        },
      ),
    );
  }
}
