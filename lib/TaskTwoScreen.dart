import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_network/image_network.dart';
import 'package:realm/realm.dart';
import 'package:untitled/ProductModel.dart';
import 'package:untitled/Products.dart';

class TaskTwoScreen extends StatefulWidget {
  const TaskTwoScreen({Key? key}) : super(key: key);

  @override
  State<TaskTwoScreen> createState() => _TaskTwoScreenState();
}

class _TaskTwoScreenState extends State<TaskTwoScreen> {
  late Realm realm;
  List<String> CategoriesList = [];
  List<ProductModel> productList = [];
  List<ProductModel> filteredProductList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 2"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: CategoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        callFilterData(CategoriesList[index].toString());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(CategoriesList[index].toString())),
                          )),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageNetwork(
                                  image: productList[index].thumbnail!,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  duration: 1500,
                                  curve: Curves.easeIn,
                                  onPointer: true,
                                  debugPrint: false,
                                  fullScreen: false,
                                  fitAndroidIos: BoxFit.cover,
                                  fitWeb: BoxFitWeb.cover,
                                  onLoading: const CircularProgressIndicator(
                                    color: Colors.indigoAccent,
                                  ),
                                  onError: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                  onTap: () {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    productList[index].title!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    productList[index].description!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "\$ ${productList[index].price.toString()!}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Text(
                                              "${productList[index].rating.toString()!}"),
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),
                                          VerticalDivider(
                                            color: Colors.black,
                                            thickness: 2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                                "${productList[index].stock.toString()!} k"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getApiData() async {
    final config = Configuration.local([Products.schema, Categories.schema]);
    realm = Realm(config);

    final connectivityResult = (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      getApicategories();
      getApiproducts();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      getApicategories();
      getApiproducts();
    } else {

      var data = realm.all<Categories>();

      print(data);

      for (int j = 0; j < data.length; j++) {
        CategoriesList.add(data[j].name!);
      }



      var dataa = realm.all<Products>();

      for (int j = 0; j < dataa.length; j++) {
        ProductModel model = new ProductModel();
        model.id = dataa[j].id;
        model.title = dataa[j].title;
        model.description = dataa[j].description;
        model.price = dataa[j].price;
        model.discountPercentage = dataa[j].discountPercentage;
        model.rating = dataa[j].rating;
        model.stock = dataa[j].stock;
        model.brand = dataa[j].brand;
        model.category = dataa[j].category;
        model.thumbnail = dataa[j].thumbnail;
        productList.add(model);
      }
    }
  }

  getApicategories() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<String> newData = List<String>.from(body);

      realm.write(() {
        realm.deleteAll<Categories>();

        for (int i = 0; i < newData.length; i++) {
          var catVar = Categories(name: newData[i]);
          realm.add(catVar);
        }
      });

      var data = realm.all<Categories>();

      print(data);

      for (int j = 0; j < data.length; j++) {
        CategoriesList.add(data[j].name!);
      }
    }

    setState(() {});
  }

  getApiproducts() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      Map body = json.decode(response.body);
      List productData = body["products"];
      List<ProductModel> productModelData = productData.map((e) => ProductModel.fromJson(e)).toList();

      realm.write(() {
        realm.deleteAll<Products>();

        for (int i = 0; i < productModelData.length; i++) {
          var productVar = Products(
            id: productModelData[i].id,
            title: productModelData[i].title,
            description: productModelData[i].description,
            price: productModelData[i].price,
            discountPercentage: productModelData[i].discountPercentage,
            rating: productModelData[i].rating,
            stock: productModelData[i].stock,
            brand: productModelData[i].brand,
            category: productModelData[i].category,
            thumbnail: productModelData[i].thumbnail,
          );
          realm.add(productVar);
        }
      });

      var data = realm.all<Products>();

      for (int j = 0; j < data.length; j++) {
        ProductModel model = new ProductModel();
        model.id = data[j].id;
        model.title = data[j].title;
        model.description = data[j].description;
        model.price = data[j].price;
        model.discountPercentage = data[j].discountPercentage;
        model.rating = data[j].rating;
        model.stock = data[j].stock;
        model.brand = data[j].brand;
        model.category = data[j].category;
        model.thumbnail = data[j].thumbnail;
        productList.add(model);
      }
    }

    setState(() {});
  }

  callFilterData(String filterStr) {
    productList.clear();
    var data = realm.all<Products>().query("category == '$filterStr'");
    print(data);

    for (int j = 0; j < data.length; j++) {
      ProductModel model = new ProductModel();
      model.id = data[j].id;
      model.title = data[j].title;
      model.description = data[j].description;
      model.price = data[j].price;
      model.discountPercentage = data[j].discountPercentage;
      model.rating = data[j].rating;
      model.stock = data[j].stock;
      model.brand = data[j].brand;
      model.category = data[j].category;
      model.thumbnail = data[j].thumbnail;
      productList.add(model);
    }

    setState(() {});
  }
}
