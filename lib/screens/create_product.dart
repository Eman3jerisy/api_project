import 'package:api_project/models/product.dart';
import 'package:api_project/models/user_model.dart';
import 'package:api_project/screens/all_product.dart';
import 'package:api_project/services/apiCRUD.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class create_prod extends StatefulWidget {
  const create_prod({Key? key}) : super(key: key);

  @override
  State<create_prod> createState() => _create_prodState();
}

class _create_prodState extends State<create_prod> {
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  String _text = '';
  products product = products();
  @override
  Widget build(BuildContext context) {
  User user_add=Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(_text),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Product Name"),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Product Description"),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _description,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Description',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Product Price"),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _price,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Price',
                    ),
                  ),
                ),
                Consumer<User>(
                  builder: (context, value, child) {
                    return TextButton(
                      child: Text('create'),
                      onPressed: () {
                        if (_name.text.isNotEmpty) {
                          if (_description.text.isNotEmpty) {
                            if (_price.text.isNotEmpty) {
                              if (double.parse(_price.text.toString()) > 0) {
                                product.name = _name.text.toString();
                                product.price =
                                    double.parse(_price.text.toString());
                                product.description = _description.text.toString();
                                CRUD_API.create_product(product).then((value) {
                                  if (value == true) {
                                    CRUD_API.getAllProducts().then((value) {
                                      products news=products();
                                      news.id=value.last.id;
                                      news.name=value.last.name;
                                      news.description=value.last.description;
                                      news.price=value.last.price;
                                      var x=  user_add.Add(news);
                                      print(x);
                                    },);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GetAllProducts()));
                                  } else {
                                    setState(() {
                                      _text = "Can not Connect With Api";
                                    });
                                  }
                                });
                              } else {
                                setState(() {
                                  _text = "Enter Number Price > 0";
                                });
                              }
                            } else {
                              setState(() {
                                _text = "Enter Price";
                              });
                            }
                          } else {
                            setState(() {
                              _text = "Enter Product Description";
                            });
                          }
                        } else {
                          setState(() {
                            _text = "Enter Product Name";
                          });
                        }
                      });
                  },
                    ),
                TextButton(
                    child: Text('Back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetAllProducts()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
