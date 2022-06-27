import 'package:api_project/models/product.dart';
import 'package:flutter/foundation.dart';

class User extends ChangeNotifier{
  //Add
final List<products>_usersAdd=[];
List<products> get UsersAdd=>_usersAdd;
  //Edit

  final List<products>_usersEdit=[];
List<products> get usersEdit=>_usersEdit;
  
    //Before Edit

  final List<products>_usersBeforeEdit=[];
List<products> get usersBeforeEdit=>_usersBeforeEdit;
  
  //delete

  final List<products>_usersDelete=[];
List<products> get usersDelete=>_usersDelete;
  

  Add(products name){
    _usersAdd.add(name);
    notifyListeners();
  }
    Edit(products name){
    usersEdit.add(name);
    notifyListeners();
  }
      BeforeEdit(products name){
    usersBeforeEdit.add(name);
    notifyListeners();
  }
    Delete(products name){
    _usersDelete.add(name);
    notifyListeners();
  }
}