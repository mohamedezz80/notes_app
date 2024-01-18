import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/const/colors.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_color.dart';
import 'widgets/custom_appbar.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: width / 25,
            right: width / 25,
          ),
          child: Column(
            children: [
              CustomAppBarEdit(
                iconBack: Icons.arrow_back,
                onPressedBack: () {
                  Navigator.pop(context);
                },
                text: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Deleate'),
                        contentPadding: EdgeInsets.all(hieght / 40),
                        content:
                            const Text('Do you really want to Edit this note?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              widget.noteModel.title =
                                  title ?? widget.noteModel.title;
                              widget.noteModel.subTitle =
                                  title ?? widget.noteModel.subTitle;
                              widget.noteModel.save();
                              BlocProvider.of<NotesCubit>(context)
                                  .fetchAllNotes();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Notes(),
                                  ));
                            },
                            child: const Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                  // widget.noteModel.title = title ?? widget.noteModel.title;
                  // widget.noteModel.subTitle =
                  //     title ?? widget.noteModel.subTitle;
                  // widget.noteModel.save();
                  // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  // Navigator.pop(context);
                },
              ),
              SizedBox(
                height: hieght / 30,
              ),
              CustomTextFormField(
                hintText: widget.noteModel.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(
                height: hieght / 50,
              ),
              CustomTextFormField(
                hintText: widget.noteModel.subTitle,
                maxLine: 5,
                onChanged: (value) {
                  subTitle = value;
                },
              ),
              SizedBox(
                height: hieght / 40,
              ),
              EditNoteColor(
                noteModel: widget.noteModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
