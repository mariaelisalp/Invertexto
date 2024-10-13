import 'package:flutter/material.dart';
import 'package:invertexto/view/busca_cep_page.dart';
import 'package:invertexto/view/por_extenso_page.dart';
import 'package:invertexto/view/busca_feriado_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/invertexto.png', fit: BoxFit.contain, height: 40),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column( 
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.edit, color:Colors.white, size: 70),
                  const SizedBox(width: 15),
                  const Text(
                    "Por Extenso", 
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PorExtensoPage()));
              },
            ),

            GestureDetector(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.location_city, color:Colors.white, size: 70),
                  const SizedBox(width: 15),
                  const Text(
                    "Buscar CEP", 
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuscaCepPage()));
              },
            ),

            GestureDetector(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.search, color:Colors.white, size: 70),
                  const SizedBox(width: 15),
                  const Text(
                    "Buscar Feriados", 
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuscaFeriadoPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}