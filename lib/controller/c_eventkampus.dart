import 'package:get/get.dart';
import 'package:project_kelas/model/eventkampus.dart';

class CEvent extends GetxController {
  Rx<Eventkampus> _event = Eventkampus().obs;

  Eventkampus get user => _event.value;

  void setEvent(Eventkampus dataEvent) => _event.value = dataEvent;
}
