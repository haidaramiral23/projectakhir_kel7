import 'package:get/get.dart';
import 'package:project_kelas/model/dosen.dart';

class CDosen extends GetxController {
  Rx<Dosen> _dosen = Dosen().obs;

  Dosen get user => _dosen.value;

  void setDosen(Dosen dataDosen) => _dosen.value = dataDosen;
}
