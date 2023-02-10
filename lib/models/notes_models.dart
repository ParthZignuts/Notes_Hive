import 'package:hive/hive.dart';
part 'notes_models.g.dart';

@HiveType(typeId: 0)
class NotesModels extends HiveObject {
  @HiveField(0)
  String heading;
  @HiveField(1)
  String dscription;

  NotesModels({required this.heading, required this.dscription});
}
