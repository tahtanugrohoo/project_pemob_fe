import 'dart:convert';
import 'package:tanah_id/helpers/api.dart';
import 'package:tanah_id/helpers/api_url.dart';
import 'package:tanah_id/models/tanah.dart';

class TanahBloc {
  static Future<List<Tanah>> getTanahs() async {
    String apiUrl = ApiUrl.listTanah;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTanah = (jsonObj as Map<String, dynamic>)['data'];
    List<Tanah> tanahs = [];
    for (int i = 0; i < listTanah.length; i++) {
      tanahs.add(Tanah.fromJson(listTanah[i]));
    }
    return tanahs;
  }

  static Future addTanah({Tanah? tanah}) async {
    String apiUrl = ApiUrl.createTanah;
    var body = {
      "kode_tanah": tanah!.kodeTanah,
      "nama_tanah": tanah.namaTanah,
      "deskripsi_tanah": tanah.deskripsiTanah,
      "harga": tanah.hargaTanah.toString()
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future updateTanah({required Tanah tanah}) async {
    String apiUrl = ApiUrl.updateTanah(int.parse(tanah.id!));
    print(apiUrl);
    var body = {
      "kode_tanah": tanah.kodeTanah,
      "nama_tanah": tanah.namaTanah,
      "deskripsi_tanah": tanah.deskripsiTanah,
      "harga": tanah.hargaTanah.toString()
    };
    print("Body : $body");
    var response = await Api().put(apiUrl, jsonEncode(body));
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> deleteTanah({int? id}) async {
    String apiUrl = ApiUrl.deleteTanah(id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
