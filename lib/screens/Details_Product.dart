import 'package:api_project/screens/all_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';



class Details extends StatefulWidget {
  final  name;
  final price;
  final description;
  
   Details({Key? key, this.name,this.description,this.price}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Details From "+this.widget.name),backgroundColor: Colors.amber,),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromARGB(255, 0, 18, 53),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 200,),
                     Text("Name:",style: TextStyle(
                      color: Color.fromARGB(255, 214, 214, 214),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(this.widget.name,style: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),),
                    SizedBox(height: 30,),
                      const Text("Price:",style: TextStyle(
                      color: Color.fromARGB(255, 214, 214, 214),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(this.widget.price.toString(),style: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),),
                    SizedBox(height: 30,),
                      const Text("Description:",style: TextStyle(
                      color: Color.fromARGB(255, 214, 214, 214),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(this.widget.description,style: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),)
                  ,
                  SizedBox(
                    height: 280,
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
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}