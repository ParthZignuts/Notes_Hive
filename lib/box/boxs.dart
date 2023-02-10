import 'package:hive/hive.dart';
import 'package:hive_storage_2/models/notes_models.dart';

class Boxs {

  static Box<NotesModels> getData= Hive.box<NotesModels>('notes');
}