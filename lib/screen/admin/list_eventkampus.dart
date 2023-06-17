import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/eventkampus.dart';
import 'package:project_kelas/screen/admin/add_update_eventkampus.dart';
// import 'package:project_kelas/screen/admin/add_update_eventkampus.dart';

import '../../model/eventkampus.dart';

class ListEventkampus extends StatefulWidget {
  @override
  State<ListEventkampus> createState() => _ListEventkampusState();
}

class _ListEventkampusState extends State<ListEventkampus> {
  List<Eventkampus> _listEventkampus = [];

  void getEventkampus() async {
    _listEventkampus = await EventDb.getEventkampus();

    setState(() {});
  }

  @override
  void initState() {
    getEventkampus();
    super.initState();
  }

  void showOption(Eventkampus? eventkampus) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
        Get.to(AddUpdateEventkampus(eventkampus: eventkampus))
            ?.then((value) => getEventkampus());
        break;
      case 'delete':
        EventDb.deleteEventkampus(eventkampus!.kodeEvent!)
            .then((value) => getEventkampus());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 0,
        title: Text('List Eventkampus'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listEventkampus.length > 0
              ? ListView.builder(
                  itemCount: _listEventkampus.length,
                  itemBuilder: (context, index) {
                    Eventkampus eventkampus = _listEventkampus[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(eventkampus.namaEvent ?? ''),
                      subtitle: Text(eventkampus.kodeEvent ?? ''),
                      trailing: IconButton(
                          onPressed: () => showOption(eventkampus),
                          icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () =>
                  Get.to(AddUpdateEventkampus())?.then((value) => getEventkampus()),
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          )
        ],
      ),
    );
  }
}
