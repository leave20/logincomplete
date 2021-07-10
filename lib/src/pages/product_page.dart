import 'package:flutter/material.dart';
import 'package:logincomplete/src/model/product_model.dart';
import 'package:logincomplete/src/providers/product_provider.dart';
import 'package:logincomplete/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final productsProvider=ProductsProvider();

  ProductModel productModel = new ProductModel();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.deepPurple,
    minimumSize: Size(150, 60),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
              icon: Icon(Icons.photo_size_select_actual_outlined),
              onPressed: () {}),
          SizedBox(
            width: 30,
          ),
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _nameCreate(),
                _priceCreate(),
                _availableCreate(),
                Divider(
                  height: 20.0,
                  color: Colors.white,
                ),
                _buttonCreate(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _nameCreate() {
    return TextFormField(
      initialValue: productModel.title,
      onSaved: (value) => productModel.title = value,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product'),
      validator: (value) {
        if (value.length < 3) {
          return 'Insert product name';
        } else {
          return null;
        }
      },
    );
  }

  _priceCreate() {
    return TextFormField(
      initialValue: productModel.value.toString(),
      onSaved: (value) => productModel.value = double.parse(value),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Price'),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Only numbers';
        }
      },
    );
  }

  _buttonCreate() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _submit,
        icon: Icon(Icons.save),
        label: Text('save'),
        style: raisedButtonStyle,
      ),
    );
  }

  Widget _availableCreate() {
    return SwitchListTile(
      title: Text('Available'),
      value: productModel.available,
      onChanged: (value) => setState(() {
        productModel.available = value;
      }),
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      print(productModel.title);
      print(productModel.value);
      print(productModel.available);

      productsProvider.productCreate(productModel);

      return print('Todo Ok');
    }
  }
}
