
package koneksi;
import java.sql.*;

public class koneksi {

    public static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    private Connection koneksi;
    public Connection connect(){
        try {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Koneksi Berhasil");
        } catch (Exception e) {
         System.out.println("Koneksi Gagal"+e);   
        }
        String url = "jdbc:mysql://localhost:3306/dbpulsa";
        try {
            koneksi = DriverManager.getConnection(url,"root","");
            System.out.println("Berhasil Koneksi Database");
        } catch (Exception e) {
            System.out.println("Gagal Koneksi Database"+e);
        }
        return koneksi;
    }
    
}
