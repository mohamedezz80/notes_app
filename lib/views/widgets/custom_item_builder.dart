import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note.dart';
import '../../const/colors.dart';

class CustomItemBuilder extends StatelessWidget {
  const CustomItemBuilder({
    Key? key,
    required this.width,
    required this.hieght,
    required this.noteModel,
  }) : super(key: key);

  final double width;
  final double hieght;
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: width / 150,
        bottom: width / 150,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNote(
                  noteModel: noteModel,
                ),
              ));
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: hieght / 40,
            bottom: hieght / 35,
            left: hieght / 35,
            right: width / 30,
          ),
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  noteModel.title,
                  style: const TextStyle(
                    color: AppColor.kBlack,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: hieght / 80,
                  ),
                  child: Text(
                    noteModel.subTitle,
                    style: TextStyle(
                      color: AppColor.kBlack.withOpacity(.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Deleate'),
                          contentPadding: EdgeInsets.all(hieght / 40),
                          content: const Text(
                              'Do you really want to delete this note?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                noteModel.delete();
                                BlocProvider.of<NotesCubit>(context)
                                    .fetchAllNotes();
                                Navigator.pop(context);
                              },
                              child: const Text('Deleate'),
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
                    // noteModel.delete();
                    // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: AppColor.kBlack,
                    size: 24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: width / 45,
                  top: hieght / 75,
                ),
                child: Text(
                  noteModel.date,
                  style: TextStyle(
                    color: AppColor.kBlack.withOpacity(.4),
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
