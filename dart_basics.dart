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

void main() {
  // by AA
  print('Reg no: $regNo | D = $d | T = $t');
  String name = 'Ahmed Atif';
  print('$name has ${countVowels(name)} vowels');
  print(initials(name));
  print(initials(' ana uwase '));
  print(initials(' '));
}
