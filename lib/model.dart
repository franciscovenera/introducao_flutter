enum Sexo {MASCULINO, FEMININO }

class Pessoa {
  String? nome;
  String? CPF;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;
  double? salario;
  bool? programador;

  @override
  String toString() {
    return "nome=$nome, cpf=$CPF, nascimento=$nascimento, idade=$idade, sexo=$sexo, "
        "salario=$salario, programador=$programador";

  }

}

void mainEntidades(){
  Pessoa pessoa = new Pessoa();
  pessoa.nome = "José";
  pessoa.CPF = "123.456.789-09";
  pessoa.nascimento = DateTime(1986, 10, 10);
  pessoa.idade = 35;
  pessoa.sexo = Sexo.MASCULINO;
  pessoa.salario = 10000.0;
  pessoa.programador = true;

  print(pessoa.toString());
}