import 'package:introducao_flutter/model.dart';

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa({this.nome, this.cpf, this.nascimento, this.sexo});
}

class NotaFiscal {
  int? numero;
  DateTime? emissao;
  Pessoa? cliente;
  String? enderecoEntrega;

  List<ItemNF> listaItens = [];

  NotaFiscal({this.numero, this.emissao, this.cliente, this.enderecoEntrega});

  double calcularValorTotal() {
    return listaItens.map((e) => e.getValorTotal()).reduce((a, b) => a + b);
    // double total = 0.0;
    // for (ItemNF item in listaItens) {
    //   total += item.getValorTotal();
    // }
    // return total;
  }

  double calcularTotalDescontos(){
    return listaItens.map((e) => e.desconto).reduce((a, b) => a + b);
    // double totalDesc = 0.0;
    // for (ItemNF item in listaItens){
    //   totalDesc += item.desconto;
    // }
    // return totalDesc;
  }

  double calcularTotalAcrescimos(){
    double totalAcrescimo = 0.0;
    for (ItemNF item in listaItens){
      totalAcrescimo += item.acrescimo;
    }
    return totalAcrescimo;
  }

  ItemNF getProdutoMaisBarato() {
    return listaItens.reduce((a, b) => a.getValorTotal() > b.getValorTotal() ? a : b);

    // ItemNF? itemMaisBarato;
    // for (ItemNF item in listaItens) {
    //   if (itemMaisBarato == null) {
    //     itemMaisBarato = item;
    //   } else if (item.getValorTotal() < itemMaisBarato.getValorTotal()) {
    //     itemMaisBarato = item;
    //   }
    // }
    // return itemMaisBarato;
  }

  ItemNF getProdutoMaisCaro() {
    return listaItens.reduce((a, b) => a.getValorTotal() > b.getValorTotal() ? a : b);

    // ItemNF? itemMaisCaro;
    // for (ItemNF item in listaItens) {
    //   if (itemMaisCaro == null) {
    //     itemMaisCaro = item;
    //   } else if (item.getValorTotal() > itemMaisCaro.getValorTotal()) {
    //     itemMaisCaro = item;
    //   }
    // }
    // return itemMaisCaro;
  }

  Iterable<ItemNF>itensComDesconto(){
    return listaItens.map((item) => item).where((item) => item.desconto > 0);
  }

  ItemNF addItem(
      {required String produto,
      required double valor,
      double desconto = 0.0,
      double acrescimo = 0.0}) {
    ItemNF item = ItemNF(
        numSeq: listaItens.length + 1,
        produto: produto,
        valor: valor,
        desconto: desconto,
        acrescimo: acrescimo);
    listaItens.add(item);
    return item;
  }

  String getStrItens() {
    return listaItens.map((i) => "${i.numSeq}: ${i.produto}").join(", ");
  }

  bool possuiDesconto(){
    return listaItens.map((item) => item.desconto).any((a) => a > 0);
  }
}

class ItemNF {
  int numSeq;
  String produto;
  double valor;
  double desconto;
  double acrescimo;

  ItemNF(
      {required this.numSeq,
      required this.produto,
      required this.valor,
      this.acrescimo = 0.0,
      this.desconto = 0.0});

  double getValorTotal() => valor + acrescimo - desconto;

  @override
  String toString() {
    return '{numSeq=$numSeq, produto=$produto, valor=$valor, desconto=$desconto, acrescimo=$acrescimo, valorTotal=${getValorTotal()}}';
  }
}

void mainNotaFiscal() {
  final pessoa = Pessoa(nome: 'José');
  final nota = NotaFiscal(
      cliente: pessoa,
      emissao: DateTime(2022, 5, 3),
      enderecoEntrega: 'rua Sete de Setembro',
      numero: 1500);
  nota.addItem(produto: 'Notebook', valor: 5000, acrescimo: 100.0);
  nota.addItem(produto: 'Cadeira', valor: 2000, desconto: 10.0);
  nota.addItem(produto: 'Teclado', valor: 500, acrescimo: 50.0);
  print('Valor total da NF = ${nota.calcularValorTotal()}');
  //print('produto mais barato = ${nota.getProdutoMaisBarato()}');
  print('Total desconto = ${nota.calcularTotalDescontos()}');
  print('Total acrescimo= ${nota.calcularTotalAcrescimos()}');
  print(nota.getStrItens());
  print(nota.getProdutoMaisCaro());
}
