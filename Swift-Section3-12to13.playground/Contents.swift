import UIKit

func ornekFonksiyon() {
    print("Ornek")
}

ornekFonksiyon()

func myFunc(a: String) {
    print(a)
}

myFunc(a: "Erdem")


func toplama(x: Int, y: Int) -> Int {
    print(x + y)
    
    return x + y
}

toplama(x: 10, y: 20)

var numara = toplama(x: 20, y: 30)


func carpma(a: Int, b: Int) -> Int {
    return a * b
}

var carpmaSonucu = carpma(a: 5, b: 8)
print(carpmaSonucu)

func logicFunction(x: Int, y: Int) -> Bool {
    if x > y {
        return true
    } else {
        return false
    }
}

logicFunction(x: 5, y: 3)
logicFunction(x: 1, y: 3)


// Opsiyoneller (Optionals)

var benimIsmim : String?

benimIsmim?.uppercased()

benimIsmim = "Erdem"

benimIsmim?.uppercased()

var kullaniciNumarasi = "apple"

// Force Unwrapping
//var sonuc = Int(kullaniciNumarasi)! * 5

var sonuc = (Int(kullaniciNumarasi) ?? 1) * 5

if let yeniSonuc = Int(kullaniciNumarasi) {
    yeniSonuc * 5
} else {
    print("Sadece rakam gir lütfen")
}
