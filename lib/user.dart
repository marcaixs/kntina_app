class User {
  String name;
  String email;
  String phone;
  String profileImage;
  List orderHistory;

  String password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.password,
    this.orderHistory = const [],
  });
}

User testUser = User(
  name: 'Marrc Caixas',
  email: 'marc@example.com',
  phone: '+34 600 123 456',
  profileImage: 'assets/images/profile.jpg',
  password: '1234',
  orderHistory: [
    {
      "id": "KH54821",
      "date": "24 de octubre de 2025",
      "price": 27.6,
      "status": "en camino",
      "products": [
        {
          "id": 1,
          "images": [
            "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg",
            "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg",
            "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg",
          ],
          "title": "Espaguetis a la Carbonara",
          "description":
              "Clásico plato de espaguetis con salsa carbonara hecha de huevo, queso y panceta.",
          "price": 12.99,
          "category": {"id": 1, "name": "Pasta"},
        },
        {
          "id": 2,
          "images": [
            "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg",
            "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg",
            "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg",
          ],
          "title": "Lasaña Vegetariana",
          "description":
              "Lasaña con capas de pasta, salsa de tomate, espinacas, y mezcla de quesos.",
          "price": 15.50,
          "category": {"id": 1, "name": "Pasta"},
        },
      ],
    },
    {
      "id": "KH53333",
      "date": "26 de octubre de 2025",
      "price": 35.6,
      "status": "entregado",
      "products": [
        {
          "id": 4,
          "images": [
            "https://testback.apiabalit.com/kntina/img/Fetuccini-Alfredo.jpeg",
            "https://testback.apiabalit.com/kntina/img/Fetuccini-Alfredo.jpeg",
            "https://testback.apiabalit.com/kntina/img/Fetuccini-Alfredo.jpeg",
          ],
          "title": "Fettuccine Alfredo con Pollo",
          "description":
              "Fettuccine en salsa Alfredo cremosa, acompañada de pechuga de pollo.",
          "price": 16.75,
          "category": {"id": 1, "name": "Pasta"},
        },
        {
          "id": 5,
          "images": [
            "https://testback.apiabalit.com/kntina/img/Penne_Arrabbiata.jpg",
            "https://testback.apiabalit.com/kntina/img/Penne_Arrabbiata.jpg",
            "https://testback.apiabalit.com/kntina/img/Penne_Arrabbiata.jpg",
          ],
          "title": "Penne Arrabbiata",
          "description":
              "Pasta penne con salsa arrabbiata picante hecha con tomates y chiles.",
          "price": 10.50,
          "category": {"id": 1, "name": "Pasta"},
        },
        {
          "id": 6,
          "images": [
            "https://testback.apiabalit.com/kntina/img/espaguetis-con-almejas.jpg",
            "https://testback.apiabalit.com/kntina/img/espaguetis-con-almejas.jpg",
            "https://testback.apiabalit.com/kntina/img/espaguetis-con-almejas.jpg",
          ],
          "title": "Linguini con Almejas",
          "description":
              "Linguini con almejas frescas en una ligera salsa de ajo y vino blanco.",
          "price": 18.00,
          "category": {"id": 1, "name": "Pasta"},
        },
        {
          "id": 7,
          "images": [
            "https://testback.apiabalit.com/kntina/img/Parrilla-de-Verduras-Asadas.jpg",
            "https://testback.apiabalit.com/kntina/img/Parrilla-de-Verduras-Asadas.jpg",
            "https://testback.apiabalit.com/kntina/img/Parrilla-de-Verduras-Asadas.jpg",
          ],
          "title": "Verduras Asadas",
          "description":
              "Mix de verduras frescas asadas al horno con hierbas y aceite de oliva.",
          "price": 9.50,
          "category": {"id": 2, "name": "Verduras"},
        },
      ],
    },
  ],
);
