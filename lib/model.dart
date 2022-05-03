enum Sexo { MASCULINO, FEMININO }

Sexo? strToSexo(String? str) {
  if (str == null) {
    return null;
  }
  switch (str.toUpperCase()) {
    case 'MASCULINO':
    case 'M':
      return Sexo.MASCULINO;
    case 'FEMININO':
    case 'F':
      return Sexo.FEMININO;
    default:
      return null;
  }
}

class Pessoa {
  String? nome;
  String? CPF;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa(this.nome, this.CPF, this.nascimento, this.sexo);

  Pessoa.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    CPF = map['CPF'];
    nascimento = DateTime.tryParse(map['nascimento'] ?? 2000 - 01 - 01);
    sexo = strToSexo(map['sexo']);
  }

  int? getIdade() {
    if (nascimento == null) {
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

class Programador extends Pessoa {
  double? salario;

  Programador(
      String? nome, String? CPF, DateTime? nascimento, Sexo? sexo, this.salario)
      : super(nome, CPF, nascimento, sexo);

  Programador.fromMap(Map<String, String> map) : super.fromMap(map) {
    salario = double.tryParse(map['salario'] ?? "0.0");
  }

  @override
  String toString() {
    return "nome=$nome, cpf=$CPF, nascimento=$nascimento, idade=${getIdade()}, sexo=$sexo, salario=$salario";
  }
}

void mainEntidades() {
  final map = {
    'nome': 'José',
    'nascimento': '2000-01-01',
    'sexo': 'M',
    'salario': '10000.0'
  };

  Pessoa pessoa = Programador.fromMap(map);

  // Programador pessoa = new Programador();
  // pessoa.nome = "José";
  // pessoa.CPF = "123.456.789-09";
  // pessoa.nascimento = DateTime(1990, 10, 10);
  // pessoa.sexo = Sexo.MASCULINO;
  // pessoa.salario = isBoss ? 20000.0 : 10000.0;
  //
  // print(pessoa.toString());

  List<String> nomes = ['Carlos', 'João', 'Samuel', 'José', 'Eduardo'];

  for (int i = 0; i < nomes.length; i++) {
    if (nomes[i].toUpperCase().startsWith('S')) {
      break;
    }
    print("$i - ${nomes[i]}");
  }
}
