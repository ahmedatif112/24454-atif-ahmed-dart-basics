// Student: Ahmed Atif
// Reg no: 24454
const String regNo = '24454';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by AA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by AA
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) result = ',' + result;
    i--;
  }
  String sign = negative ? '-' : '';
  return sign + result + ' RWF';
}

bool isValidPin(String pin) {
  // by AA
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    int c = pin.codeUnitAt(i);
    if (c < 48 || c > 57) return false;
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  return !allSame;
}

int sendMoney(int balance, int amount) {
  // by AA
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by AA
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be between 100 and 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AA
  print('Reg no: $regNo | D = $d | T = $t');

  String pinWithD = '4821$d';
  print('PIN 12345 -> ${isValidPin('12345')}');
  print('PIN 77777 -> ${isValidPin('77777')}');
  print('PIN 4821 -> ${isValidPin('4821')}');
  print('PIN 48a21 -> ${isValidPin('48a21')}');
  print('PIN $pinWithD -> ${isValidPin(pinWithD)}');

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');

  // My own tests (expected output in the comment)
  print(formatRwf(100000)); // expect: 100,000 RWF
  print(formatRwf(1000000)); // expect: 1,000,000 RWF
  print(formatRwf(-1000)); // expect: -1,000 RWF  (could break: comma after minus sign)
  print(isValidPin('00000')); // expect: false (same digit five times)
  print(isValidPin('01234')); // expect: true (leading zero is still a digit)
  print(isValidPin('4821 ')); // expect: false (a space is not a digit)
}
