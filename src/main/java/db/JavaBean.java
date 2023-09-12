
package db;

import java.sql.*;

/**
 *
 * @author vali
 */
public class JavaBean {

	String error;
	Connection con;

	public JavaBean() {
	}

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intreprindere?useSSL=false", "root", "$ForzaOtelu2001$");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "$ForzaOtelu2001$");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "$ForzaOtelu2001$");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

//	public void adaugaPacient(String Nume, String Prenume, String Adresa)
//			throws SQLException, Exception {
//		if (con != null) {
//			try {
//				// creaza un "prepared SQL statement"
//				Statement stmt;
//				stmt = con.createStatement();
//				stmt.executeUpdate("insert into pacienti(Nume, Prenume, Adresa) values('" + Nume + "'  , '" + Prenume + "', '" + Adresa + "');");
//
//			} catch (SQLException sqle) {
//				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
//				throw new SQLException(error);
//			}
//		} else {
//			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
//			throw new Exception(error);
//		}
//	} // end of adaugaPacient()
	
	public void adaugaEmployee(String name, String surname, String adress, String role, String salary)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into employees(name, surname, adress, role, salary) values('" + name + "'  , '" + surname + "', '" + adress + "' , '" + role + "' , '" + salary + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaPacient()


//	public void adaugaMedic(String Nume, String Prenume, String Sectie)
//			throws SQLException, Exception {
//		if (con != null) {
//			try {
//				// creaza un "prepared SQL statement"
//				Statement stmt;
//				stmt = con.createStatement();
//				stmt.executeUpdate("insert into medici(Nume, Prenume, Sectie) values('" + Nume + "'  , '" + Prenume + "', '" + Sectie + "');");
//
//			} catch (SQLException sqle) {
//				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
//				throw new SQLException(error);
//			}
//		} else {
//			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
//			throw new Exception(error);
//		}
//	} // end of adaugaMedic()

	public void adaugaReviews(String date, String review, String written_by)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into reviews(date, review, written_by) values('" + date + "'  , '" + review + "', '" + written_by + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaMedic()
	
//	public void adaugaConsultatie(int idpacient, int idmedic, String DataConsultatie, String Diagnostic, String Medicament)
//			throws SQLException, Exception {
//		if (con != null) {
//			try {
//				// creaza un "prepared SQL statement"
//				Statement stmt;
//				stmt = con.createStatement();
//				stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', '" + DataConsultatie + "', '" + Diagnostic + "', '" + Medicament + "');");
//				// se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
//				// stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');");
//
//			} catch (SQLException sqle) {
//				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
//				throw new SQLException(error);
//			}
//		} else {
//			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
//			throw new Exception(error);
//		}
//	} // end of adaugaConsultatie()
	
	public void adaugaHr(int idreview, int idemployees, String status_anualbonus, String paid_leave_status)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into hr(idreview, idemployees, status_anualbonus, paid_leave_status) values('" + idreview + "'  , '" + idemployees + "', '" + status_anualbonus + "', '" + paid_leave_status + "');");
				// se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
				// stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaConsultatie()


	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select * from `intreprindere`.`" + tabel + "`;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()

	public ResultSet vedeHr() throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select r.date ReviewDate, r.review Review, r.written_by WrittenBy, e.name EmployeeName, e.surname EmployeeSurname, e.adress Adress, e.role Role, e.salary Salary, h.idhr, h.idemployees idemployees_hr, h.idreview idreview_hr, h.status_anualbonus, h.paid_leave_status from reviews r, employees e, hr h where r.idreview = h.idreview and e.idemployees = h.idemployees;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeConsultatie()
	
	

	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()

	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + ";");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()

	public void modificaTabela(String tabela, String IDTabela, long ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1)) {
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					} else {
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
					}
				}
				update = update + temp;
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()

	public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where idemployees=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinie()

	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()

//	public ResultSet intoarceConsultatieId(int ID) throws SQLException, Exception {
//		ResultSet rs = null;
//		try {
//			// Executa interogarea
//			String queryString = ("SELECT a.Nume NumePacient, a.Prenume PrenumePacient, a.Adresa, b.Nume NumeMedic, b.Prenume PrenumeMedic, b.Sectie, c.idconsultatie, c.idmedic idmedic_consult, c.idpacient idpacient_consult, dataconsultatie, diagnostic, medicament FROM pacienti a, medici b, consultatie c WHERE a.idpacient = c.idpacient AND b.idmedic = c.idmedic and idconsultatie = '" + ID + "';");
//			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//			rs = stmt.executeQuery(queryString); //sql exception
//		} catch (SQLException sqle) {
//			error = "SQLException: Interogarea nu a fost posibila.";
//			throw new SQLException(error);
//		} catch (Exception e) {
//			error = "A aparut o exceptie in timp ce se extrageau datele.";
//			throw new Exception(error);
//		}
//		return rs;
//	} // end of intoarceLinieDupaId()
	
	public ResultSet intoarceHrId(int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("SELECT e.name EmployeeName, e.surname EmployeeSurname, e.adress, e.role, r.date ReviewDate, r.review Review, r.written_by WrittenBy, h.idhr, h.idreview idreview_hr, h.idemployees idemployees_hr, status_anualbonus Bonus_Status, h.paid_leave_status Leave_Status FROM employees e, reviews r, hr h WHERE e.idemployees = h.idemployees AND r.idreview = h.idreview and idhr = '" + ID + "';");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
}
