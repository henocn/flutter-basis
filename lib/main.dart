
void main() {

  // les types primitifs de variables en dart
  int n = 10;
  String name = "Henoc";
  bool isStudent = true;


  // vu qu'on est obligé d'assigner une valeur a la déclaration, si jamais on a besinn d'une valeur nule
  // on peux autoriser avec un ? pour permettre un null
  int ? axe = 13;


  // permet de créer une variables de tye dynamic qui sera modifiable par la suite dans le code 
  dynamic test = 12.7162;

  test = 12;
  test = "String";

  test = false;

  print(test);

  // inférence de type var décratation et detection automatique de type dans le reste du code
  // Mais si aucune valeur n'est mise il peut avoir le meme comportement que dynamic
  var age;

  age = 18;
  print(age);

  age = "Hello";
  print(age);

  // déclaration des variables late permet de retarder l'initialisation des variables
  // ce qui n'est pas le cas dans le cas des int float doubles, String
  late String salutation;



  // le type final et const sont des manières pour reseigner les constantes
  // la différence est que final peux declarer et ensuite au moment de l'execution on peux affecter
  // Mais avec sont on est obligé de le faire directement a la déclaration;
  final int note = 5;
  const int distance = 5;


  // les instructions ternaires
  bool estMajeur = age == "18" ? true : false;
  print(estMajeur);


  // déclaration des listes en dart 
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  // parcour via les index du tableau
  for (int i = 0; i < numbers.length - 1; i++){
    print(numbers[i]);
  }

  // une autre façon de parcourir les element d'un tableau 
  for (int number in numbers){
    print(number);
  }

  // utilisation de while et do while comme en C/C++

  





}

