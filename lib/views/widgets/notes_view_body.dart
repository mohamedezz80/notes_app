import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'custom_appbar.dart';
import 'custom_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    Key? key,
    required this.width,
    required this.hieght,
  }) : super(key: key);

  final double width;
  final double hieght;

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.width / 25,
        right: widget.width / 25,
        // top: hieght / 100,
      ),
      child: Column(
        children: [
          const CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
          ),
          SizedBox(
            height: widget.hieght / 50,
          ),
          Expanded(
            child: CustomListView(width: widget.width, hieght: widget.hieght),
          ),
        ],
      ),
    );
  }
}
