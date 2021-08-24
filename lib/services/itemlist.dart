import 'package:approver/models/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ItemList extends ChangeNotifier {
  static List<DataList> _datalist = [];
  static List<ItemDetail> _itemdetail = [];
  final storage = new FlutterSecureStorage();

  List<DataList> get datalist => _datalist;
  List<ItemDetail> get itemdetail => _itemdetail;

  void setData(List<DataList> data) {
    _datalist = data;

    notifyListeners();
  }

  void setItemDetail(List<ItemDetail> item) {
    _itemdetail = item;
    print('detail1' + itemdetail.toString());
    notifyListeners();
  }

  Future<void> itemList() async {
    String baseUrl = 'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
    Dio dio = new Dio();

    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response = await dio.get(baseUrl + '/pending-item');
    Map<String, dynamic> responseData = response.data;
    List<DataList> _maindata = [];
    List<ItemDetail> _data = [];
    print(responseData);
    for (int i = 0; i < response.data['data'].length; i++) {
      _data.add(ItemDetail.fromJson(response.data['data'][i]));
    }
    setItemDetail(_data);
    // setItemDetail(ItemDetail.fromJson(response.data['data']));
    _maindata.add(DataList.fromJson(response.data));
    setData(_maindata);

    //setItemDetail(ItemDetail.fromJson(response.data['data']));
    print('data' + datalist.toString());
    print('detail' + itemdetail.toString());
    print('length: ' + itemdetail.length.toString());
  }
}

// var extractedData = responseData[response.data]['data'];
// if (extractedData > 0) {
//   for (int i = 0; i < extractedData.length; i++) {
//     setItemDetail(ItemDetail.fromJson(extractedData[i]));
//   }
// }
