import 'package:api_project/models/product.dart';
import 'package:api_project/models/user_model.dart';
import 'package:api_project/screens/all_product.dart';
import 'package:api_project/services/apiCRUD.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Edit_Product extends StatefulWidget {
  static var getAllUsers;
  final id;
  final name;
  final price;
  final description;
  const Edit_Product(
      {Key? key,required this.id, this.name, this.description, this.price})
      : super(key: key);

  @override
  State<Edit_Product> createState() => _Edit_ProductState();
}

class _Edit_ProductState extends State<Edit_Product> {
  @override
  final products prod = products();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _id = TextEditingController();
  late String _errors = "";

  submitHandler() {
    prod.name = _name.text.toString();
    prod.description = _description.text.toString();
    prod.id = int.parse(_id.text.toString());
    CRUD_API.edit_product(prod).then((value) {
      if (value == false) {
        _errors = "Added Errors";
      } else {
        
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GetAllProducts()));
      }
    });
  }

  Widget build(BuildContext context) {
_id.text=this.widget.id.toString();
_name.text=this.widget.name.toString();
_description.text=this.widget.description.toString();
_price.text=this.widget.price.toString();
User Edit_user=Provider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          
          Container(
            height: 820,
            color: Color.fromARGB(255, 0, 7, 65),
            child: Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(83.8),
                      child: Center(
                          child: Text(
                        "Edit Product" + this.widget.name.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 207, 187, 3)),
                      )),
                    ),
                    Text(
                      _errors,
                      style: TextStyle(color: Colors.red),
                    ),
                    ///id
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40),
                      alignment: Alignment.center,
                      height: 50,
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        controller: _id,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.white,
                            ),
                            hintText: "ID : "+this.widget.id.toString(),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(118, 255, 255, 255))),
                      ),
                    ),

                    ///Name
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.white),
                        controller: _name,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.verified_user,
                              color: Colors.white,
                            ),
                            hintText: "Name : "+this.widget.name.toString(),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(118, 255, 255, 255))),
                      ),
                    ),

                    ///Price  
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        controller: _price,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                            hintText: this.widget.price.toString(),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(118, 255, 255, 255))),
                      ),
                    ),
                    //Description
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.white),
                        controller: _description,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: this.widget.description.toString(),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(118, 255, 255, 255))),
                      ),
                    ),
                     SizedBox(
                        height: 25,
                      ),
                    Consumer(
                      builder: (context, value, child) {
                        return  TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 207, 187, 3)),
                        ),
                    
                       
                        onPressed: () {
                          if (_name.text.isEmpty) {
                            setState(() {
                              _errors = "Enter Product Name";
                            });
                          } else {
                            if (_price.text.isEmpty) {
                              setState(() {
                                _errors = "Enter Product Price";
                              });
                            } else {
                              try {
                                if (double.parse(_price.text) > 0) {
                                  if (_description.text.isEmpty) {
                                    setState(() {
                                      _errors = "Enter Product Description";
                                    });
                                  } else {
                                    prod.name = _name.text;
                                    prod.price = double.parse(_price.text.toString());
                                    prod.description = _description.text.toString();
                                    prod.id=int.parse(_id.text.toString());
                                    Edit_user.Edit(prod);
                                    return submitHandler();
                                  }
                                } else {
                                  setState(() {
                                    _errors = "Price Should be >0";
                                  });
                                }
                              } catch (Exception) {
                                setState(() {
                                  _errors = "Price Should be Number";
                                });
                              }
                            }
                          }
                        },
                        child: Text('Submit'),
                      );
                  
                      },
                       ),
                  Center(
                          child: TextButton(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Color.fromARGB(187, 255, 255, 255),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetAllProducts()));
                            },
                          ),
                        ),],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
