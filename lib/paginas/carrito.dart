import 'package:flutter/material.dart';

class carrito extends StatefulWidget {
  final dynamic producto;

  const carrito({Key? key, this.producto}) : super(key: key);

  @override
  State<carrito> createState() => _carritoState();
}

class _carritoState extends State<carrito> {
  bool mostrar = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 60,
          flexibleSpace: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2, top: 30),
                height: 46,
                width: 46,
                decoration: BoxDecoration(),
                child: Text(
                  "Cart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
        body: getBody(),
      );

  Widget getAppBar() {
    return AppBar();
  }

  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (mostrar)
                  Container(
                      child: Row(
                        children: [
                          _buildButton1(),
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.producto['img']),
                                    fit: BoxFit.fitHeight),
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                widget.producto['title'],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\$ " + widget.producto['precio'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      margin: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(4, 8), // Shadow position
                          ),
                        ],
                      )),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height - 300),
            child: Container(
              width: 250,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.brown.shade300,
                    textStyle: TextStyle(
                      fontSize: 24,
                    )),
                child: Text(
                  'Pagar',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton1() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (mostrar) {
            mostrar = false;
          } else {
            mostrar = true;
          }
        });
      },
      icon: Icon(
        Icons.close,
        size: 40.0,
        color: Colors.red,
      ),
    );
  }
}
