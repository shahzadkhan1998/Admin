import 'dart:ui';

import 'package:admin_side/db/brand.dart';
import 'package:admin_side/db/category.dart';
import 'package:admin_side/screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  const Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectPage = Page.dashboard;

  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  CategoryService _categoryService = new CategoryService();
  BrandService _brandService = new BrandService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Expanded(
              // ignore: deprecated_member_use
              child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    _selectPage = Page.dashboard;
                  });
                },
                icon: Icon(Icons.dashboard,
                    color: _selectPage == Page.dashboard ? active : notActive),
                label: Text("Dashboard"),
              ),
            ),
            Expanded(
              // ignore: deprecated_member_use
              child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    _selectPage = Page.manage;
                  });
                },
                icon: Icon(
                  Icons.sort,
                  color: _selectPage == Page.manage ? active : notActive,
                ),
                label: Text("Manage"),
              ),
            ),
          ],
        ),
      ),
      body: _loadScreen(),
    );
  }

  //===================== Widget ========================>/////////

  // ignore: missing_return
  Widget _loadScreen() {
    switch (_selectPage) {
      //<========================= Manage the dashboard of the admin==================>/////////////
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              // ignore: deprecated_member_use
              subtitle: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_money,
                  size: 30,
                  color: Colors.green,
                ),
                label: Text(
                  "12,000",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
                ),
              ),
              title: Text(
                "Revenue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  //<================ card 1 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.people_alt_outlined),
                          label: Text('User'),
                        ),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //<================ card 2 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.category),
                          label: Text('Categories'),
                        ),
                        subtitle: Text(
                          '23',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //<================ card 3 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.track_changes),
                          label: Text('Products'),
                        ),
                        subtitle: Text(
                          '123',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //<================ card 4 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.tag_faces),
                          label: Text('sold'),
                        ),
                        subtitle: Text(
                          '14',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //<================ card 5 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Orders'),
                        ),
                        subtitle: Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //<================ card 6 ====================================>////////
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          label: Text('Return'),
                        ),
                        subtitle: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;

      //<======================= Manage the Admin Manager==========================>//
      case Page.manage:
        // TODO: Handle this case.
        return ListView(
          children: [
            // ============================Product========================
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Product"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()));
              },
            ),

            Divider(),
            // ============================Product List ========================
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () {},
            ),

            Divider(),
            // ============================Add Category ========================
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("Add Category"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            // ============================Category list ========================
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category list"),
              onTap: () {},
            ),
            Divider(),
            // ============================Add brand ========================
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add brand"),
              onTap: () {
                _brandAlert();
              },
            ),

            Divider(),
            // ============================brand list ========================
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("brand list"),
              onTap: () {},
            ),
            Divider(),
          ],
        );
        break;

      default:
        return Container();
    }
  }

// ========== make a function =================================>//

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) {
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(hintText: "add category"),
        ),
      ),
      actions: [
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            if (categoryController != null) {
              _categoryService.createCategory(categoryController.text);
            }
            Fluttertoast.showToast(msg: "Category created");
            Navigator.pop(context);
          },
          child: Text("add"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

// ========== make a function =================================>//
  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) {
              return 'brand cannot be empty';
            }
          },
          decoration: InputDecoration(hintText: "add brand"),
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            if (categoryController != null) {
              _brandService.createBrand(brandController.text);
            }
            Fluttertoast.showToast(msg: "Brand created");
            Navigator.pop(context);
          },
          child: Text("add"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }
}
