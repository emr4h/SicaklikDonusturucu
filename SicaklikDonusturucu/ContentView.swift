//
//  ContentView.swift
//  SicaklikDonusturucu
//
//  Created by Emrah Yıldırım on 11.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var giris = 0
    @State var girisDizisi = ["Santigrat (C)","Kelvin (K)","Fahrenheit (F)"]
    
    @State var deger = ""
    
    @State var cikis = 0
    @State var cikisDizisi = ["Santigrat (C)","Kelvin (K)","Fahrenheit (F)"]
    
    var santigratCeviri : Double {
        var kullaniciGirdisi = Double(deger) ?? 0
        
        if giris == 0{
            kullaniciGirdisi = kullaniciGirdisi + 0
        } else if giris == 1{
            kullaniciGirdisi = kullaniciGirdisi - 273.15
        } else {
            kullaniciGirdisi = (kullaniciGirdisi-32)/1.8
        }
        return kullaniciGirdisi
    }
    
    @State var sonuc : Double = 0
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $giris, label: Text("Giriş Birimi")) {
                        ForEach(0..<girisDizisi.count){
                            Text("\(girisDizisi[$0])")
                        }
                    }
                }
                    
                Section {
                    TextField("Dönüştürülecek Değeri Giriniz ", text: $deger)
                }.keyboardType(.decimalPad)
                
                Section(header: Text("Çıkış Birimi")) {
                    Picker(selection: $cikis, label: Text("")) {
                        ForEach(0..<cikisDizisi.count){
                            Text("\(cikisDizisi[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button(action: {
                        if cikis == 0 {
                            sonuc = santigratCeviri
                        } else if cikis == 1 {
                            sonuc = santigratCeviri + 273.15
                        } else {
                            sonuc = (1.8*santigratCeviri)+32
                        }
                    }) {
                        Text("Hesapla")
                    }
                    
                        Text("\(sonuc, specifier: "%.2f")")
                    
                    Button(action: {
                        sonuc = 0
                        deger = ""
                    }) {
                        Text("Temizle")
                    }
                }
                
                    
            }
            .navigationBarTitle(Text("Sıcaklık Dönüştürücü"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
