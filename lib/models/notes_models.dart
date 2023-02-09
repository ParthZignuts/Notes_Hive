import 'package:hive/hive.dart';
part 'notes_models.g.dart';

@HiveType(typeId: 0)
class NotesModels {
  @HiveField(0)
  String name;
  @HiveField(1)
  String dscription;

  NotesModels({required this.name, required this.dscription});
}
