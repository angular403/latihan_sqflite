import 'package:get/get.dart';
import 'package:latihan_sqflite/app/data/db/db_manager.dart';
import '../../../data/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  RxList allNote = <Notes>[].obs;
  DatabaseManager database = DatabaseManager.instance;
  Future<void> getAllNotes() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query('notes');
    if (data.isNotEmpty) {
      allNote(Notes.fromJsonList(data));
      allNote.refresh();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllNotes();
    super.onInit();
  }
}
