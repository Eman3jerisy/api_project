import 'dart:convert';

import 'package:api_project/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as https;
class CRUD_API{
static String GetAllProduct =
      "http://emanjerisy2002-001-site1.ftempurl.com/api/Flutter/GetAll";
  static String create =
      "http://emanjerisy2002-001-site1.ftempurl.com/api/Flutter/Createproduct";
        static String edit =
      "http://emanjerisy2002-001-site1.ftempurl.com/api/Flutter/Editproduct";
            static String delete =
      "http://emanjerisy2002-001-site1.ftempurl.com/api/Flutter/Deleteproduct";
  
  //Get All =====================================================================
  static Future<List<products>> getAllProducts() async {
      try {
        final response = await https.get(Uri.parse(GetAllProduct));
        if (response.statusCode == 200) {
          return compute(parseUsersList, response.body);
        } else {
          throw Exception('Failed to load Userss');
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    static List<products> parseUsersList(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<products>((json) => products.fromJson(json)).toList();
    }

  //Create Product =====================================================================
static Future<bool> create_product(products Product) async {
    String price="${Product.price}";
    Uri path = Uri.parse(create+'?Name=${Product.name}&Price=${price}&Description=${Product.description}');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "charset": "utf-8",
    };

    https.Response res = await https.post(path, headers: headers);
    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception('Insert Failed, ${res.statusCode} # ${res.body} ');
    }
  }


  //Edit Product =====================================================================
static Future<bool> edit_product(products Product) async {
    String price="${Product.price}";
    String id=Product.id.toString();
    Uri path = Uri.parse(edit+'?id=${id}&Name=${Product.name}&Price=${price}&Description=${Product.description}');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "charset": "utf-8",
    };

    https.Response res = await https.post(path, headers: headers);
    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception('Insert Failed, ${res.statusCode} # ${res.body} ');
    }
  }
 //Delete Product =====================================================================
static Future<bool> Delete(String id) async {
    String Id=id as String;
    Uri path = Uri.parse(delete+'?id=${Id}');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "charset": "utf-8",
    };

    https.Response res = await https.post(path, headers: headers);
    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception('Insert Failed, ${res.statusCode} # ${res.body} ');
    }
  }
}