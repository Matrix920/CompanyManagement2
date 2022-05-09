package utility;
import api.Pictures;
import api.Videos;
import model.Picture;
import model.Video;
import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "UploadImage", urlPatterns = {"/UploadImage"})
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, 
    maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class UploadImage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
        String picturePath="";
        
        
        String project_id="";
        
        
        
        
        String type="";
        
        
        
         String folder = (String) new File(getServletContext().getRealPath("/")).getParent();
                folder= (String)folder.replace(File.separatorChar, '/');
                
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   
   
   
//   ServletContext context = pageContext.getServletContext();
   String filePath =folder.substring(0,folder.lastIndexOf("/"))+"/web/images/";
         
       String contentType = request.getContentType();
   
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
//      factory.setRepository(new File("c:\\temp"));
 factory.setRepository(new File(folder.substring(0,folder.lastIndexOf("/"))+"/temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
          
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               picturePath="images/"+fileName;

              
            }else{
                 String fieldname = fi.getFieldName();
                String fieldvalue = fi.getString();
                if(fieldname.equals("type"))
                    type=fieldvalue;
                else
                    project_id=fieldvalue;
                
               
            }
         }
         if(project_id.length()>0&&picturePath.length()>0){
             if(type.equals(Picture.PICTURE))
                Pictures.add(new Picture(0, Integer.parseInt(project_id), picturePath));
             else
                 Videos.add(new Video(0, Integer.parseInt(project_id), picturePath));
            
            response.sendRedirect(request.getContextPath()+"/ManageProjects.jsp");
         }
		
    }catch(Exception e){
        e.printStackTrace();
    }
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
