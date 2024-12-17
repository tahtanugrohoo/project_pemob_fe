class ApiUrl {
  static const String baseUrl = 'http://localhost:8080/toko-api/public';
  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listTanah = baseUrl + '/tanah';
  static const String createTanah = baseUrl + '/tanah';
  static String updateTanah(int id) {
    return baseUrl + '/tanah/' + id.toString();
  }

  static String showTanah(int id) {
    return baseUrl + '/tanah/' + id.toString();
  }

  static String deleteTanah(int id) {
    return baseUrl + '/tanah/' + id.toString();
  }
}
