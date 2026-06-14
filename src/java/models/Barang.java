/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.ResultSet;

public class Barang extends dbConnect<Barang> {

    private String id_barang;
    private String nama_barang;
    private int stok;
    private String satuan;
    private String id_kategori;

    public Barang() {
        this.table = "barang";
        this.primaryKey = "id_barang";
    }

    public Barang(String id_barang, String nama_barang,
                  int stok, String satuan, String id_kategori) {

        this.table = "barang";
        this.primaryKey = "id_barang";

        this.id_barang = id_barang;
        this.nama_barang = nama_barang;
        this.stok = stok;
        this.satuan = satuan;
        this.id_kategori = id_kategori;
    }

    @Override
    Barang toModel(ResultSet rs) {
        try {
            Barang b = new Barang();

            b.id_barang = rs.getString("id_barang");
            b.nama_barang = rs.getString("nama_barang");
            b.stok = rs.getInt("stok");
            b.satuan = rs.getString("satuan");
            b.id_kategori = rs.getString("id_kategori");

            return b;

        } catch (Exception e) {
            return null;
        }
    }

    public void tambahBarang() {
        insert();
    }

    public void editBarang() {
        update();
    }

    public void hapusBarang() {
        delete();
    }

    public String getId_barang() {
        return id_barang;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public int getStok() {
        return stok;
    }

    public String getSatuan() {
        return satuan;
    }

    public String getId_kategori() {
        return id_kategori;
    }

    public void setId_barang(String id_barang) {
        this.id_barang = id_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }

    public void setSatuan(String satuan) {
        this.satuan = satuan;
    }

    public void setId_kategori(String id_kategori) {
        this.id_kategori = id_kategori;
    }
    
    
    
    public String getMessage() {
        return super.getMessage();
    }
}
