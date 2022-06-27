
import 'package:api_project/models/product.dart';
import 'package:api_project/models/user_model.dart';
import 'package:api_project/screens/Details_Product.dart';
import 'package:api_project/screens/Edit_Product.dart';
import 'package:api_project/screens/create_product.dart';
import 'package:api_project/screens/getAll.dart';
import 'package:api_project/services/apiCRUD.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class GetAllProducts extends StatefulWidget {
  const GetAllProducts({Key? key}) : super(key: key);

  @override
  State<GetAllProducts> createState() => _GetAllProductsState();
}

class _GetAllProductsState extends State<GetAllProducts> {
  @override

    int currentPageIndex = 0;

 
  Widget build(BuildContext context) {
    User Delete_User=Provider.of(context);
  
    return SafeArea(
      child: Scaffold(
        //لوضع مسافة بين المحتوى والبدي
        extendBody : true,
                 bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.all_inbox),
              label: 'All Product',
            ),
            
            NavigationDestination(
              selectedIcon: Icon(Icons.add),
              icon: Icon(Icons.add),
              label: 'Product Creating',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.edit),
              icon: Icon(Icons.add),
              label: 'Product Edit',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.delete),
              icon: Icon(Icons.add),
              label: 'Product Delete',
            ),
          ],
        ),
        body:[
        All(),
         Container(
          child: SingleChildScrollView(child:
          Column(
            children: [
              SizedBox(height: 40,),
              Center(child: Text("Product That Add When Run Your App",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 40,),
              Container(
                height: 800,
                color: Colors.amberAccent,
                child: ListView.builder(
                  itemCount: Delete_User.UsersAdd.length,
                  itemBuilder:(context,index){
                    return Container(
                      height: 100,
                      child: ListTile(subtitle: Column(children: [
                        Text(Delete_User.UsersAdd[index].id.toString()),
                        Text(Delete_User.UsersAdd[index].name.toString()),
                        Text(Delete_User.UsersAdd[index].description.toString())
                        ,Text(Delete_User.UsersAdd[index].price.toString()),
                        SizedBox(height: 20,)
                      ]),),
                    );
                  },
                
                ),
              ),
            ],
          ) 
          ),
         )
        , Container(
          child: SingleChildScrollView(child:
          Column(
            children: [
              SizedBox(height: 40,),
              Center(child: Text("Product That Edit When Run Your App",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 40,),
              Container(
                height: 800,
                color: Colors.amberAccent,
                child: ListView.builder(
                  itemCount: Delete_User.usersEdit.length,
                  itemBuilder:(context,index){
                    return Container(
                      height: 100,
                      child: ListTile(subtitle: Column(children: [
                        Text("From: "+Delete_User.usersEdit[index].id.toString()+" To: "+Delete_User.usersBeforeEdit[index].id.toString()),
                        Text("From: "+Delete_User.usersEdit[index].name.toString()+" To: "+Delete_User.usersBeforeEdit[index].name.toString()),
                        Text("From: "+Delete_User.usersEdit[index].description.toString()+" To: "+Delete_User.usersBeforeEdit[index].description.toString()),
                        Text("From: "+Delete_User.usersEdit[index].price.toString()+" To: "+Delete_User.usersBeforeEdit[index].price.toString()),
                        SizedBox(height: 20,)
                      ]),),
                    );
                  },
                
                ),
              ),
            ],
          ) 
          ),
         )
        ,Container(
          child: SingleChildScrollView(child:
          Column(
            children: [
              SizedBox(height: 40,),
              Center(child: Text("Product That Delete When Run Your App",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 40,),
              Container(
                height: 800,
                color: Colors.amberAccent,
                child: ListView.builder(
                  itemCount: Delete_User.usersDelete.length,
                  itemBuilder:(context,index){
                    return Container(
                      height: 100,
                      child: ListTile(subtitle: Column(children: [
                        Text(Delete_User.usersDelete[index].id.toString()),
                        Text(Delete_User.usersDelete[index].name.toString()),
                        Text(Delete_User.usersDelete[index].description.toString())
                        ,Text(Delete_User.usersDelete[index].price.toString()),
                        SizedBox(height: 20,)
                      ]),),
                    );
                  },
                
                ),
              ),
            ],
          ) 
          ),
         )
        
         ][currentPageIndex],
        
      ),
    );
  }
}
