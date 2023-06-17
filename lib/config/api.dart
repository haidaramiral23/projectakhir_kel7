class Api {
  static const _host = "http://192.168.1.106/api_kelas-main";

  static String _user = "$_host/user";
  static String _mahasiswa = "$_host/mahasiswa";
  static String _dosen = "$_host/dosen";
  static String _event = "$_host/event";

  static String login = "$_host/login.php";

  // user
  static String addUser = "$_user/add_user.php";
  static String deleteUser = "$_user/delete_user.php";
  static String getUsers = "$_user/get_users.php";
  static String updateUser = "$_user/update_user.php";

  // mahasiswa
  static String addMahasiswa = "$_mahasiswa/add_mahasiswa.php";
  static String deleteMahasiswa = "$_mahasiswa/delete_mahasiswa.php";
  static String getMahasiswa = "$_mahasiswa/get_mahasiswa.php";
  static String updateMahasiswa = "$_mahasiswa/update_mahasiswa.php";

    // dosen
  static String addDosen = "$_dosen/add_dosen.php";
  static String deleteDosen = "$_dosen/delete_dosen.php";
  static String getDosen = "$_dosen/get_dosen.php";
  static String updateDosen = "$_dosen/update_dosen.php";

      // event
  static String AddEvent = "$_event/add_event.php";
  static String deleteEvent = "$_event/delete_event.php";
  static String getEvent = "$_event/get_event.php";
  static String updateEvent = "$_event/update_event.php";
}
