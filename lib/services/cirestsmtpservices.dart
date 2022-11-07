part of 'services.dart';

class Cirestsmtpservices {

  static Future<http.Response> sendMail(String email){
    return http.post(Uri.https(Const.smtpUrl, "/cirestapi/api/mahasiswa/sendmail"),
      headers: <String, String> {
        'content-type' : 'application/json; charset=utf-8',
        'AFL-API-KEY'  : 'AFL-CloudComp-MahadiRafi'
      },
      body: jsonEncode(<String, dynamic>{
        'email' : email
      })
    );
  }

}