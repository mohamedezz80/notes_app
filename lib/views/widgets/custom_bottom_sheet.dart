import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_snack_bar.dart';
import 'custom_add_note_form.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesStates>(
        listener: (context, state) {
          if (state is AddNotesFailed) {}

          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            showSnackBar(
              context,
              'Success for add your note',
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                right: width / 35,
                left: width / 35,
                top: height / 35,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: CustomAddNoteForm(
                  height: height,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
