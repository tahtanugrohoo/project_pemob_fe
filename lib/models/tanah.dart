class Tanah {
  String? id;
  String? kodeTanah;
  String? namaTanah;
  String? deskripsiTanah;
  int? hargaTanah;
  Tanah({this.id, this.kodeTanah, this.namaTanah, this.deskripsiTanah, this.hargaTanah});
  factory Tanah.fromJson(Map<String, dynamic> obj) {
    return Tanah(
      id: obj['id'],
      kodeTanah: obj['kode_tanah'],
      namaTanah: obj['nama_tanah'],
      deskripsiTanah: obj['deskripsi_tanah'],
      // hargaTanah: obj['harga']);
      hargaTanah: int.tryParse(obj['harga'].toString()) ?? 0,
    );
  }
}