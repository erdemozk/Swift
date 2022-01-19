import UIKit

// Collections, Koleksiyonlar

var firstArray = ["Erdem", "Sevda", "Mehmet", "Sefercan", "Fatma"]

// Index

firstArray[4].uppercased()

firstArray[2] = "Yüksel"
firstArray[2]

var secondArray = [10, 20, 30, 40]
secondArray[1] * 5 / 10

var mixArray = [100, 200, "Erdem", true, false] as [Any]

// as -> casting, any -> any object

var newArray = mixArray[2] as! String

mixArray.append("Sevda")
mixArray.count
mixArray[mixArray.count - 2]
mixArray.last

var numbersArray = [5, 2, 1, 6, 9, 10]

numbersArray.sort()

var stringsArray = ["a", "j", "b", "o", "d"]

stringsArray.sort()

// Set

var numaralar = [1,1,1,1,2,3,4,5,6]

var numaraSeti: Set = [1,1,1,1,2,3,4,5,6]

var siparislerDizisi = ["Istanbul","Istanbul","Istanbul","Ankara","Adana"]

siparislerDizisi.count

var siparislerSeti = Set(siparislerDizisi)

siparislerSeti.count

let birinciSet: Set = [40,50,60]
let ikinciSet: Set = [50,60,70]

let birlesimSeti = birinciSet.union(ikinciSet)

// Dictionary - Sözlük
// key-value pairing

let meyveDizisi = ["armut", "muz", "elma", "karpuz"]
let kaloriDizisi = [100, 150, 120, 300]

meyveDizisi[2]
kaloriDizisi[2]

var meyveKaloriDictionary = ["Armut": 100, "Muz": 150, "Elma": 120, "Karpuz": 300]

meyveKaloriDictionary["Armut"]
meyveKaloriDictionary.keys
meyveKaloriDictionary.values

meyveKaloriDictionary["Muz"] = 200

var yeniSozluk = [20: 30.2, 30: 40.4]

