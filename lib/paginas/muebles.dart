import 'package:parcial2/contantes/const.dart';
import 'package:parcial2/paginas/detalleGeneral.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class mueblesPagina extends StatefulWidget {
  @override
  State<mueblesPagina> createState() => _mueblesPaginaState();
}

class _mueblesPaginaState extends State<mueblesPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyApp(),
    );
  }

  Widget bodyApp() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: List.generate(muebles.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: detalleGeneral(
                                  producto: muebles[index],
                                ),
                                type: PageTransitionType.scale));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(muebles[index]['img']),
                                    fit: BoxFit.fitHeight),
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            muebles[index]['title'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
