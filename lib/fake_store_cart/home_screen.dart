
import 'package:api_training/fake_store_cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<CartProvider>(context, listen: false);
    provider.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),));
        // },child: Icon(Icons.add),),
        body: Consumer<CartProvider>(
          builder: (context, value, child) {
            // if (value.productList.isEmpty) {
            //   return Text("Cannot Get products");
            // } else {
            //   return ListView.builder(
            //     itemCount: value.productList.length,
            //     itemBuilder: (context, index) {
            //       var product = value.productList[index];
            //       return ListTile(
            //         trailing: SizedBox(width: 100,child: Row(children: [IconButton(onPressed: () {
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProductScreen(id: product.id??0),));
            //         },
            //             icon: Icon(Icons.edit)),
            //           IconButton(onPressed: () {
            //             provider.deleteProduct(context, product.id??0);
            //           }, icon: Icon(Icons.delete))
            //         ],),),
            //         title: Text("${product?.title}"),
            //         subtitle: Text("${product?.description}"),
            //       );
            //     },);
            // }
            return ListTile(
              title: Text("${value.cartModel?.id}"),
              subtitle: Column(
                children: [
                  Text("${value.cartModel?.title}"),
                  // Text("${value.cartModel?.products?.quantity}"),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
