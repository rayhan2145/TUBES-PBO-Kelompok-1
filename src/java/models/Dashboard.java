/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

public class Dashboard {

    private int totalBarang;
    private int barangMasuk;
    private int barangKeluar;
    private int totalStok;

    public Dashboard() {
    }

    public Dashboard(int totalBarang, int barangMasuk,
            int barangKeluar, int totalStok) {

        this.totalBarang = totalBarang;
        this.barangMasuk = barangMasuk;
        this.barangKeluar = barangKeluar;
        this.totalStok = totalStok;
    }

    public int getTotalBarang() {
        return totalBarang;
    }

    public int getBarangMasuk() {
        return barangMasuk;
    }

    public int getBarangKeluar() {
        return barangKeluar;
    }

    public int getTotalStok() {
        return totalStok;
    }

    public void setTotalBarang(int totalBarang) {
        this.totalBarang = totalBarang;
    }

    public void setBarangMasuk(int barangMasuk) {
        this.barangMasuk = barangMasuk;
    }

    public void setBarangKeluar(int barangKeluar) {
        this.barangKeluar = barangKeluar;
    }

    public void setTotalStok(int totalStok) {
        this.totalStok = totalStok;
    }
}