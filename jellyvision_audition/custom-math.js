// Globals
var AdvancedMath, BasicMath;

BasicMath = function () {};

BasicMath.prototype.add = function (x, y) {
  return x + y;
};

BasicMath.prototype.subtract = function (x, y) {
  return this.add(x, -y);
};

BasicMath.prototype.multiply = function (x, y) {
  var product = 0;
  for (var i = 0; i < y; i = (i + 1)) {
    product = this.add(product, x);
  };
  return product;
};

BasicMath.prototype.divide = function (dividend, divisor) {
  var quotient = 0;
  if (divisor === 0) { return Infinity };
  while (dividend >= divisor) {
    quotient = (quotient + 1);
    dividend = this.subtract(dividend, divisor);
  };
  return quotient;
};


AdvancedMath = function () {
  BasicMath.call(this);
};

AdvancedMath.prototype = new BasicMath();

AdvancedMath.prototype.posPower = function (base, exponent) {
  var power = 0;
  if (exponent === 0) {
    power = 1;
  } else {
    for (var i = 1; i < exponent; i = (i + 1)) {
      power = this.multiply(power || base, base);
    };
  }
  return power;
}

AdvancedMath.prototype.isRightTriangle = function (sideA, sideB, sideC) {
  var squareA, squareB, squareC;
  squareA = this.posPower(sideA, 2);
  squareB = this.posPower(sideB, 2);
  squareC = this.posPower(sideC, 2);
  return this.add(squareA, squareB) === squareC;
}


// Tests
var advancedMath,
    advancedSum,
    basicMath,
    difference,
    fakeTriangle,
    negativePower,
    power,
    product,
    quotient,
    rightTriangle,
    square,
    sum,
    wrongTriangle,
    zeroPower,
    zeroQuotient;

basicMath = new BasicMath();
advancedMath = new AdvancedMath();

sum = basicMath.add(1, 2);
advancedSum = basicMath.add(10, 4);
difference = basicMath.subtract(2, 3);
product = basicMath.multiply(2, 5);
quotient = basicMath.divide(12, 4);
zeroQuotient = basicMath.divide(0, 2);
infinityQuotient = basicMath.divide(2, 0);

power = advancedMath.posPower(2, 5);
negativePower = advancedMath.posPower(2, -1);
zeroPower = advancedMath.posPower(2, 0);
square = advancedMath.posPower(6, 2);
rightTriangle = advancedMath.isRightTriangle(3, 4, 5);
wrongTriangle = advancedMath.isRightTriangle(3, 3, 3);
fakeTriangle = advancedMath.isRightTriangle(3, 4, -5);


console.log('basicMath.add(1, 2) ===', sum, sum === 3);
console.log('basicMath.subtract(2, 3) ===', difference, difference === -1);
console.log('basicMath.multiply(2, 5) ===', product, product === 10);
console.log('basicMath.divide(12, 4) ===', quotient, quotient === 3);
console.log('basicMath.divide(0, 2) ===', zeroQuotient, zeroQuotient === 0);
console.log('basicMath.divide(2, 0) ===', infinityQuotient, infinityQuotient === Infinity);
console.log('')
console.log('advancedMath.add(10, 4) ===', advancedSum, advancedSum === 14);
console.log('advancedMath.posPower(2, 5) ===', power, power === 32);
console.log('advancedMath.posPower(6, 2) ===', square, square === 36);
console.log('advancedMath.posPower(2, -1) ===', negativePower, negativePower === 0);
console.log('advancedMath.posPower(2, 0) ===', zeroPower, zeroPower === 1);
console.log('advancedMath.isRightTriangle(3, 4, 5) ===', rightTriangle, rightTriangle === true);
console.log('advancedMath.isRightTriangle(3, 3, 3) ===', wrongTriangle, wrongTriangle === false);
console.log('advancedMath.isRightTriangle(3, 4, -5) ===', fakeTriangle, fakeTriangle === false);
