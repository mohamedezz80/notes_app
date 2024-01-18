import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../../const/colors.dart';
import 'colors_item.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;
  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kNotesColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNotesColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.noteModel.color = kNotesColors[index].value;
                setState(() {});
              },
              child: ColorsItem(
                isActive: currentIndex == index,
                color: kNotesColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
