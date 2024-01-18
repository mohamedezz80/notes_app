part of 'add_note_cubit.dart';

@immutable
abstract class AddNotesStates {}

class AddNotesInitial extends AddNotesStates {}

class AddNotesLoading extends AddNotesStates {}

class AddNotesSuccess extends AddNotesStates {}

class AddNotesFailed extends AddNotesStates {
  final String errorMessage;

  AddNotesFailed(this.errorMessage);
}
