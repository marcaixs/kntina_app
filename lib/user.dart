class User {
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  List orderHistory;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    this.orderHistory = const [],
  });


 
}

final testUser = User(
  name: 'Maria Pérez',
  email: 'maria@example.com',
  phone: '+34 600 123 456',
  profileImage: 'assets/images/profile.jpg',
  orderHistory: [{
    "id": "KH54821",
    "date": "24 de octubre de 2025",
    "price": 27.6,
    "status": "en camino",
    "products" : [
      {
            "id": 1,
            "images": [
                "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg",
                "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg",
                "https://testback.apiabalit.com/kntina/img/Espaguetis-Carbonara.jpg"
            ],
            "title": "Espaguetis a la Carbonara",
            "description": "Clásico plato de espaguetis con salsa carbonara hecha de huevo, queso y panceta.",
            "price": 12.99,
            "category": {
                "id": 1,
                "name": "Pasta"
            }
        },
        {
            "id": 2,
            "images": [
                "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg",
                "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg",
                "https://testback.apiabalit.com/kntina/img/lasagna-vegetariana-con-espinacas.jpg"
            ],
            "title": "Lasaña Vegetariana",
            "description": "Lasaña con capas de pasta, salsa de tomate, espinacas, y mezcla de quesos.",
            "price": 15.50,
            "category": {
                "id": 1,
                "name": "Pasta"
            }
        }
    ]
  }],
);