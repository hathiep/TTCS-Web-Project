/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll.management;

import context.NVDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;
import model.management.NV;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="UpdateServlet", urlPatterns={"/update"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UpdateServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String hoten = request.getParameter("hoten");
        String ngaysinh = request.getParameter("ngaysinh");
        String gioitinh = request.getParameter("gioitinh");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("diachi");
        String ngaynhanviec = request.getParameter("ngaynhanviec");
        String chucvu = request.getParameter("chucvu");
        int mucluong = Integer.parseInt(request.getParameter("mucluong"));
        String chuthich = request.getParameter("chuthich");
        String savePath = getServletContext().getRealPath("/") + "images/";

        // Kiểm tra nếu thư mục không tồn tại thì tạo thư mục mới
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        // Lấy tệp ảnh từ yêu cầu POST
        Part filePart = request.getPart("image");
        String fileName = getFileName(filePart);

        // Lưu ảnh vào thư mục lưu trữ
        OutputStream out = new FileOutputStream(new File(savePath + File.separator + fileName));
        InputStream fileContent = filePart.getInputStream();
        int read = 0;
        final byte[] bytes = new byte[1024];
        while ((read = fileContent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }

        // Giải phóng tài nguyên
        out.close();
        fileContent.close();

        // Lưu đường dẫn của ảnh vào database
        String imageUrl = "images/" + fileName;

        NVDAO dao = new NVDAO();
        List<NV> list = dao.getAllNV(2);
        if(hoten.split("\\s+").length<2){
            request.setAttribute("error", "Vui lòng điền đầy đủ họ và tên!");
            request.getRequestDispatcher("management").forward(request, response);
        }
        else{
            int ok = 0;
            for(NV i:list){
                if(id == i.getId()){
                    dao.updateNV(id, hoten, ngaysinh, gioitinh, sdt, diachi, ngaynhanviec, chucvu, mucluong, chuthich, imageUrl);
                    ok = 1;
                    response.sendRedirect("management");
                }
            }
            if(ok==0){
                request.setAttribute("error", "Id không đúng!");
                request.getRequestDispatcher("management.jsp").forward(request, response);
            }
        }
    }
    // Phương thức lấy tên file từ Part
    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
