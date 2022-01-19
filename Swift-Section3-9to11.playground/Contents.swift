import UIKit

// Loops (Döngüler)

// While Loop

5 == 5
5 == 4
5 != 4

3 < 9
3 < 2
2 > 1
2 >= 2
10 <= 10

var x = 0

x = x + 1
x += 1

x = 0

print("Döngü başladı")
while x < 10 {
    
    print(x)
    x += 1
    
}
print("Döngü bitti")

// For Loop

var myArray = ["Erdem", "Sevda", "Yüksel", "Fatma"]

print(myArray[0])

for isim in myArray {
    
    print(isim.uppercased())
    
}


var numaraDizisi = [10,20,30,40,50,60,70,80,90]

numaraDizisi[0] / 5 * 3

for eleman in numaraDizisi {
    
    print(eleman / 5 * 3)
    
}

for num in 1 ... 10 {
    print(num)
}


// If Kontrolleri (If Statement)

3 == 3

// AND &&
// OR ||

3 == 3 && 4 == 4
3 != 3 && 4 == 4
3 != 3 || 4 == 4
3 != 3 || 4 != 4

var myAge = 50

if myAge < 20 {
    print("Çok gençsin")
} else if myAge > 20 && myAge < 30 {
    print("20'lerindesin")
} else if myAge > 30 && myAge < 40 {
    print("30'larındasın")
} else {
    print("Kırk yaşından büyüksün")
}


