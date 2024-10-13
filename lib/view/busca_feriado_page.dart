import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaFeriadoPage extends StatefulWidget {
  const BuscaFeriadoPage({super.key});

  @override
  State<BuscaFeriadoPage> createState() => _BuscaFeriadoPageState();
}

class _BuscaFeriadoPageState extends State<BuscaFeriadoPage> {
  String? campo = null;

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
            TextField(
              decoration: InputDecoration(
                labelText: "Insira um ano",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: buscaFeriado(campo),
                builder: (context, snapshot){
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                      
                    default:
                      if(snapshot.hasError){
                        return Container();
                    
                      }
                      else{
                        return exibeResultado(context, snapshot);
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot){
    if(campo != null){
      List<dynamic> feriados = snapshot.data;

      return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: feriados.length,
          itemBuilder: (context, index) {
            var feriado = feriados[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      feriado["name"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      feriado["date"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      feriado["type"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      feriado["level"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Container();
  }
}