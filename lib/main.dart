import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_pattern_and_sqllite/cubit/anasayfa_cubit.dart';
import 'package:todo_bloc_pattern_and_sqllite/cubit/todo_guncelle_cubit.dart';
import 'package:todo_bloc_pattern_and_sqllite/views/anasayfa.dart';

import 'cubit/todo_kayit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoKayitCubit()),
        BlocProvider(create: (context) => TodoGuncelleCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
