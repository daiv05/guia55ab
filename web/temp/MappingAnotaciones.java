
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet (value="/anotaciones")
public class MappingAnotaciones extends HttpServlet {
  private static final long serialVersionUID = 1L;
 
  public MappingAnotaciones() {
    super();
  }
 
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Servlet de Prueba de Mapping por anotaciones");
  }
 
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}