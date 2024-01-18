import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'custom_item_builder.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.width,
    required this.hieght,
  }) : super(key: key);

  final double width;
  final double hieght;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
          itemCount: notes.length,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return CustomItemBuilder(
              noteModel: notes[index],
              width: width,
              hieght: hieght,
            );
          },
        );
      },
    );
  }
}
