import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  uplodImage() {
    firebaseFirestore.collection("shoes").doc().set(
      {
        "items": [
          {
            //Nike
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FJordan%20Shoes%20Normal%20(1).png?alt=media&token=c1716eae-0b32-44b2-8117-287d737e4074",
            "name": "Jordan 1 Retro Green",
            "price": "200",
            "brand": "nike",
            "rating": 4.5,
            "gender": "unisex",
            "color": "green",
            "size": 41,
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FNike%20Shoes%20Normal%20(2).png?alt=media&token=0d936ab0-743e-46cb-9312-0b8cd0d7be7a",
            "name": "Jordan 1 Retro High Tie Dye",
            "price": "250",
            "brand": "nike",
            "rating": 4.5,
            "size": 41,
            "gender": "unisex",
            "color": "green",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3.5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FNike%20Normal%20Shoes%20(5).png?alt=media&token=418d1304-b37c-4cbb-8649-033ba89f6fff",
            "name": "Jordan 1 Retro High Blue",
            "price": "300",
            "brand": "nike",
            "rating": 4.5,
            "size": 41,
            "gender": "male",
            "color": "blue",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FNike%20Normal%20Shoes%20(4).png?alt=media&token=d5fc5edc-29ed-498b-9f03-49aec5ae53aa",
            "name": "Jordan 1 Retro High Grey and Red",
            "price": "300",
            "brand": "nike",
            "rating": 4.5,
            "size": 41,
            "gender": "unisex",
            "color": "red",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FNike%20Normal%20Shoes%20(3).png?alt=media&token=4eba61d1-15cf-48fa-be13-67f76520b742",
            "name": "Jordan 1 Retro High Grey",
            "price": "350",
            "brand": "nike",
            "rating": 4.5,
            "size": 41,
            "gender": "female",
            "color": "grey",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FJordan%20Normal%20(1).png?alt=media&token=4f16119b-6422-4e7e-9f1e-10f34817812f",
            "name": "Jordan Red",
            "price": "350",
            "brand": "jordan",
            "rating": 4.5,
            "size": 41,
            "gender": "unisex",
            "color": "red",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FJordan%20Shoes%20Normal%20(1).png?alt=media&token=c1716eae-0b32-44b2-8117-287d737e4074",
            "name": "Jordan shoes",
            "price": "350",
            "brand": "jordan",
            "rating": 4.5,
            "size": 41,
            "gender": "male",
            "color": "white",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },

          //Adidas
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FAdidas%20Normal.png?alt=media&token=5c934c23-5b35-4d1e-aee7-0a113d0609c6",
            "name": "Adidas Grey",
            "price": "250",
            "brand": "adidas",
            "rating": 4.5,
            "size": 41,
            "gender": "male",
            "color": "grey",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FAdidas%20Normal%20Shoes.png?alt=media&token=fe601bf5-9aea-4817-92c7-bd3be739627e",
            "name": "Adidas Neon",
            "price": "250",
            "brand": "adidas",
            "rating": 4.5,
            "size": 41,
            "gender": "female",
            "color": "black",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3.5,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FAdidas%20Normal%20(1).png?alt=media&token=8223af1c-04b7-4e26-b829-e00394c46078",
            "name": "Adidas Sports",
            "price": "250",
            "brand": "adidas",
            "rating": 4.5,
            "size": 41,
            "gender": "male",
            "color": "black",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },

          //Reebok
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FReebok%202.png?alt=media&token=299178b1-48e6-44a2-8ca0-5adba202aaaf",
            "name": "Reebok shoe Black",
            "price": "200",
            "brand": "reebok",
            "rating": 5,
            "size": 41,
            "gender": "unisex",
            "color": "black",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
            ]
          },
          {
            "description":
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
            "image":
                "https://firebasestorage.googleapis.com/v0/b/shoesly-190b4.appspot.com/o/shoes%2FReebok.png?alt=media&token=72622698-369c-48e9-9b68-50a9c6460d70",
            "name": "Reebok shoe",
            "price": "235",
            "brand": "reebok",
            "rating": 4.5,
            "size": 41,
            "gender": "male",
            "color": "black",
            "review": [
              {
                "name": "Nolan Carder",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 4.5,
                "time": "06-09-2024"
              },
              {
                "name": "Maria Saris",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 5,
                "time": "06-09-2024"
              },
              {
                "name": "Gretchen Septimus",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 1,
                "time": "06-09-2024"
              },
              {
                "name": "Roger Stanton",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 2,
                "time": "06-09-2024"
              },
              {
                "name": "Hanna Levin",
                "review":
                    "Perfect for keeping your feat dry and warm in \ndamp condition",
                "rating": 3,
                "time": "06-09-2024"
              },
            ]
          },
        ]
      },
    );
  }
}
