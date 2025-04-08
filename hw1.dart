import 'dart:io';

int sumDigits(int n) {
  int total = 0;
  while (n > 0) {
    total += n % 10;
    n ~/= 10;
  }
  return total;
}

void main() {
  stdout.write('정수를 입력하세요: ');
  int? input = int.tryParse(stdin.readLineSync()!);

  if (input == null) {
    print(' 숫자를 입력해주세요.');
  } else if (input < 0) {
    print('입력된 음수 그대로 출력: $input');
  } else {
    int result = sumDigits(input);
    print('각 자리수의 합: $result');
  }
}
