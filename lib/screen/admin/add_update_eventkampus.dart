import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/screen/admin/list_eventkampus.dart';
import 'package:project_kelas/widget/info.dart';

import '../../model/eventkampus.dart';

class AddUpdateEventkampus extends StatefulWidget {
  final Eventkampus? eventkampus;
  AddUpdateEventkampus({this.eventkampus});

  @override
  State<AddUpdateEventkampus> createState() => _AddUpdateEventkampusState();
}

class _AddUpdateEventkampusState extends State<AddUpdateEventkampus> {
  var _formKey = GlobalKey<FormState>();
  var _controllerKode = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerDeskripsi = TextEditingController();
  var _controllerTanggal = TextEditingController();

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.eventkampus != null) {
      _controllerKode.text = widget.eventkampus!.kodeEvent!;
      _controllerNama.text = widget.eventkampus!.namaEvent!;
      _controllerDeskripsi.text = widget.eventkampus!.deskripsiEvent!;
      _controllerTanggal.text = widget.eventkampus!.tanggal!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.eventkampus != null
            ? Text('Update Eventkampus')
            : Text('Tambah Eventkampus'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.eventkampus == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerKode,
                  decoration: InputDecoration(
                      labelText: "KODE",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerDeskripsi,
                  decoration: InputDecoration(
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerTanggal,
                  decoration: InputDecoration(
                      labelText: "Tanggal",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

 
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.eventkampus == null) {
                        String message = await EventDb.AddEventkampus(
                          _controllerKode.text,
                          _controllerNama.text,
                          _controllerDeskripsi.text,
                          _controllerTanggal.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerKode.clear();
                          _controllerNama.clear();
                          _controllerDeskripsi.clear();
                          _controllerTanggal.clear();
                          Get.off(
                            ListEventkampus(),
                          );
                        }
                      } else {
                        EventDb.UpdateEventkampus(
                          _controllerKode.text,
                          _controllerNama.text,
                          _controllerDeskripsi.text,
                          _controllerTanggal.text,
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.eventkampus == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
