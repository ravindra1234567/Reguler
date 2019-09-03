/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static com.sun.xml.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nice
 */
public class SaveSchema extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ServletContext context = this.getServletContext();
        response.setContentType("text/html;charset=UTF-8");
        String branch = null;
        String year = null;
        String roll_no = null;
        String sem1 = null;
        int status1 = 0;
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName(context.getInitParameter("Driver"));
            } catch (ClassNotFoundException e) {
                out.println(e);
                //out.println("hello driver not loaded");
            }
            /* TODO output your page here. You may use following sample code. */
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            int i = 0;
            HttpSession session = request.getSession();
          //  String class_id = (String) session.getAttribute("class_id");
            String class_full_name = request.getParameter("class_full_name");
//            String class_full_name = (String) session.getAttribute("class_full_name");
//            out.println(class_full_name);
            String course = request.getParameter("course");
            out.println("Course"+ course);
            String sem = (String) session.getAttribute("sem");

            branch = request.getParameter("branch");
            out.println("kdjg"+branch);
            year = request.getParameter("year");
            String class_id = request.getParameter("class_id");


            String qr1 = "select * from all_students where sem='"+sem+"' ";
            PreparedStatement ps1 = con.prepareStatement(qr1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                roll_no = rs.getString(1);
                out.println(roll_no+"<br>");
                String s2 = rs.getString(6);
                out.println("<br> Branch s2 "+ s2);
                sem1 = rs.getString(4);
                String section = rs.getString(7);
                String year1 = rs.getString(5);
                  out.print("sem1 "+sem1+"<br>");
                   out.print("sem "+sem);
                if (sem1.equals(sem) && s2.equals(branch)) {
                    out.println("Ravindra<br>");
                    out.println("Ravindra<br>" + sem1);
                    String qr = "Insert into schema_table values( ?,?,?,?,?,? ) ";
//                    i = i+1;
                    for (i = 0; i < 8; i++) {
                        out.println(class_id + "class_id <br>");
                        PreparedStatement ps = con.prepareStatement(qr);
                        ps.setString(1, class_id);
                        ps.setInt(2, Integer.parseInt(sem1));

                        String subject_code = request.getParameter("subcodeList" + (i + 1));
                        out.println("<br>sub_code=" + subject_code + "<br>");
                        int subject_type = Integer.parseInt(request.getParameter("subjectTypeList" + (i + 1)));
                        out.println("sub_type=" + subject_type);
//                        String subject_type="1";
                        out.println("\n");
                        if (subject_code != null) {
                            if (!subject_code.equals("")) {
                                ps.setString(3, subject_code);
                                ps.setInt(4, subject_type);
                                ps.setString(5, roll_no);
                                ps.setInt(6, status1);
                                try {
                                    int n = ps.executeUpdate();
                                    out.println("rows updated:" + n + "<br>");
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            }
                        }
                    }
                }
            }
             response.sendRedirect("subjectAlloc.jsp?course=" + course + "&class_id=" + class_id + "&class_full_name=" + class_full_name + "&branch=" + branch + "&year=" + year);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveSchema.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveSchema.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
