import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_sqflite/app/routes/app_pages.dart';

import '../../../data/models/notes_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL NOTES'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.red[900],
              ));
            }
            return Obx(
              () => (controller.allNote.length == 0)
                  ? Center(
                      child: Text("Tidak Ada Data"),
                    )
                  : ListView.builder(
                      itemCount: controller.allNote.length,
                      itemBuilder: (context, index) {
                        Notes note = controller.allNote[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text("${note.id}"),
                          ),
                          title: Text(" ${note.title}"),
                          subtitle: Text("${note.desc}"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        );
                      }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
