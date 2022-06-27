import 'package:api_project/models/product.dart';
import 'package:api_project/models/user_model.dart';
import 'package:api_project/screens/Details_Product.dart';
import 'package:api_project/screens/Edit_Product.dart';
import 'package:api_project/screens/all_product.dart';
import 'package:api_project/screens/create_product.dart';
import 'package:api_project/services/apiCRUD.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override

   
    _showDialog(String id) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are You Sure Delete this Item ??'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                CRUD_API.Delete(id).then((value) {
                  if (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GetAllProducts()));
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    User Delete_User=Provider.of(context);
    return   Container(
           child: Column(
            children: [
                 TextButton(
                  child: Text('create'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const create_prod()),
                    );
                  }),
              Container(
                height: 700,
                child: FutureBuilder<List<products>>(
                  future: CRUD_API.getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      if (snapshot.hasData) {
                        return Container(
                          height: double.infinity,
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                if (snapshot.data![index].description == "") {
                                  snapshot.data![index].description !=
                                      " No Description";
                                }

                                return ListTile(
                                    subtitle: Container(
                                      width: double.infinity,
                                      child: Card(
                                        shadowColor: Colors.amberAccent,
                                        color:
                                            const Color.fromARGB(255, 0, 7, 65),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                snapshot.data![index].name!,
                                                style: const TextStyle(
                                                    color: Colors.amberAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Row(children: [
                                              Expanded(
                                                  flex: 6,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(20),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              "Description :  ",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          213,
                                                                          134),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            Text(
                                                              '${snapshot.data![index].description ?? "No Description"} ',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              "Price :  ",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          213,
                                                                          134),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            Text(
                                                              '${snapshot.data![index].price ?? "0"}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        Container(
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 61, 62, 99),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 50,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                TextButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    foregroundColor:
                                                                        MaterialStateProperty.all<
                                                                            Color>(const Color
                                                                                .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                         Navigator.pushReplacement(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => Details(
                                                                                            name: snapshot.data![index].name,
                                                                                            price: snapshot.data![index].price,
                                                                                            description: snapshot.data![index].description,
                                                                                          )));
                                                                      },
                                                                  child: const Text(
                                                                      'View Details'),
                                                                ),
                                                                TextButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    foregroundColor:
                                                                        MaterialStateProperty.all<
                                                                            Color>(const Color
                                                                                .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                        Delete_User.BeforeEdit(snapshot.data![index]);
                                                                        Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => Edit_Product(
                                                                                            name: snapshot.data![index].name,
                                                                                            price: snapshot.data![index].price,
                                                                                            description: snapshot.data![index].description,
                                                                                            id: snapshot.data![index].id,
                                                                                          )));
                                                                            },
                                                                      
                                                                  child:
                                                                      const Text(
                                                                          'Edit'),
                                                                ),
                                                                Consumer<User>(
                                                                  builder: (context, value, child) => TextButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                      foregroundColor:
                                                                          MaterialStateProperty.all<
                                                                              Color>(const Color
                                                                                  .fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                          Delete_User.Delete(snapshot.data![index]);
                                                                          _showDialog(snapshot
                                                                                    .data![index]
                                                                                    .id
                                                                                    .toString());
                                                                        },
                                                                    child: const Text(
                                                                        'Delete'),
                                                                  )
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                     
                                    });
                              }),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            
            ],
           ),
         );
       
  }
}