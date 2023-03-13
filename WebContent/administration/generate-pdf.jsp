<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="id.git.util.Function"%>
<%@page import="id.git.service.CheckService"%>
<%@page import="id.git.message.model.Message"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    	try{
    		if(session.getAttribute("currentUser") !=null){
    			String current = session.getAttribute("currentUser").toString();
     			System.out.println("cek user: "+current);
    		HashMap<String,String>parameter = SQLData.getParameter();
    		boolean Gen = CheckService.CheckGen();
    		String period = Function.getPeriod();
    		System.out.println(period);
    		String pattern = "###,###.###";
    		DecimalFormat df = new DecimalFormat(pattern);
    		SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
    		SimpleDateFormat sf2 = new SimpleDateFormat("MMM dd yyyy");
    		Integer get = SQLData.getGeneretaePeriod(period);
    		String usertmp = df.format(get);
    		String user = usertmp.replace(",", ".");
    		user = user+" PDF";
    		System.out.println(get);
    		System.out.println(user);
    		String status = "";
    		String cbx = "";
    		String month = Function.getMonth();
    		String Sdate = parameter.get("START DATE") ;
    		String Fdate = parameter.get("FINISH DATE") ;
    		List<String[]> history = SQLData.getHistory("PDF");
    		if(Gen == true){
    			status = "ON";
    			cbx = "checked";
    		}else{
    			status = "OFF";
    			cbx = "";
    		}
    	
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>E-Statement</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../img/spm.jpg" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <!-- MDB -->
    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <!-- <link rel="stylesheet" href="css/mdb.dark.min.css" /> -->
    <link rel="stylesheet" href="../css/mdb.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
    function checkBox(cb){
        var check = cb.checked;
       if(check == true){
        console.log("nyalain engine");
       }
       else if(check == false){
        console.log("matiin engine");
       }
    }
    function update(){
   	  	var START_DATE = document.getElementById('startD').value;
   	   var START_TIME = document.getElementById('startT').value;
   	   var FINISH_DATE = document.getElementById('finishD').value;finishD
   	   var FINISH_TIME = document.getElementById('finishT').value;
   	   var path = document.getElementById('path').value;
   	   var source = document.getElementById('source').value;
   	$.ajax({
		method: "POST",
		url: "${pageContext.request.contextPath}/EditParamGenerate",
		
        data: { START_TIME:START_TIME,FINISH_TIME:FINISH_TIME,START_DATE:START_DATE,FINISH_DATE:FINISH_DATE,path:path,source:source},
 		success: function(data){
	 
		 console.log(data);
		 console.log(data.redirect);
		 
            // data.redirect contains the string URL to redirect to
		 window.location.href  = data.redirect;
	      
        
	
},

});
   	   
    }
</script>
<body class="sb-nav-fixed" style="
      /* padding-left: 10px; */
      background-color: #eff4f3;
      background-image: url(../img/img4.png);
      background-repeat: no-repeat;
      white-space: nowrap;
      overflow-x: auto;
      display: initia;
      /* margin: 10px; */
      /* padding: 10px; */
      /* background-size: 20%; */
      height: 100vh;
      /* background: ; */
      background-position: right bottom; /*Positioning*/
    ">
    <!-- navbar -->
    <nav
      class="sb-topnav navbar navbar-expand navbar bg-light"
      style="border-radius: 1rem"
    >
      <!-- <nav class="sb-topnav navbar navbar-expand navbar bg-light" style="background-color: #640405"></nav> -->
      <!-- Navbar Brand-->
      <!-- <a class="navbar-brand ps-3" href="index.html">E-Statement</a> -->
      <img src="../img/spm.jpg" class="navbar-brand img-fluid ps-2" alt="" />
      <!-- Sidebar Toggle-->
      <button
        class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
        id="sidebarToggle"
        href="#!"
        style="color: #640405"
      >
        <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar Search-->
      <div
        class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
      >
        <div class="nav-item mt-2">
          <!-- <img src="img/spm.jpg" class="img-fluid" alt="" /> -->
          <h5>Hi <%=current %>!</h5>
        </div>
      </div>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            ><i class="fas fa-user fa-fw"></i
          ></a>
          <ul
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="navbarDropdown"
          >
            <li><a class="dropdown-item" href="#!">Settings</a></li>
            <li><a class="dropdown-item" href="#!">Activity Log</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="#!">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- end navbar -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
        <nav
          class="sb-sidenav accordion sb-sidenav"
          id="sidenavAccordion"
          style="background-color: #640405"
        >
          <div class="sb-sidenav-menu">
            <div class="nav">
              <!-- <br> -->
              <!-- <div class="sb-sidenav-menu-heading" style="color: #ffffff">
              </div> -->
              <a class="nav-link mt-3" href="../home.jsp" style="color: #ffffff">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Dashboard
              </a>
              <!-- <div class="sb-sidenav-menu-heading" style="color: #ffffff">
                Interface
              </div> -->
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseLayouts"
                aria-expanded="false"
                aria-controls="collapseLayouts"
                style="color: #ffffff"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-user-friends"></i>
                </div>
                Administration
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseLayouts"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="generate-pdf.jsp" style="color: #ffffff"
                    >Generate PDF</a
                  >
                  <a
                    class="nav-link"
                    href="content.jsp"
                    style="color: #ffffff"
                    >Content Configuration</a
                  >
                   <!-- <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Preview Sampling</a
                  > -->
                  <a class="nav-link" href="user-management.jsp" style="color: #ffffff"
                    >User Management</a
                  >
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapse"
                aria-expanded="false"
                aria-controls="collapseLayouts"
                style="color: #ffffff"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-book"></i>
                </div>
                E-Statement
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapse"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a
                    class="nav-link"
                    href="../E-Statement/cutomer-pdf-data.jsp"
                    style="color: #ffffff"
                    >Customers PDF Data</a
                  >
                  <a
                    class="nav-link"
                    href="./E-Statement\Send-WA.jsp"
                    style="color: #ffffff"
                    >Send WhatsApp</a
                  >
                  <a
                    class="nav-link"
                    href="../E-Statement\history-report.jsp"
                    style="color: #ffffff"
                    >WhatsApp Report</a
                  >
                </nav>
              </div>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <!-- <div class="small">Logged in as:</div> -->
            <img
              src="../img/spm.jpg"
              class="img-fluid"
              alt=""
              style="border-radius: 1rem"
            />
          </div>
        </nav>
      </div> 	
        <div id="layoutSidenav_content">
            <main>
                <!-- carousel -->

                <!-- end carousel -->
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Administrator</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Generate PDF</li>
                    </ol>
                    <% Message m1=(Message) session.getAttribute("msgEditGen");
					  			if(m1!=null){
					  				%><div class="alert alert-<%=m1.getCssClass()%>" role="alert">
					  					<%=m1.getContent() %>
					  				</div>
					  				<%
					  			}
					  		%>
					  		<%session.removeAttribute("msgEditGen"); %>
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Scheduler Setting
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">


                                        <table class="table table-borderless">
                                            <tr>
                                                <td>Date</td>
                                                <td></td>
                                                <td>Time</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Start Date</td>
                                                <td><%=parameter.get("START DATE") %></td>
                                                <td>Start Time</td>
                                                <td><%=parameter.get("START TIME") %></td>
                                            </tr>
                                            <tr>
                                                <td>Finish Date</td>
                                                <td><%=parameter.get("FINISH DATE") %></td>
                                                <td>Finish Time</td>
                                                <td><%=parameter.get("FINISH TIME") %></td>
                                            </tr>
                                            <tr>
                                                <td>PDF</td>
                                                <td></td>

                                            </tr>
                                            <tr>
                                                <td>PDF Path</td>
                                                <td><%=parameter.get("pdf.path.report") %></td>
                                            </tr>
                                            <tr>
                                                <td>PDF Source File</td>
                                                <td><%=parameter.get("pdf.source.file") %></td>
                                            </tr>
                                            <tr>
                                                <td><button class="btn btn-primary" data-mdb-toggle="modal" data-mdb-target="#exampleModal">Edit parameter</button></td>
                                            </tr>
                                        </table>

                                    </div>
                                    <!-- <div class="row"> </div> -->
                                    <!-- <canvas id="myAreaChart" width="100%" height=""></canvas> -->
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-6">

                            <div class="row">

                                <div class="col">
                                    <!-- <div class="row-xl-4"> -->
                                    <div class="card h-100 mb-2">
                                        <!-- <div class="d-flex align-items-sm-baseline"> -->


                                        <!-- <div class="card-header"> -->

                                        <!-- </div> -->
                                        <div class="card-body">
                                            <!-- <canvas id="myBarChart" width="100%" height="80"></canvas> -->

                                            <h5 class="card-title mb-2">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                Total Generate
                                            </h5>
                                            <br>
                                            <h2 class="justify-content-center align-items-center">
                                                <%=user %> 
                                              </h2>
                                            
                                            <div class="d-flex justify-content-end">
                                                <button type="button" class="btn btn-tertiary" data-mdb-ripple-color="light">
                                                   <i class="fas fa-redo fa-2x"></i>
                                                </button>

                                            </div>
                                        </div>
                                        <!-- </div> -->
                                    </div>
                                    <!-- </div> -->

                                </div>
                                <div class="col">
                                    <!-- <div class="row-xl-4"> -->
                                    <div class="card h-100 mb-2">
                                        <!-- <div class="card-header"> -->

                                        <!-- </div> -->
                                        <div class="card-body">
                                            <!-- <canvas id="myBarChart" width="100%" height="80"></canvas> -->
                                            <h5 class="card-title mb-2">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                PDF Settings
                                            </h5>
                                            <div class="table-responsive">


                                                <table class="table table-borderless">
                                                    <tr>
                                                        <td><%=Sdate %>&nbsp <%=month %></td>
                                                        <td>|</td>
                                                        <td><%=Fdate %>&nbsp <%=month %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Status</td>
                                                        <td><%=status %></td>
                                                        <td>
                                                            <div class="form-check form-switch">
                                                                <input class="form-check-input" type="checkbox"
                                                                     role="switch" id="flexSwitchCheckDefault" onclick="checkBox(this)" <%=cbx %>/>
                                                                <!-- <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label> -->
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- </div> -->

                                </div>
                            </div>
                            <br>
                            <div class="row-xl-4">
                                <div class="card mb-4">
                                    <!-- <div class="card-header">
                                        
                                    </div> -->
                                    <div class="card-body">
                                        <div class="row">

                                            <!-- <canvas id="myBarChart" width="100%" height="80"></canvas> -->
                                            <div class="col">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                Scheduler History

                                            </div>
                                            <div class="col">

                                                <div class="d-flex justify-content-end">
                                                 <button type="submit" class="btn btn-warning">
                                                    PDF
                                                </button>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div>
                                                <table class="display compact" id="historyTable">
                                                    <thead>
                                                        <tr>
                                                            <td>Start Date</td>
                                                            <td>Finish Date</td>
                                                            <td>Total Files</td>
                                                            <td>Success</td>
                                                            <td>Failed</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                    	for(int i = 0; i< history.size(); i++){
                                                    		Date date1 = sf1.parse(history.get(i)[0]);
                                                    		Date date2 = sf1.parse(history.get(i)[1]);
                                                    		Integer tot = Integer.valueOf(history.get(i)[2]);
                                                    		Integer suc = Integer.valueOf(history.get(i)[3]);
                                                    		Integer fai = Integer.valueOf(history.get(i)[4]);
                                                    		String total = df.format(tot);
                                                    		String succes = df.format(suc);
                                                    		String failed = df.format(fai);
                                                    		String sDate = sf2.format(date1);
                                                    		String fDate = sf2.format(date2);
                                                    		out.print("<tr>");
                                                    		out.print("<td>"+sDate+"</td>");
                                                    		out.print("<td>"+fDate+"</td>");
                                                    		out.print("<td>"+total+"</td>");
                                                    		out.print("<td>"+succes+"</td>");
                                                    		out.print("<td>"+failed+"</td>");
                                                    		out.print("</tr>");
                                                    	}
                                                    %>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                        <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/EditParamGenerate" method="POST">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Parameter</h5>
                                <button type="button" class="btn-close" data-mdb-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            
                                <div class="table-responsive">
                                    <table class="table table-borderless">
                                        <tr>
                                            <td>Date</td>
                                            <td></td>
                                            <td>Time</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Start Date</td>
                                            <td><input type="text" name="startD" id="startD" value="<%=parameter.get("START DATE") %>"></td>
                                            <td>Start Time</td>
                                            <td><input type="text" name="startT" id="startT" value="<%=parameter.get("START TIME") %>"></td>
                                        </tr>
                                        <tr>
                                            <td>Finish Date</td>
                                            <td><input type="text" name="finishD" id="finishD" value="<%=parameter.get("FINISH DATE") %>"></td>
                                            <td>Finish Time</td>
                                            <td><input type="text" name="finishT" id="finishT" value="<%=parameter.get("FINISH TIME") %>"></td>
                                        </tr>
                                        <tr>
                                            <td>PDF</td>
                                            <td></td>

                                        </tr>
                                        <tr>
                                            <td>PDF Path</td>
                                            <td><input type="text" name="path" id="path" value="<%=parameter.get("pdf.path.report") %>"></td>
                                        </tr>
                                        <tr>
                                            <td>PDF Source File</td>
                                            <td><input type="text" name="source" id="source" value="<%=parameter.get("pdf.source.file") %>"></td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" class="save" id="save" onclick="return update()" >Save changes</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
            <!-- <footer class="py-4 bg-light mt-auto"> -->
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-center small">
                    <div class="text-muted">
                        Copyright &copy; Global Innovation Technology <script>document.write(new Date().getFullYear())</script>
                    </div>
                </div>
            </div>
            <!-- </footer> -->
        </div>
    </div>
   <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"
  ></script>
	<script src="../js/scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
   <!-- <script src="js/datatables.js"></script> -->
   <script src="../js/datatables.js"></script>    <!-- MDB -->
    <script type="text/javascript" src="../js/mdb.min.js"></script>

    <!-- Custom scripts -->
    <script type="text/javascript"></script>
    <script type="text/javascript" src="../js/search.js"></script>
</body>

</html>
<%
    		}else{
     			session.invalidate();
     			response.sendRedirect("/StarParts/");
     		}
}catch(Exception e){
    		e.printStackTrace();
    		System.out.println(e.getMessage());
    	}
    	%>