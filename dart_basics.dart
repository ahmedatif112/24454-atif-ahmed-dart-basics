// Student: Ahmed Atif
// Reg no: 24454
const String regNo = '24454';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by AA
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) count++;
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by AA
  String result = '';
  for (String word in fullName.split(' ')) {
    if (word.isNotEmpty) {
      result += '${word[0].toUpperCase()}.';
    }
  }
  return result;
}

void drawTriangle(int height) {
  // by AA
  int row = 1;
  while (row <= height) {
    String ch = row.isOdd ? '*' : '#';
    print(' ' * (height - row) + ch * row);
    row++;
  }
}

int momoFee(int amount) {
  // by AA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by AA
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*' * (phone.length - 5) + phone.substring(phone.length - 2);
}

void main() {
  // by AA
  print('Reg no: $regNo | D = $d | T = $t');
  String name = 'Ahmed Atif';
  print('$name has ${countVowels(name)} vowels');
  print(initials(name));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
