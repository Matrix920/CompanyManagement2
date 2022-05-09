
<%@page import="api.Properties"%>
<%@page import="model.Property"%>
<%@page import="model.Picture"%>
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
    <title>إضافة عقار</title>
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
 <%@page import="model.Service"%>
 <%@page import="api.Services"%>
 
 <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%       
        
//        check for logi

        Object o=session.getAttribute(User.IS_LOGIN);
        if(o!=null){
            int role=(Integer)session.getAttribute(User.USER_ROLE);
            if(role!=User.ADMIN)
                response.sendRedirect("index.jsp");
            else{
            }
        }else{
            response.sendRedirect("index.jsp");
        }

       String project_id=request.getParameter(Service.PROJCET_ID);
        if(project_id==null)
            response.sendRedirect("AdminProjects.jsp");
        
         String price=request.getParameter(Property.PRICE);
        String address=request.getParameter(Property.ADDRESS);
        String area=request.getParameter(Property.AREA);
        String kind=request.getParameter(Property.KIND);
        String room=request.getParameter(Property.ROOM);
       
        String msg="";
        
        if(price!=null && project_id!=null && address!=null && area!=null && kind!=null && room!=null){
            Property p=new Property(0, Integer.parseInt(project_id), Integer.parseInt(price), address, Integer.parseInt(area), kind, Integer.parseInt(room));
            Properties.add(p);
            
            msg="تمت الإضافة بنجاح";
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
                    <li class="nav-item active">
                        <a class="nav-link" href="ManageProjects.jsp">المشاريع <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="AddProject.jsp">مشروع جديد <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="ManageInquiries.jsp">الاستفسارات <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
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

<div class="container-fluid mb-4">
    <div class="container">
        <div class="col-12 text-center contact_margin_svnit ">
            <div class="text-center fh5co_heading py-2">اضف معلومات العقار </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-6">
                <form class="row" id="fh5co_contact_form"  action=""   method="post">
                    
                    <div class="col-12 py-3">
                        <input type = "text" name="project_id"  class="form-control fh5co_contact_text_box"  value="<%=project_id%>" readonly />
                    </div>
                    <div class="col-12 py-3">
                        <input type="text" name="address" class="form-control fh5co_contact_text_box" placeholder="Address" required />
                    </div>
                    <div class="col-12 py-3">
                        <input type="number" name="area" class="form-control fh5co_contact_text_box" placeholder="Area" required />
                    </div>
                    
                    <div class="col-12 py-3">
                        <input type="text" name="kind" class="form-control fh5co_contact_text_box" placeholder="property type" required />
                    </div>
                    <div class="col-12 py-3">
                        <input type="number" name="price" class="form-control fh5co_contact_text_box" placeholder="price" required />
                    </div>
                    
                    <div class="col-12 py-3">
                        <input type="number" name="room" class="form-control fh5co_contact_text_box" placeholder="number of rooms" required />
                    </div>
                    
                    <div class="col-12 py-3 text-center"> <button  class="btn contact_btn"> حفظ</button> </div>
                    <div><%=msg%></div>
                </form>
            </div>
            
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