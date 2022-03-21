import 'dart:ui';

import 'package:parcial2/contantes/const.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/paginas/carrito.dart';

class detalleGeneral extends StatefulWidget {
  final dynamic producto;

  const detalleGeneral({Key? key, this.producto}) : super(key: key);

  @override
  State<detalleGeneral> createState() => _detalleGeneralState();
}

class Animal {
  String imagen;

  Animal(
    this.imagen,
  );
}

class _detalleGeneralState extends State<detalleGeneral> {
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
                    left: MediaQuery.of(context).size.width - 60, top: 30),
                height: 46,
                width: 46,
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
        body: encabezado(),
      );

  Widget getAppBar() {
    return AppBar();
  }

  Widget encabezado() {
    var tamanio = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.green.shade50,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: tamanio.width - 100,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.producto['img']),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250),
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red.shade600,
                  ),
                  alignment: Alignment.center,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),

            ///////////////////////////////////
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.producto['title'],
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "\$ " + widget.producto['precio'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 245, 221, 11),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 245, 221, 11),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 245, 221, 11),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 245, 221, 11),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey.shade300,
                                  ),
                                  Text(
                                    "200 Reviews",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: Text(
                                "Descripción",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 20),
                              child: SizedBox(
                                child: Text(
                                  widget.producto['descriptions'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            child: carrito(
                                              producto: widget.producto,
                                            ),
                                            type: PageTransitionType.scale));
                                  });
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.brown.shade300,
                                    textStyle: TextStyle(
                                      fontSize: 24,
                                    )),
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 24.0,
                                ),
                                label: Text(
                                  'Comprar',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
