import 'dart:convert';
import 'dart:math';

class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }

  void setAvg() => avg = (kor + eng + math) / 3.0;
}

void main() {
  var alist = <Student>[];

  for (int i = 0; i < 10; i++) {
    Student a = Student();
    a.name = AsciiDecoder().convert([65 + i]); // A, B, C...
    a.setAvg();
    alist.add(a);
  }

  print('이름 국어 영어 수학 평균  비교');
  print('----------------------------------------');

  // 평균 기준으로 정렬
  var sortedList = List<Student>.from(alist);
  sortedList.sort((a, b) => b.avg.compareTo(a.avg));

  for (var i in sortedList) {
    String str = i.name.padLeft(4) +
        i.kor.toString().padLeft(5) +
        i.eng.toString().padLeft(5) +
        i.math.toString().padLeft(5) +
        i.avg.toStringAsFixed(2).padLeft(8);

    if (i.avg >= 50) {
      str += "  PASS".padLeft(5);
    } else {
      str += "  FAIL".padLeft(5);
    }

    print(str);
  }
}
