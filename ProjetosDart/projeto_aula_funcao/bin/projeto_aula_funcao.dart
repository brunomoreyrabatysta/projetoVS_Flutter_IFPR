import 'dart:io';

void main(List<String> arguments) {
  // função sem retorno e sem parâmetro
  /*
  imprimir();
  imprimirPessoa();
  imprimirPessoaFuncao(imprimir);
  imprimirPessoaFuncao(imprimir2);
  */

  // função anônima
  imprimirPessoaFuncao(() {
    print('Bom dia.');
  });

  /*
  // função sem retorno e com  parâmetro
  imprimirNome('João');

  // função com retorno e sem parâmetro
  var mensagem = devolverOla();
  print(mensagem);

  print(devolverOla());

  print(devolverOla2());

  // função com retorno e com parâmetro
  var mensagem1 = devolverOlaNome('Paula');
  print(mensagem1);

  print(devolverOlaNome('Paula'));

  imprimirOla('Joaquim', 0);
  imprimirOla('Joaquim', 1);

  imprimirOlaNomeado(opcao: 1, nome: 'Joaquim');

  imprimirOlaOpcional('Joaquim');
  imprimirOlaOpcional('Joaquim', 1);

  imprimirOlaTernario('Joaquim');
  imprimirOlaTernario('Joaquim', 1);

  imprimirOlaTernarioInterpolacao('Joaquim');
  imprimirOlaTernarioInterpolacao('Joaquim', 1);
  */
}

void imprimirPessoa() {
  imprimir();
  print('Tudo bem?');
}

void imprimirPessoaFuncao(Function funcao) {
  funcao();
  print('Tudo bem?');
}

void imprimirOla(String nome, int opcao) {
  print('Olá, $nome.');

  if (opcao == 0) {
    print('Tudo bem?');
  } else {
    print('Como vai?');
  }
}

void imprimirOlaNomeado({String nome, int opcao}) {
  print('Olá, $nome.');

  if (opcao == 0) {
    print('Tudo bem?');
  } else {
    print('Como vai?');
  }
}

void imprimirOlaOpcional(String nome, [int opcao = 0]) {
  print('Olá, $nome.');

  if (opcao == 0) {
    print('Tudo bem?');
  } else {
    print('Como vai?');
  }
}

void imprimirOlaTernario(String nome, [int opcao = 0]) {
  print('Olá, $nome.');
  var mensagem = (opcao == 0) ? 'Tudo bem?' : 'Como vai?';
  print(mensagem);
}

void imprimirOlaTernarioInterpolacao(String nome, [int opcao = 0]) {
  print('Olá, $nome. ${(opcao == 0) ? 'Tudo bem?' : 'Como vai?'}');
}

// função sem retorno e sem parâmetro
void imprimir() {
  print('Olá, pessoal.');
}

void imprimir2() {
  print('Bom dia!');
}

// função sem retorno e com  parâmetro
void imprimirNome(String nome) {
  print('Olá, $nome.');
}

// função com retorno e sem parâmetro
String devolverOla() {
  return 'Olá, pessoal.';
}

String devolverOla2() => 'Olá, pessoal.';

// função com retorno e com parâmetro
String devolverOlaNome(String nome) {
  return 'Olá, $nome.';
}
