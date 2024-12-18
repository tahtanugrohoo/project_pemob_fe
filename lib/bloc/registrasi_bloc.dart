import 'dart:convert';
import 'package:tanah_id/helpers/api.dart';
import 'package:tanah_id/helpers/api_url.dart';
import 'package:tanah_id/models/resgistrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? username, String? email, String? alamat, String? password}) async {
    String apiUrl = ApiUrl.registrasi;
    var body = {"username": username, "email": email, "alamat": alamat, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
