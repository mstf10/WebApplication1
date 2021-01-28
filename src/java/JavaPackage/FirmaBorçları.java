/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mergu
 */
public class FirmaBorçları {

    DbConnect dbConnect;
    public String[] sütunbaşlık = new String[18];
    public ArrayList<Integer> sırano_arrayList;
    public ArrayList<String> firmaadı_arrayList;
    public ArrayList<String> arrayList_vergino;
    public ArrayList<String> arrayList_hesapkodu;
    public ArrayList<Integer> arrayList_fişno;
    public ArrayList<String> arrayList_fiştarihi;
    public ArrayList<Integer> arrayList_ftbs;
    public ArrayList<String> arrayList_mkt;
    public ArrayList<Integer> arrayList_mktbs;
    public ArrayList<String> arrayList_öebn;
    public ArrayList<String> arrayList_öebt;
    public ArrayList<Integer> arrayList_iliskino;
    public ArrayList<Double> arrayList_tahakkuk;
    public ArrayList<Double> arrayList_103k;
    public ArrayList<Double> arrayList_320k;
    public ArrayList<Double> arrayList_diğerk;
    public ArrayList<Double> arrayList_kalan;
    public ArrayList<Integer> ödemelistesi_arrayList;
    public ArrayList<Integer> ödemelistesikontrol_arrayList;
    private String dönem;

    public void setFirmaBorçları() {
        dbConnect = new DbConnect();
        firmaadı_arrayList = new ArrayList<>();
        sırano_arrayList = new ArrayList<>();
        arrayList_vergino = new ArrayList<>();
        arrayList_hesapkodu = new ArrayList<>();
        arrayList_fişno = new ArrayList<>();
        arrayList_fiştarihi = new ArrayList<>();
        arrayList_ftbs = new ArrayList<>();
        arrayList_mkt = new ArrayList<>();
        arrayList_mktbs = new ArrayList<>();
        arrayList_öebn = new ArrayList<>();
        arrayList_öebt = new ArrayList<>();
        arrayList_iliskino = new ArrayList<>();
        arrayList_tahakkuk = new ArrayList<>();
        arrayList_103k = new ArrayList<>();
        arrayList_320k = new ArrayList<>();
        arrayList_diğerk = new ArrayList<>();
        arrayList_kalan = new ArrayList<>();
        ödemelistesi_arrayList = new ArrayList<>();

        try {

            Statement statement = dbConnect.connection.createStatement();

            ResultSet resultSet = statement.executeQuery("select * from 2019bl1 where `Kalan`>0 and `FİŞ TARİHİ` like '%." + dönem + ".%'");
            while (resultSet.next()) {
                sırano_arrayList.add(resultSet.getInt("SIRA NO"));
                firmaadı_arrayList.add(resultSet.getString("FİRMA/PERSONEL ADI"));
                arrayList_vergino.add(resultSet.getString("VERGİ NO"));
                arrayList_hesapkodu.add(resultSet.getString("HESAP KODU"));
                arrayList_fişno.add(resultSet.getInt("FİŞ NO"));
                arrayList_fiştarihi.add(resultSet.getString("FİŞ TARİHİ"));
                arrayList_ftbs.add(resultSet.getInt("FİŞ TARİHİ BORÇULUK SÜRESİ4"));
                arrayList_mkt.add(resultSet.getString("Muayene Kabul TARİHİ"));
                arrayList_mktbs.add(resultSet.getInt("Muayene Kabul TARİHİ Borçluluk Süresi"));
                arrayList_öebn.add(resultSet.getString("ÖDEMEYE ESAS B. NO"));
                arrayList_öebt.add(resultSet.getString("ÖDEMEYE ESAS B. TARİHİ"));
                arrayList_iliskino.add(resultSet.getInt("İLİŞKİ NO"));
                arrayList_tahakkuk.add(resultSet.getDouble("TAHAKKUK"));
                arrayList_103k.add(resultSet.getDouble("103 İLE KAPATILAN"));
                arrayList_320k.add(resultSet.getDouble("320.11/320.12 İLE KAPATILAN"));
                arrayList_diğerk.add(resultSet.getDouble("DİĞER İLE KAPATILAN"));
                arrayList_kalan.add(resultSet.getDouble("KALAN"));
                ödemelistesi_arrayList.add(resultSet.getInt("ÖDEME LİSTE NO"));

            }

            for (int i = 0; i < resultSet.getMetaData().getColumnCount(); i++) {
                sütunbaşlık[i] = resultSet.getMetaData().getColumnName(i + 1);
            }
            resultSet.close();
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(FirmaBorçları.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String firmaekle(int asd, int asd2) {
        dbConnect = new DbConnect();
        try {
            Statement statement = dbConnect.connection.createStatement();
            statement.executeQuery("update 2019bl1 set `ÖDEME LİSTE NO` ='" + asd2 + "' where `SIRA NO`='" + asd + "'");
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(FirmaBorçları.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public String getDönem() {
        return dönem;
    }

    public void setDönem(String dönem) {
        this.dönem = dönem;
    }

    public void ödemeListesiKontrol() {
        dbConnect = new DbConnect();
        ödemelistesikontrol_arrayList = new ArrayList<>();
        try {
            Statement statement = dbConnect.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select distinct(`ÖDEME LİSTE NO`) from 2019bl1 WHERE `KALAN`=0");
            while (resultSet.next()) {
                ödemelistesikontrol_arrayList.add(resultSet.getInt("ÖDEME LİSTE NO"));

            }
            resultSet.close();
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(FirmaBorçları.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public String ödemeListYazdır(int listno) {
        dbConnect = new DbConnect();
        firmaadı_arrayList = new ArrayList<>();
        sırano_arrayList = new ArrayList<>();
        arrayList_vergino = new ArrayList<>();
        arrayList_fişno = new ArrayList<>();
        arrayList_fiştarihi = new ArrayList<>();
        arrayList_öebn = new ArrayList<>();
        arrayList_öebt = new ArrayList<>();
        arrayList_tahakkuk = new ArrayList<>();
        arrayList_kalan = new ArrayList<>();
        ödemelistesi_arrayList = new ArrayList<>();
        try {
            Statement statement = dbConnect.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from 2019bl1 where `ÖDEME LİSTE NO`='" + listno + "'");
            while (resultSet.next()) {
                sırano_arrayList.add(resultSet.getInt("SIRA NO"));
                firmaadı_arrayList.add(resultSet.getString("FİRMA/PERSONEL ADI"));
                arrayList_vergino.add(resultSet.getString("VERGİ NO"));
                arrayList_fişno.add(resultSet.getInt("FİŞ NO"));
                arrayList_fiştarihi.add(resultSet.getString("FİŞ TARİHİ"));
                arrayList_öebn.add(resultSet.getString("ÖDEMEYE ESAS B. NO"));
                arrayList_öebt.add(resultSet.getString("ÖDEMEYE ESAS B. TARİHİ"));
                arrayList_tahakkuk.add(resultSet.getDouble("TAHAKKUK"));
                arrayList_kalan.add(resultSet.getDouble("KALAN"));
                ödemelistesi_arrayList.add(resultSet.getInt("ÖDEME LİSTE NO"));
            }
            for (int i = 0; i < resultSet.getMetaData().getColumnCount(); i++) {
                sütunbaşlık[i] = resultSet.getMetaData().getColumnName(i + 1);
            }
            resultSet.close();
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(FirmaBorçları.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public String ödemeTamamla(String listno) {
        dbConnect = new DbConnect();

        try {
            Statement statement = dbConnect.connection.createStatement();
            statement.executeQuery("update 2019bl1 set `103 İLE KAPATILAN`=`KALAN`,`KALAN`=0 where `ÖDEME LİSTE NO` = " + listno);
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(FirmaBorçları.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
}
