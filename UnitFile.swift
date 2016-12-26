//
//  UnitFile.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2017 Aaron Nash. All rights reserved.
//

import Foundation
import UIKit


// MARK: Func to double
extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
// MARK: Ancient Conventional LENGTH Mesurements as ment by the Torah
var cm = 1
var meter = 100 * cm
var fingerBredth = 2 * cm
var handBreadth = 4 * fingerBredth
var cubit = 6 * handBreadth
var talmudicMile = 2000 * cubit
var persianMile = 4 * talmudicMile
var seet = 1 * handBreadth
var seetCapol = 2 * seet
var zeres = 3 * handBreadth
var kanah = 6 * cubit
var ris = 185 * meter
var stadiun = ris
var mahalechYom = 10 * persianMile
// MARK: Units of Area Rebbe Na'e
var cmSquare = 1
var mSquare = 1000 * cmSquare
var kmSquare = 100000 * mSquare
var squareFingerBredth = 4 * cmSquare
var squareHandBreadth = 64 * cmSquare
var squareCubit = 2304 * cmSquare
var beisRova = 24 * mSquare
var beisKav = 138 * mSquare
var beisSeea =  830 * mSquare
var beisSatayim = 100 * squareCubit * 50 * squareCubit
var beisKor = 17280 * mSquare
// MARK: Money (that's what I want)
var american$ = 1
var peruta = Double(american$) / 100
var kontrank = peruta * 2
var mesimas = peruta * 4
var isar = peruta * 8
var dupondium = isar * 2
var maa = 32 * peruta
var gera = maa
var istera = 96 * peruta
var tarpik = istera
var dinar$ = maa * 6
var zuz$ = dinar$
var shekelRabbi = dinar$ * 2
var beka = shekelRabbi
var sela$ = dinar$ * 4
var shekelKadosh = sela$
var goldDinar = 25 * dinar$
var maneh$ = 100 * dinar$
var talent$ = 60 * maneh$
// MARK: Weights
var gram = 1
var kilogram = gram * 1000
var pound = Double(kilogram) * 2.20462
var ounce = Double(gram) * 28.3495
var talent = 27 * kilogram
var maneh = Double(talent) * 0.01666666666
var tatimar = maneh / 2
var unkeya = 0.08 * maneh
var sela = unkeya / 2
var shekel = sela / 2
var dinar = maneh / 100
// MARK: Units of Volume
// MARK: Dry Mesures
var cmCubed = 1
var mCubed = cmCubed * 100000
var ml = 1 * cmCubed
var l = 1000 * ml
var cbeitzah = Double (cmCubed) * 57.6
var uklah = 1.2 * cbeitzah
var tomen = 3 * cbeitzah
var quarterKav = 6 * cbeitzah
var kav = 4 * quarterKav
var tarkav = 72 * cbeitzah
var sea = 144 * cbeitzah
// MARK: Liquid Measures
var kortov = 3/32 * cbeitzah
var log = 6 * cbeitzah
var hin = 12 * log
var fourtySea = 5760 * cbeitzah
var homer = 30 * sea
var kor = homer
var letekh = kor / 2
var ephah = 3 * sea
var issaronOmer = 1/10 * ephah
var bat =  6 * hin
var mesura = 1/36 * log
var czais = "consult your local rabbi"
