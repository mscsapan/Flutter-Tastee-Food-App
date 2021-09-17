import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/api_services/product_api.dart';
import 'package:my_food_application/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> _product;
  late bool loading;
  ProductApi api = new ProductApi();

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    api.getProductApi().then((product) => {
          setState(() {
            _product = product;
            loading = false;
          })
        });
  }

  double conSize = 320.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(loading ? 'Loading..' : 'Product'), centerTitle: true),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder(
              future: api.getProductApi(),
              builder: (context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _product.length,
                        itemBuilder: (context, index) {
                          Product product = _product[index];
                          return Column(
                            children: [
                              Container(
                                  height: conSize,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 4.0, right: 4.0, bottom: 8),
                                  child: Card(
                                    elevation: 7.0,
                                    margin: EdgeInsets.zero,
                                    child: Image.network('${product.image}',
                                        fit: BoxFit.cover),
                                  )),
                            ],
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
    );
  }
}
