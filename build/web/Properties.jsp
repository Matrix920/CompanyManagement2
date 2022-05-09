
<%@page import="api.Properties"%>
<%@page import="model.Property"%>
<%@page import="model.Property"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	24 News by FreeHTML5.co
	Twitter: https://twitter.com/fh5co
	Facebook: https://fb.com/fh5co
	URL: https://freehtml5.co
-->
<html lang="en" class="no-js">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>العقارات</title>
    <link href="css/media_query.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/animate.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css"/>
    <link href="css/owl.theme.default.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap CSS -->
    <link href="css/style_1.css" rel="stylesheet" type="text/css"/>
    <link href="css/my_style.css" rel="stylesheet" type="text/css"/>
    <!-- Modernizr JS -->
    <script src="js/modernizr-3.5.0.min.js"></script>
</head>
<%@page import="model.User"%>
 <%@page import="api.Users"%>
 <%@page import="model.Project"%>
 <%@page import="api.Projects"%>
 
 <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%       
    List<Property>properties=new ArrayList<Property>();
        
//        check for logi

        Object o=session.getAttribute(User.IS_LOGIN);
        if(o!=null){
            int role=(Integer)session.getAttribute(User.USER_ROLE);
            if(role!=User.CLIENT)
                response.sendRedirect("index.jsp");
            else{
            }
        }else{
            response.sendRedirect("index.jsp");
        }

       String search_type=request.getParameter(Property.SEARCH_TYPE);
        String search_text=request.getParameter(Property.SEARCH_TEXT);
        if(search_text!=null && search_text!=null){
                if(search_type.equals(Property.ADDRESS))  {properties=Properties.get_properties_by_address(search_text);}
               else  if(search_type.equals(Property.PRICE)) {properties=Properties.get_properties_by_price(Integer.parseInt(search_text));}
                else if(search_type.equals( Property.AREA )){properties=Properties.get_properties_by_area(Integer.parseInt(search_text));}
                else if(search_type.equals( Property.KIND)){properties=Properties.get_properties_by_kind(search_text);}
                else if(search_type.equals( Property.ROOM)) {properties=Properties.get_properties_by_room(Integer.parseInt(search_text));}
                else properties=Properties.get_all_properties();
        }else{
            properties=Properties.get_all_properties();
        }
        
         
        %>
        
<body>
    
<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-3 fh5co_padding_menu">
                <img src="images/logo2.png" alt="img" class="fh5co_logo_width"/>
            </div>
            <div class="col-12 col-md-9 align-self-center fh5co_mediya_right">
                <div class="text-center d-inline-block">
                    <a class="fh5co_display_table"><div class="fh5co_verticle_middle"><i class="fa fa-search"></i></div></a>
                </div>
                <div class="text-center d-inline-block">
                    <a class="fh5co_display_table"><div class="fh5co_verticle_middle"><i class="fa fa-linkedin"></i></div></a>
                </div>
                <div class="text-center d-inline-block">
                    <a class="fh5co_display_table"><div class="fh5co_verticle_middle"><i class="fa fa-google-plus"></i></div></a>
                </div>
                <div class="text-center d-inline-block">
                    <a href="https://twitter.com/fh5co" target="_blank" class="fh5co_display_table"><div class="fh5co_verticle_middle"><i class="fa fa-twitter"></i></div></a>
                </div>
                <div class="text-center d-inline-block">
                    <a href="https://fb.com/fh5co" target="_blank" class="fh5co_display_table"><div class="fh5co_verticle_middle"><i class="fa fa-facebook"></i></div></a>
                </div>
                <!--<div class="d-inline-block text-center"><img src="images/country.png" alt="img" class="fh5co_country_width"/></div>-->
                
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid bg-faded fh5co_padd_mediya padding_786">
    <div class="container padding_786">
        <nav class="navbar navbar-toggleable-md navbar-light ">
            <button class="navbar-toggler navbar-toggler-right mt-3" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
            <a class="navbar-brand" href="#"><img src="images/logo.png" alt="img" class="mobile_logo_width"/></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Projects.jsp">المشاريع <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Properties.jsp">العقارات <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Inquiries.jsp">استفساراتي <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="AddInquiry.jsp">استفسار جديد <span class="sr-only">(current)</span></a>
                    </li>
                       
                    <li class="nav-item">
                        <a class="nav-link" href="Maps.jsp"> الخرائط <span class="sr-only">(current)</span></a>
                    </li>
                    
                    <li class="nav-item ">
                        <a class="nav-link" href="Logout.jsp">تسجيل خروج <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
    <div class="container-fluid pt-3">
    <div class="container animate-box" data-animate-effect="fadeIn">
        <div>
            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">بحث</div>
        </div>
        <div>
    <div class="s003">
                 <form method="get" action="">
        <div class="inner-form">
            <table id="customers">
                <tr>
                    <td>
          <div class="input-field first-wrap">
              
            <div class="input-select">
              <select data-trigger="" name="search_type">
                <option placeholder="">Category</option>
                <option value="price">السعر</option>
                              <option value="area">المساحة</option>
                              <option value="address">العنوان</option>
                              <option value="kind">النوع</option>
                              <option value="room">عدد الغرف</option>
              </select>
            </div>
          </div>
                    </td>
                    <td>
          <div class="input-field second-wrap">
            <input id="search" name="search_text" type="text" placeholder="ادخل كلم ةالبحث "/>
          </div>
                    </td>
                    <td>
                        <div>
                            <button class="btn btn-info" type="submit"> بحث</button>
              
          </div>
            </tr>
            </table>
        </div>
      </form>
             </div>
        </div>
    </div>
    </div>

<div class="container-fluid pt-3">
    <div class="container animate-box" data-animate-effect="fadeIn">
        <div>
            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">العقارات</div>
        </div>
        <div>
<table id="customers">
  <tr>
    <th>العقار</th>
    <th>السعر </th>
    <th>العنوان</th>
    <th>المساحة</th>
    <th>النوع</th>
    <th>عدد الغرف</th>
  </tr>
  <% for(Property p : properties){%>
  <tr>
      <td><%= p.property_id %></td>
      <td>
          <%= p.price%>
      </td>
      <td>
          <%= p.address%>
      </td>
       <td>
          <%= p.area%>
      </td>
       <td>
          <%= p.kind%>
      </td>
       <td>
          <%= p.room%>
      </td>
   
  </tr>
  <% }%>
  
                     </table>
            <!--</div>-->
            
            
        </div>
    </div>
</div>
  
 <div class="container-fluid pt-3">
    <div class="container animate-box" data-animate-effect="fadeIn">
        <div>
            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4"></div>
        </div>
        
    </div>
 </div>

<div class="container-fluid fh5co_footer_right_reserved">
    <div class="container">
        <div class="row  ">
          <div class="col-12 col-md-6 py-4 Reserved">  <a href="" title="">WJD S20</a></div>
            <div class="col-12 col-md-6 spdp_right py-4">
                
        </div>
    </div>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="fa fa-arrow-up"></i></a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<!--<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
        crossorigin="anonymous"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Main -->
<script src="js/main.js"></script>

</body>
</html>