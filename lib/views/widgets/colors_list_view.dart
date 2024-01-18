import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/const/colors.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/colors_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
                BlocProvider.of<AddNotesCubit>(context).color =
                    kNotesColors[index];
                currentIndex = index;
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
