import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomAddNoteForm extends StatefulWidget {
  const CustomAddNoteForm({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  State<CustomAddNoteForm> createState() => _CustomAddNoteFormState();
}

class _CustomAddNoteFormState extends State<CustomAddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: widget.height / 70,
          ),
          CustomTextFormField(
            hintText: 'Content',
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(
            height: widget.height / 30,
          ),
          const ColorsListView(),
          SizedBox(
            height: widget.height / 30,
          ),
          BlocBuilder<AddNotesCubit, AddNotesStates>(
            builder: (context, state) {
              return CustomButton(
                text: 'Add',
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd-mm-yyyy').format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: widget.height / 35,
          ),
        ],
      ),
    );
  }
}
