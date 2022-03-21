import 'package:parcial2/paginas/sillas.dart';
import 'package:flutter/material.dart';
import 'package:parcial2/contantes/const.dart';
import 'package:parcial2/paginas/cuadros.dart';
import 'package:parcial2/paginas/muebles.dart';
import 'package:parcial2/paginas/camas.dart';
import 'package:parcial2/paginas/cunas.dart';

class PrincipalFul extends StatefulWidget {
  PrincipalFul({Key? key}) : super(key: key);

  @override
  State<PrincipalFul> createState() => _PrincipalState();
}

class _PrincipalState extends State<PrincipalFul> {
  int activoMenu1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        toolbarHeight: 210,
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: [botonesFooter()],
          ),
        ),
      ),
      bottomSheet: getPaginas(),
    );
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activoMenu1,
      children: [
        PaginaPrincipal(),
        cuadrosPagina(),
        mueblesPagina(),
        camasPagina(),
        cunasPagina()
      ],
    );
  }

  Widget botonesFooter() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.list,
                  size: 40,
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                Text(
                  "Comercial SIVAR",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Buscar',
                fillColor: Colors.green.shade50,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(categorias.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              activoMenu1 = index;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categorias[index],
                                style: TextStyle(
                                    //color: Colors.grey,
                                    fontSize: 15,
                                    color: activoMenu1 == index
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              activoMenu1 == index
                                  ? Container(
                                      width: 20,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
