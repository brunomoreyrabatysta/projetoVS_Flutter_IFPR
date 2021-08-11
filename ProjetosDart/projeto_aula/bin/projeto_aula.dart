void main(List<String> arguments) {
  //List<String> nomes = new List<String>();
  //var nomes = <String>[];
  var nomes = ['Joaquim', 'Maria', 'Ana', 'Rivaldo', 'Narci', 'Paula'];
  nomes.add('Pedro');
  nomes.insert(0, 'Rebeca');
  nomes.removeAt(1);
  var quantidadeElementos = nomes.length;

  //print(nomes[5]);
  print(nomes);
  print(quantidadeElementos);

  print('While');
  var contador = 0;
  while (contador < quantidadeElementos) {
    print(nomes[contador]);
    contador++;
  }

  print('\nDO While');
  contador = 0;
  do {
    print(nomes[contador]);
    contador++;
  } while (contador < quantidadeElementos);

  print('\nFor');
  for (var cont = 0; cont < quantidadeElementos; cont++) {
    print(nomes[cont]);
  }

  print('\nForeach');
  for (var nome in nomes) {
    print(nome);
  }

  print('\nForeach lista com função nomeada');
  nomes.forEach(Imprimir);

  print('\nForeach lista com função anônima');
  nomes.forEach((nome) {
    print(nome);
  });

  print('\nForeach lista com função anônima');
  nomes.forEach((nome) => print(nome));

  print('\nForeach lista com função anônima');
  nomes.forEach(print);
}

// coleções -> listas, mapas, filas e conjuntos
void Imprimir(String nome) {
  print(nome);
}
