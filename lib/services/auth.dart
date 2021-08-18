import 'package:approver/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  static User? _user;
  String? _token;

  final storage = new FlutterSecureStorage();

  bool get authenticated => _isLoggedIn;
  User? get user => _user;
  void setCurrentUser(User user) {
    _user = user;
    notifyListeners();
  }

  void login({FormData? creds}) async {
    //print(creds);
    String baseUrl = 'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
    Dio dio = new Dio();

    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    try {
      var response = await dio.post(baseUrl + '/login', data: creds);
      Map<String, dynamic> responseData = response.data;
      print(responseData);
      print('response print :' + responseData['token']['token'].toString());
      String token = responseData['token']['token'].toString();
      this.tryToken(token: token);
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void tryToken({String? token}) async {
    Dio dio = new Dio();
    if (token == null) {
      return;
    } else {
      try {
        dio.options.headers = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
        String baseUrl =
            'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
        Response response = await dio.get(baseUrl + '/profile');
        this._isLoggedIn = true;
        //this._user = User.fromJson(response.data['user']);
        setCurrentUser(User.fromJson(response.data['user']));
        this._token = token;
        this.storeToken(token: token);
        notifyListeners();
        print(user!.name);
      } catch (e) {
        print(e);
      }
    }
  }

  void storeToken({String? token}) async {
    this.storage.write(key: 'token', value: token);
    print(_token);
  }

  void logout() async {
    Dio dio = new Dio();
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      };
      String baseUrl =
          'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
      Response response = await dio.get(baseUrl + '/logout');
      cleanUp();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void cleanUp() async {
    Auth._user = null;
    this._isLoggedIn = false;
    this._token = null;
    await storage.delete(key: 'token');
  }

  void changePass({FormData? creds}) async {
    Dio dio = new Dio();
    dio.options.headers = {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    };
    String baseUrl = 'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';

    var response = await dio.post(baseUrl + '/change-password', data: creds);
    notifyListeners();
  }
}
