package models;

import java.sql.ResultSet;

public class Transaksi extends dbConnect<Transaksi> {

    private String id_transaksi;
    private String tanggal;
    private int jumlah;
    private String supplier;
    private String jenis_transaksi;
    private String id_barang;

    public Transaksi() {
        this.table = "transaksi";
        this.primaryKey = "id_transaksi";
    }

    public Transaksi(String id_transaksi, String tanggal,
                     int jumlah, String supplier,
                     String jenis_transaksi, String id_barang) {

        this.table = "transaksi";
        this.primaryKey = "id_transaksi";

        this.id_transaksi = id_transaksi;
        this.tanggal = tanggal;
        this.jumlah = jumlah;
        this.supplier = supplier;
        this.jenis_transaksi = jenis_transaksi;
        this.id_barang = id_barang;
    }

    @Override
    Transaksi toModel(ResultSet rs) {
        try {
            Transaksi t = new Transaksi();

            t.id_transaksi = rs.getString("id_transaksi");
            t.tanggal = rs.getString("tanggal");
            t.jumlah = rs.getInt("jumlah");
            t.supplier = rs.getString("supplier");
            t.jenis_transaksi = rs.getString("jenis_transaksi");
            t.id_barang = rs.getString("id_barang");

            return t;

        } catch (Exception e) {
            return null;
        }
    }

    public void tambahTransaksi() {
        insert();
    }

    public void editTransaksi() {
        update();
    }

    public void hapusTransaksi() {
        delete();
    }

    public String getId_transaksi() {
        return id_transaksi;
    }

    public String getTanggal() {
        return tanggal;
    }

    public int getJumlah() {
        return jumlah;
    }

    public String getSupplier() {
        return supplier;
    }

    public String getJenis_transaksi() {
        return jenis_transaksi;
    }

    public String getId_barang() {
        return id_barang;
    }

    public String getMessage() {
        return super.getMessage();
    }
}