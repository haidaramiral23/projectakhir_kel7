class Eventkampus {
  String? kodeEvent;
  String? namaEvent;
  String? deskripsiEvent;
  String? tanggal;

  Eventkampus({
    this.kodeEvent,
    this.namaEvent,
    this.deskripsiEvent,
    this.tanggal,
  });

  factory Eventkampus.fromJson(Map<String, dynamic> json) => Eventkampus(
        kodeEvent: json['kodeEvent'],
        namaEvent: json['namaEvent'],
        deskripsiEvent: json['deskripsiEvent'],
        tanggal: json['tanggal'],
      );
  Map<String, dynamic> toJson() => {
        'kodeEvent': this.kodeEvent,
        'namaEvent': this.namaEvent,
        'deskripsiEvent': this.deskripsiEvent,
        'tanggal': this.tanggal,
      };
}
