class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Tu hucha virtual',
      image: 'assets/savings.svg',
      description:
          "Con PigSafe dispondrás de una hucha personal, en la cual podrás añadir los ahorros que quieras y romperla cuando decidas de que ya es hora de gastarlo."),
  UnbordingContent(
      title: 'Cumple tus metas',
      image: 'assets/goal.svg',
      description:
          "Proponte un nuevo objetivo personal, como pueden ser unas vacaciones, un coche nuevo o ¡una PlayStation 5!"
          "Tendrás un control sobre tus metas y podrás saber cuánto te queda por cumplirlas."),
  UnbordingContent(
      title: '¡Empieza ya!',
      image: 'assets/rocket.svg',
      description:
          "No esperes más y empieza ya a ahorrar, pulsando en Continuar te pediremos tus datos de acceso, si no tienes una cuenta creada todavía "
          "podrás registrarte en el botón de Registrarse ahora"),
];
