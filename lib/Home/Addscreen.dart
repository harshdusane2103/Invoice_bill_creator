import 'package:flutter/material.dart';

class Billscreen extends StatefulWidget {
  const Billscreen({super.key});

  @override
  State<Billscreen> createState() => _BillscreenState();
}

class _BillscreenState extends State<Billscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop('/');
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Bill',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  price=0;
                  qty=0;
                  amount=0;
                });
                Navigator.of(context).pushNamed('/pdf');
               for(int i=0;i<productlist.length;i++)
                 {
                   price=double.parse(productlist[i].price!.text);
                   qty=double.parse(productlist[i].qty!.text);
                   amount=(amount+price)*qty;
                 }
              },
              child: Icon(
                Icons.file_download_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                productlist.length,
                (index) => Center(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        height: 260,
                        width: 300,
                        color: Colors.white,
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    productlist.removeAt(index);
                                  });
                                },
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.close))),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            box('Product Name', productlist[index].proname!),
                            SizedBox(
                              height: 5,
                            ),
                            box('Qunatiy', productlist[index].qty!),
                            SizedBox(
                              height: 5,
                            ),
                            box('Price', productlist[index].price!),
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          TextEditingController txtproname = TextEditingController();
          TextEditingController txtqty = TextEditingController();
          TextEditingController txtprice = TextEditingController();
          setState(() {
            productlist.add(controllerModal(
                qty: txtqty, proname: txtproname, price: txtprice));
          });
        },
        child: Container(
          height: 40,
          width: 50,
          color: Colors.black,
          child: Center(
              child: Text(
            'Add',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

  TextField box(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.purple),
        ),
        label: Text(label),
      ),
    );
  }
}


String? proname = '';
double qty = 0;
double price = 0;


class controllerModal {
  TextEditingController? proname;

  TextEditingController? qty;
  TextEditingController? price;

  controllerModal({
    this.price,
    this.proname,
    this.qty,
  });
}

List<controllerModal> productlist = [

];

TextEditingController txtproname = TextEditingController();

TextEditingController txtqty = TextEditingController();
TextEditingController txtprice = TextEditingController();
List<TextEditingController> pricelist=[txtprice];

double amount = 0;
double total = 0;
