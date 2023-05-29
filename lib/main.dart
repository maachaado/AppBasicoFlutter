import 'package:app_basico/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuContador());
}

class MeuContador extends StatefulWidget {
  const MeuContador({super.key});

  @override
  State<MeuContador> createState() => _MeuContadorState();
}

class _MeuContadorState extends State<MeuContador> {
  int qt = 0;

  bool get vazio => qt == 0;
  bool get cheio => qt == 10;

  incrementar() {
    setState(() {
      qt++;
      print(qt);
    });
  }

  decrementar() {
    setState(() {
      qt--;
      print(qt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: paginaPrincipal(),
    );
  }

  paginaPrincipal() {
    return Scaffold(
      body: Container(
        decoration: Util().configuraFundo('pub.jpg'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Util().criaTexto(cheio ? 'LOTADO' : 'Bem vindo', 100,
                cheio ? Colors.red : Colors.white),
            Padding(
              padding: EdgeInsets.all(64),
              child: Util().criaTexto('$qt', 80, Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Util().criaBotao(
                    'Saiu',
                    30,
                    Colors.black,
                    vazio ? null : decrementar,
                    vazio ? Colors.white.withOpacity(0.5) : Colors.white),
                const SizedBox(width: 20),
                Util().criaBotao(
                    'Entrou',
                    28,
                    Colors.black,
                    cheio ? null : incrementar,
                    cheio ? Colors.white.withOpacity(0.5) : Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}
