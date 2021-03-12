package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class payment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\t<title>Payment Page</title>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">\n");
      out.write("\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<header>Payment Page</header>\n");
      out.write("        ");

           String name=request.getParameter("name"); 
           String amount=request.getParameter("amount"); 
        
      out.write("\n");
      out.write("\t<div class=\"row\">\n");
      out.write("\t<div class=\"col s4 offset-s1\">\n");
      out.write("\t\t<form action=\"\" method=\"get\" >\n");
      out.write("\t\t\t<table>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<th>Debit Card Details</th>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Card type: </td>\n");
      out.write("\t\t\t\t\t<td>\n");
      out.write("\t\t\t\t\t\t<label>\n");
      out.write("\t\t\t\t\t\t\t<input name=\"group1\" type=\"radio\" required/>\n");
      out.write("\t\t\t\t\t\t\t<span><img src=\"img/mastercard.png\" alt=\"Mastercard\" height=\"50px\" width=\"60px\"></span> \n");
      out.write("\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t<label>\n");
      out.write("\t\t\t\t\t\t\t<input name=\"group1\" type=\"radio\" required/>\n");
      out.write("\t\t\t\t\t\t\t<span><img src=\"img/visa.png\" alt=\"Visa\" height=\"50px\" width=\"50px\"></span>\n");
      out.write("\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t  <label>\n");
      out.write("\t\t\t\t\t\t\t<input name=\"group1\" type=\"radio\" required/>\n");
      out.write("\t\t\t\t\t\t\t<span><img src=\"img/rupay.jpg\" alt=\"Rupay\" height=\"50px\" width=\"50px\"></span>\n");
      out.write("\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Card Holder Name: </td>\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"name\" id=\"name\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Card Number: </td>\n");
      out.write("\t\t\t\t\t<td><input type=\"number\" name=\"cnum\" id=\"cnum\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Expiration date: </td>\n");
      out.write("\t\t\t\t\t<td><input type=\"month\" name=\"xdate\" id=\"xdate\" min=\"2020-12\" max=\"2030-12\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>CVV: </td>\n");
      out.write("\t\t\t\t\t<td><input type=\"number\" name=\"cnum\" id=\"cnum\" min=\"100\" max=\"999\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("                                 ");
 out.print("<input type='hidden' name='amount' value='"+amount+"'>");  
      out.write("\n");
      out.write("\t\t\t\t<tr><td><input class=\"btn waves-effect waves-light\" type=\"submit\" value=\"Pay Now\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t\t<div class=\"col s4 offset-s1 \">\n");
      out.write("\t\t  <div class=\"card \">\n");
      out.write("\t\t\t<div class=\"card-content red-text\">\n");
      out.write("\t\t\t  <span class=\"card-title\">\n");
      out.write("                              <h4>Welcome ");
      out.print( name );
      out.write("</h4>\n");
      out.write("                              <h4>Payment Amount:   ");
      out.print( amount );
      out.write("</h4></span>\n");
      out.write("\t\t\t  \n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t</div>\n");
      out.write("\t  </div>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t<footer class=\"page-footer\"> \n");
      out.write("\t\t<div class=\"footer-copyright\">\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\tCopyright 2020. All right reserved <br>\n");
      out.write("\t\t\tSecure Payment Gateway\n");
      out.write("\t\t<a class=\"grey-text text-lighten-4 right\" href=\"#!\">More Links</a>\n");
      out.write("\t\t</div>\n");
      out.write("\t  </div>\n");
      out.write("\n");
      out.write("\t</footer>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
