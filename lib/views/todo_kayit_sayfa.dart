import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/cubit/todo_kayit_cubit.dart';
class TodoKayitSayfasi extends StatefulWidget {
  const TodoKayitSayfasi({Key? key}) : super(key: key);

  @override
  State<TodoKayitSayfasi> createState() => _TodoKayitSayfasiState();
}

class _TodoKayitSayfasiState extends State<TodoKayitSayfasi> {
  var tfTodoGorev = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Görev Oluştur"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTodoGorev,decoration: const InputDecoration(hintText: "Görev"),),
              ElevatedButton(onPressed: (){
                context.read<TodoKayitCubit>().kayit(tfTodoGorev.text,);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
