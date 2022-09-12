import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/cubit/todo_guncelle_cubit.dart';
import 'package:todo_bloc_pattern_and_sqllite/entity/yapilacak_model.dart';

class TodoUpdateSayfa extends StatefulWidget {

  Yapilacak gorev;
  TodoUpdateSayfa({required this.gorev});

  @override
  State<TodoUpdateSayfa> createState() => _TodoUpdateSayfaState();
}

class _TodoUpdateSayfaState extends State<TodoUpdateSayfa> {
  var tfTodoGorev = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var gorev = widget.gorev;
    tfTodoGorev.text=gorev.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gorev Guncelle"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTodoGorev,decoration: const InputDecoration(hintText: "Gorev"),),
              ElevatedButton(onPressed: (){
                context.read<TodoGuncelleCubit>().guncelle(widget.gorev.yapilacak_id, widget.gorev.yapilacak_is,);
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),
      ),
    );
  }
}
