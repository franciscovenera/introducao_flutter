enum Sexo {MASCULINO, FEMININO }

class Pessoa {
  String? nome;
  String? CPF;
  DateTime? nascimento;
  Sexo? sexo;

int? getIdade(){
  if (nascimento == null){
    return null;
  }
  final hoje = DateTime.now();
  final idade = hoje.difference(nascimento!);
  return idade.inDays ~/ 365;
}

  @override
  String toString() {
    return "nome=$nome, cpf=$CPF, nascimento=$nascimento, idade=${getIdade()}, sexo=$sexo";

  }

}

class Programador extends Pessoa{
  double? salario;

  @override

  String toString() {
    return "nome=$nome, cpf=$CPF, nascimento=$nascimento, idade=${getIdade()}, sexo=$sexo, salario=$salario";
  }
}

void mainEntidades(){
  Pessoa pessoa = new Programador();
  pessoa.nome = "José";
  pessoa.CPF = "123.456.789-09";
  pessoa.nascimento = DateTime(1990, 10, 10);
  pessoa.sexo = Sexo.MASCULINO;
  //pessoa.salario = 10000.0;

  print(pessoa.toString());
}