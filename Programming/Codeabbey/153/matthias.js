//Author matthias
var Long = function(string) {
  var thisLong = this;
  var value = "0";
  var add = function(a, b) {
    var s = "";
    var carry = 0;
    var i = a.length;
    var j = b.length;
    while (i > 0 || j > 0) {
      i--; j--;
      var sum = carry;
      if (i >= 0) sum += a.charCodeAt(i) - "0".charCodeAt(0);
      if (j >= 0) sum += b.charCodeAt(j) - "0".charCodeAt(0);
      s = (sum % 10) + s;
      carry = Math.floor(sum / 10);
    }
    if (carry > 0) s = carry + s;
    return s;
  }
  var sub = function(a, b) {
    var s = "";
    var carry = 0;
    var i = a.length;
    var j = b.length;
    while (i > 0 || j > 0) {
      i--; j--;
      var sum = -carry;
      if (i >= 0) sum += a.charCodeAt(i) - "0".charCodeAt(0);
      if (j >= 0) sum -= b.charCodeAt(j) - "0".charCodeAt(0);
      if (sum >= 0) {
        s = sum + s;
        carry = 0;
      }
      else {
        s = (10 + sum) + s;
        carry = 1;
      }
    }
    while (s.charAt(0) == "0" && s.length > 1)
      s = s.substr(1);
    if (carry > 0) s = "-" + s;
    return s;
  }
  var mul1 = function(a, digit) {
    var s = "";
    var carry = 0;
    var i = a.length;
    while (i > 0) {
      i--;
      var sum = carry;
      sum += (a.charCodeAt(i) - "0".charCodeAt(0)) * digit;
      s = (sum % 10) + s;
      carry = Math.floor(sum / 10);
    }
    if (carry > 0) s = carry + s;
    return s;
  }
  var mul = function(a, b) {
    var s = "";
    var sum = "0";
    var i = b.length;
    while (i > 0) {
      i--;
      sum = add(sum, mul1(a, b.charCodeAt(i) - "0".charCodeAt(0)) + s);
      s += "0";
    }
    return sum;
  }
  var div = function(a, b) {
    var n = a.length - b.length;
    if (n < 0) return "0";
    var x = new Long(a);
    var y = new Long(b + "0".repeat(n));
    var r = new Long(0);
    while (true) {
      while (x.cmp(y) >= 0) {
        x = x.sub(y);
        r = r.add(new Long(1));
      }
      if (n > 0) {
        n--;
        y = new Long(b + "0".repeat(n));
        r = r.mul(new Long(10));
      }
      else
        break;
    }
    return r.toString();
  }
  this.add = function(long) {
    if (isNaN(value) || isNaN(long.value())) return new Long(NaN);
    var s1 = thisLong.sign();
    var s2 = long.sign();
    if (s1 == 0) return long.copy();
    if (s2 == 0) return thisLong.copy();
    var a1 = thisLong.abs();
    var a2 = long.abs();
    if (s1 * s2 > 0)
      return new Long((s1 < 0 ? "-" : "") + add(a1.toString(), a2.toString()));
    else
      if (s1 < 0)
        return a2.sub(a1);
      else
        return a1.sub(a2);
  }
  this.sub = function(long) {
    if (isNaN(value) || isNaN(long.value())) return new Long(NaN);
    var s1 = thisLong.sign();
    var s2 = long.sign();
    if (s1 == 0) return new Long("-" + long.toString());
    if (s2 == 0) return thisLong.copy();
    var a1 = thisLong.abs();
    var a2 = long.abs();
    if (s1 * s2 > 0)
      if (a1.cmp(a2) > 0)
        return new Long((s1 < 0 ? "-" : "") + sub(a1.toString(), a2.toString()));
      else
        return new Long((s1 > 0 ? "-" : "") + sub(a2.toString(), a1.toString()));
    else
      if (s1 < 0)
        return new Long("-" + a1.add(a2).toString());
      else
        return a1.add(a2);
  }
  this.mul = function(long) {
    if (isNaN(value) || isNaN(long.value())) return new Long(NaN);
    var s1 = thisLong.sign();
    var s2 = long.sign();
    if (s1 == 0 || s2 == 0) return new Long(0);
    var a1 = thisLong.abs();
    var a2 = long.abs();
    return new Long((s1 * s2 < 0 ? "-" : "") + mul(a1.toString(), a2.toString()));
  }
  this.cmp = function(long) {
    if (isNaN(value) && isNaN(long.value())) return 0;
    if (isNaN(value) || isNaN(long.value())) return undefined;
    if (value == long.value) return 0;
    var s1 = thisLong.sign();
    var s2 = long.sign();
    if (s1 < s2) return -1;
    if (s1 > s2) return 1;
    var a1 = thisLong.abs().toString();
    var a2 = long.abs().toString();
    if (a1.length < a2.length) return -1;
    if (a1.length > a2.length) return 1;
    return a1.localeCompare(a2);
  }
  this.div = function(long) {
    if (isNaN(value) || isNaN(long.value())) return new Long(NaN);
    var s1 = thisLong.sign();
    var s2 = long.sign();
    if (s2 == 0) return new Long(NaN);
    if (s1 == 0) return new Long(0);
    var a1 = thisLong.abs();
    var a2 = long.abs();
    return new Long((s1 * s2 < 0 ? "-" : "") + div(a1.toString(), a2.toString()));
  }
  this.mod = function(long) {
    var div = thisLong.div(long);
    return thisLong.sub(long.mul(div));
  }
    this.sqrt = function() {
        if (isNaN(value) || thisLong.sign() < 0) return new Long(NaN);
        var x = thisLong.copy();
        var delta = [new Long(0), new Long(0)];
        while (true) {
            var next = thisLong.div(x).add(x).div(new Long(2));
            delta[0] = delta[1];
            delta[1] = next.sub(x);
            x = next;
            if (delta[1].sign() == 0 || (delta[0].toString() == "1" && delta[1].toString() == "-1"))
                break;
        }
        return x;
    }
  this.value = function() {
    return isNaN(value) ? NaN : ("" + value);
  }
  this.abs = function() {
    return isNaN(value) ? NaN : new Long(value.substring(value.charAt(0) == "-" ? 1 : 0));
  }
  this.sign = function() {
    if (isNaN(value)) return undefined;
    if (value.charAt(0) == "-") return -1;
    if (value == "0") return 0;
    return 1;
  }
  this.fromString = function(string) {
    value = "";
    for (var i = 0; i < string.length; i++) {
      var ok = true;
      switch (string.charAt(i)) {
        case "-":
          ok = value == "";
          break;
        case "0": case "1": case "2": case "3": case "4": 
        case "5": case "6": case "7": case "8": case "9":
          ok = value != "0" && value != "-0";
          break;
        default:
          ok = false;
      }
      if (ok)
        value += string.charAt(i);
      else {
        value = NaN;
        return;
      }
      if (value == "-0") value = "0";
    }
  }
  this.toString = function() {
    return "" + value;
  }
  this.copy = function() {
    return new Long(thisLong.toString());
  }
  if (string != undefined) this.fromString("" + string);
}

var FiniteField = function(modulus) {
    var thisFiniteField = this;
    this.modulus = new Long(modulus);
    this.add = function(a, b) {
        if (typeof(a) != Long) a = new Long(a);
        if (typeof(b) != Long) b = new Long(b);
        var result =  a.add(b);
        result = result.mod(thisFiniteField.modulus);
        if (result.sign() < 0) result = result.add(thisFiniteField.modulus);
        return result;
    }
    this.sub = function(a, b) {
        if (typeof(a) != Long) a = new Long(a);
        if (typeof(b) != Long) b = new Long(b);
        var result =  a.sub(b);
        result = result.mod(thisFiniteField.modulus);
        if (result.sign() < 0) result = result.add(thisFiniteField.modulus);
        return result;
    }
    this.mul = function(a, b) {
        if (typeof(a) != Long) a = new Long(a);
        if (typeof(b) != Long) b = new Long(b);
        var result =  a.mul(b);
        result = result.mod(thisFiniteField.modulus);
        if (result.sign() < 0) result = result.add(thisFiniteField.modulus);
        return result;
    }
    this.div = function(a, b) {
        return thisFiniteField.mul(a, thisFiniteField.inv(b));
    }
    this.power = function(base, exponent) {
        if (typeof(base) != Long) base = new Long(base);
        if (typeof(exponent) != Long) exponent = new Long(exponent);
    base = base.mod(thisFiniteField.modulus);
        if (base.sign() < 0) base.add(thisFiniteField.modulus);
    var result = new Long(1);
    while (exponent.sign() > 0) {
      if (exponent.mod(new Long(2)).sign() != 0)
        result = result.mul(base).mod(thisFiniteField.modulus);
      exponent = exponent.div(new Long(2));
      base = base.mul(base).mod(thisFiniteField.modulus);
    }
    return result;
  }
    this.inv = function(a) {
    if (typeof(a) != Long) a = new Long(a);
        var b = thisFiniteField.modulus;
        a = a.mod(b);
        var pre = [new Long(1), new Long(0)];
    var cur = [new Long(0), new Long(1)];
    while (true) {
      var q = b.div(a);
      var r = b.mod(a);
      var next = [pre[0].sub(q.mul(cur[0])), pre[1].sub(q.mul(cur[1]))];
      if (r.sign() > 0) {
        b = a.copy();
        a = r.copy();
        pre = cur;
        cur = next;
      }
      else
                break;
    }
        if (a.toString() != "1") return new Long(NaN);
        a = cur[1].mod(thisFiniteField.modulus);
        if (a.sign() < 0) a = a.add(thisFiniteField.modulus);
        return a;
  }
}

var RSA = function(p, q) {
    var thisRSA = this;
    this.p = p;
    this.q = q;
    this.e = 65537;
    this.decrypt = function(text) {
        var p = new Long(thisRSA.p);
        var q = new Long(thisRSA.q);
        var n = p.mul(q);
        var phi = n.sub(p).sub(q).add(new Long(1));
        var field = new FiniteField(phi);
        var d = field.inv(thisRSA.e);
        field = new FiniteField(n);
        return field.power(text, d).toString();
    }
    this.encrypt = function(text) {
        var p = new Long(thisRSA.p);
        var q = new Long(thisRSA.q);
        var n = p.mul(q);
        var field = new FiniteField(n);
        return field.power(text, thisRSA.e).toString();
    }
}

with (CodeAbbey.solution) {

  parseInput = function(data) {
    var rows = data.split("\n");
    input = {
      n: rows[0],
            cipher: rows[1]
    };
  }

    decipher = function(number) {
        number = "" + number;
        var text = "";
        while (number.length > 0) {
            var char = number.substr(0, 2);
            if (char == "00") break;
            text += String.fromCharCode(char);
            number = number.substr(2);
        }
        return text;
    }

  solve = function() {
        var isSquare = function(b2) {
            var r = b2.sqrt();
            return b2.cmp(r.mul(r)) == 0;
        }
        var n = new Long(input.n);
        var a = n.sqrt();
        var b2 = a.mul(a).sub(n);
        while (!isSquare(b2)) {
            a = a.add(new Long(1));
            b2 = a.mul(a).sub(n);
        }
        var b = b2.sqrt();
        var p = a.add(b);
        var q = a.sub(b);
        console.log("p: " + p + "\nq: " +q);
        var rsa = new RSA(p, q);
        result = decipher(rsa.decrypt(input.cipher));
  }

  writeResult = function() {
    return result;
  }

}
