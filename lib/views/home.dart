import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/const/colors.dart';
import 'package:notes_app/views/widgets/custom_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);
  static String id = 'notes';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff312F31),
        // systemNavigationBarColor: Colors.black,
        // systemNavigationBarDividerColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.light,
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: NotesViewBody(width: width, hieght: hieght),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              builder: (context) {
                return AddBottomSheet(
                  height: hieght,
                  width: width,
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
