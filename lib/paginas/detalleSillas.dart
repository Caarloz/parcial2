import 'dart:ui';

import 'package:parcial2/contantes/const.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/paginas/carrito.dart';

class detalleSilla extends StatefulWidget {
  final dynamic producto;
  final dynamic i;

  const detalleSilla({Key? key, this.producto, this.i}) : super(key: key);

  @override
  State<detalleSilla> createState() => _detalleSillaState();
}

class Animal {
  String imagen;

  Animal(
    this.imagen,
  );
}

class _detalleSillaState extends State<detalleSilla> {
  @override
  int _cIndex = -1;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  final List<Animal> lista = [];

  @override
  void initState() {
    lista.add(new Animal(sillas[0]['img']));
    lista.add(new Animal(sillas[1]['img']));
    lista.add(new Animal(sillas[2]['img']));

    super.initState();
  }

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

  Widget imagenDefecto() {
    _cIndex = widget.i;
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.producto['img']), fit: BoxFit.fitHeight),
      ),
    );
  }

  Widget imagenSeleccion() {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(lista[_cIndex].imagen), fit: BoxFit.fitHeight),
      ),
    );
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
                if (_cIndex == -1) imagenDefecto() else imagenSeleccion(),
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
                            Row(
                              children: [
                                _buildButton1(),
                                _buildButton2(),
                                _buildButton3(),
                              ],
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
                                              producto: sillas[_cIndex],
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

  Widget _buildButton1() {
    return IconButton(
      onPressed: () {
        setState(() {
          _cIndex = 0;
        });
      },
      icon: Icon(
        Icons.circle,
        size: 40.0,
        color: Colors.green,
      ),
    );
  }

  Widget _buildButton2() {
    return IconButton(
      onPressed: () {
        setState(() {
          _cIndex = 1;
        });
      },
      icon: Icon(
        Icons.circle,
        size: 40.0,
        color: Colors.orange,
      ),
    );
  }

  Widget _buildButton3() {
    return IconButton(
      onPressed: () {
        setState(() {
          _cIndex = 2;
        });
      },
      icon: Icon(
        Icons.circle,
        size: 40.0,
        color: Colors.red,
      ),
    );
  }
}
