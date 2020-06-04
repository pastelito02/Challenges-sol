//Author go_coder
package main

import (
    "bufio"
    "crypto/rsa"
    "errors"
    "fmt"
    "log"
    "math/big"
    "os"
    "strconv"
)

func main() {
    r := bufio.NewReader(os.Stdin)
    n := new(big.Int)
    cipher := new(big.Int)
    _, err := fmt.Fscan(r, n, cipher)
    if err != nil {
        log.Fatal(err)
    }
    log.Println("n:", n)
    log.Println("cipher:", cipher)
    const E = 65537
    priv, err := findPrivate(n, E)
    if err != nil {
        log.Fatal(err)
    }

    message, err := decrypt(priv, cipher)
    if err != nil {
        log.Fatal(err)
    }
    log.Println("message:", message)

    final, err := decode(message)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println(final)
}

func findPrivate(n *big.Int, e int) (*rsa.PrivateKey, error) {
    p := new(big.Int)
    q := new(big.Int)
    naiveFermatFactor(p, q, n)
    log.Println("p:", p)
    log.Println("q:", q)
    return makePrivate(p, q, e)
}

/* Wikipedia has:
FermatFactor(N): // N should be odd
    a ← ceil(sqrt(N))
    b2 ← a*a - N
    while b2 is not a square:
        a ← a + 1    // equivalently: b2 ← b2 + 2*a + 1
        b2 ← a*a - N //               a ← a + 1
    endwhile
    return a - sqrt(b2) // or a + sqrt(b2)
*/

func naiveFermatFactor(p, q, n *big.Int) {
    // Not even remotely optimized.
    a := new(big.Int).Sqrt(n)
    a.Add(a, bigOne)             // a ← floor(√n)+1
    b2 := new(big.Int).Mul(a, a) //
    b2.Sub(b2, n)                // b ← a² - n
    b := new(big.Int)
    tmp := new(big.Int)
    for {
        b.Sqrt(b2)
        tmp.Mul(b, b)
        if tmp.Cmp(b2) == 0 {
            break
        }
        // b2 ← b2 + 2×a + 1
        b2.Add(b2, a)
        b2.Add(b2, a)
        b2.Add(b2, bigOne)
        a.Add(a, bigOne)
    }
    p.Sub(a, b)
    q.Add(a, b)
}

// The rest is straight from Problem #152 RSA:

var bigOne = big.NewInt(1)

func makePrivate(p, q *big.Int, e int) (*rsa.PrivateKey, error) {
    // Parts borrowed from crypto/rsa/rsa.go GenerateKey

    priv := new(rsa.PrivateKey)
    priv.E = e
    priv.Primes = []*big.Int{p, q}

    n := new(big.Int).Set(bigOne)
    totient := new(big.Int).Set(bigOne)
    pminus1 := new(big.Int)
    for _, prime := range priv.Primes {
        n.Mul(n, prime)
        pminus1.Sub(prime, bigOne)
        totient.Mul(totient, pminus1)
    }

    g := new(big.Int)
    priv.D = new(big.Int)
    y := new(big.Int)
    bige := big.NewInt(int64(priv.E))
    g.GCD(priv.D, y, bige, totient)

    if g.Cmp(bigOne) != 0 {
        return nil, errors.New("invalid p, q, e combination")
    }

    if priv.D.Sign() < 0 {
        priv.D.Add(priv.D, totient)
    }
    priv.N = n

    return priv, nil
}

func decrypt(priv *rsa.PrivateKey, c *big.Int) (*big.Int, error) {
    // Like crypto/rsa/rsa.go decrypt() but without blinding
    // and without using CRT with precomputed values.
    if c.Cmp(priv.N) > 0 {
        return nil, rsa.ErrDecryption
    }
    return new(big.Int).Exp(c, priv.D, priv.N), nil
}

func decode(m *big.Int) (string, error) {
    // XXX ick! What a silly encoding, not worth
    // doing a good implementation of decoding.
    mstr := m.String()
    b := make([]byte, 0, len(mstr)/2+1)
    for i := 0; i < len(mstr)-1; i += 2 {
        if mstr[i:i+2] == "00" {
            return string(b), nil
        }
        c, err := strconv.ParseInt(mstr[i:i+2], 10, 8)
        if err != nil {
            return "", err
        }
        b = append(b, byte(c))
    }
    return "", errors.New(`terminating "00" not found`)
}