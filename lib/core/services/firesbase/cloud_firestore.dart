import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // uplodImage() {
  //   firebaseFirestore
  //       .collection("shoes")
  //       .doc("reebok")
  //       .collection("normal2")
  //       .doc()
  //       .set({
  //     "description":
  //         "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
  //     "image": "gs://shoesly-190b4.appspot.com/shoes/reebok2.png",
  //     "name": "Reebok shoe",
  //     "price": "235",
  //     "rating": 4,
  //     "size": 41,
  //     "review": {},
  //   });
  // }
}
