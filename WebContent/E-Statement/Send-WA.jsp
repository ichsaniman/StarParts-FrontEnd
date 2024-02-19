<%@page import="java.util.HashMap"%>
<%@page import="id.git.db.SQLData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%try{
	if(session.getAttribute("currentUser") !=null){
		String current = session.getAttribute("currentUser").toString();
		//System.out.println("cek user: "+current);
	HashMap<String,String>parameter = SQLData.getParameter();
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
</head>

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
    <nav class="sb-topnav navbar navbar-expand navbar bg-light" style="border-radius: 1rem">
        <!-- <nav class="sb-topnav navbar navbar-expand navbar bg-light" style="background-color: #640405"></nav> -->
        <!-- Navbar Brand-->
        <!-- <a class="navbar-brand ps-3" href="index.html">E-Statement</a> -->
        <img src="../img/spm.jpg" class="navbar-brand img-fluid ps-2" alt="" />
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"
            style="color: #640405">
            <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="nav-item mt-2">
                <!-- <img src="img/spm.jpg" class="img-fluid" alt="" /> -->
                <h5>Hi <%=current %>!</h5>
            </div>
        </div>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- end navbar -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav" id="sidenavAccordion" style="background-color: #640405">
                <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav" id="sidenavAccordion" style="background-color: #640405">
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
                  <a class="nav-link" href="../administration/generate-pdf.jsp" style="color: #ffffff"
                    >Generate PDF</a
                  >
                  <a
                    class="nav-link"
                    href="../administration/content.jsp"
                    style="color: #ffffff"
                    >Content Configuration</a
                  >
                  <!-- <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Preview Sampling</a
                  > -->
                  <a class="nav-link" href="../administration/user-management.jsp" style="color: #ffffff"
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
                    href="cutomer-pdf-data.jsp"
                    style="color: #ffffff"
                    >Customers PDF Data</a
                  >
                  <a
                    class="nav-link"
                    href="Send-WA.jsp"
                    style="color: #ffffff"
                    >Send WhatsApp</a
                  >
                  <a
                    class="nav-link"
                    href="history-report.jsp"
                    style="color: #ffffff"
                    >WhatsApp Report</a
                  >
                </nav>
              </div>
            </div>
          </div>
                <div class="sb-sidenav-footer">
                    <!-- <div class="small">Logged in as:</div> -->
                    <img src="../img/spm.jpg" class="img-fluid" alt="" style="border-radius: 1rem" />
                </div>
            </nav>
        </div>
                <div class="sb-sidenav-footer">
                    <!-- <div class="small">Logged in as:</div> -->
                    <img src="img/spm.jpg" class="img-fluid" alt="" style="border-radius: 1rem" />
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <!-- carousel -->

                <!-- end carousel -->
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Genereate Email</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Administration</li>
                    </ol>
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
                                                <td><%=parameter.get("SEND START DATE") %></td>
                                                <td>Start Time</td>
                                                <td><%=parameter.get("SEND START TIME") %></td>
                                            </tr>
                                            <tr>
                                                <td>Finish Date</td>
                                                <td><%=parameter.get("SEND FINISH DATE") %></td>
                                                <td>Finish Time</td>
                                                <td><%=parameter.get("SEND FINISH TIME") %></td>
                                            </tr>
                                            <tr>
                                                <td>WhatsApp</td>
                                                <td></td>

                                            </tr>
                                            <tr>
                                                <td>Product</td>
                                                <td><%=parameter.get("wa.product") %></td>
                                                <td>Type</td>
                                                <td><%=parameter.get("document") %></td>
                                            </tr>
                                            <tr>
                                                <td>Phone Number ID</td>
                                                <td><%=parameter.get("wa.id") %></td>
                                                <td>URL</td>
                                                <td><%=parameter.get("wa.url") %></td>
                                            </tr>
                                            <tr>
                                            	<td>Version</td>
                                                <td><%=parameter.get("wa.version") %></td>
                                                <td>Token</td>
                                                <td><input type="password" name="" id="" value="<%=parameter.get("wa.token") %>" disabled></td>
                                            </tr>
                                            
                                            <tr>
                                                <td><button class="btn btn-primary" data-mdb-toggle="modal"
                                                        data-mdb-target="#exampleModal">Edit parameter</button></td>
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
                                                Total Send
                                            </h5>
                                            <br>
                                            samlekum
                                            <br>
                                            <br>
                                            <br>
                                            <div class="d-flex justify-content-end">
                                                <button type="submit">
                                                    <i class="fas fa-chart-bar me-1"></i>

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
                                                Whatsapp Settings
                                            </h5>
                                            <div class="table-responsive">


                                                <table class="table table-borderless">
                                                    <tr>
                                                        <td>03 Feb</td>
                                                        <td>|</td>
                                                        <td>06 Feb</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Status</td>
                                                        <td>ON</td>
                                                        <td>
                                                            <div class="form-check form-switch">
                                                                <input class="form-check-input" type="checkbox"
                                                                    role="switch" id="flexSwitchCheckDefault" />
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
                                                    <button type="submit">
                                                        PDF

                                                    </button>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div>
                                                <table class="" id="historyTable">
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
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2022-12-03</td>
                                                            <td>2022-12-04</td>
                                                            <td>10.000</td>
                                                            <td>8.000</td>
                                                            <td>2.000</td>
                                                        </tr>
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
                                                <td><%=parameter.get("SEND START DATE") %></td>
                                                <td>Start Time</td>
                                                <td><%=parameter.get("SEND START TIME") %></td>
                                            </tr>
                                            <tr>
                                                <td>Finish Date</td>
                                                <td><%=parameter.get("SEND FINISH DATE") %></td>
                                                <td>Finish Time</td>
                                                <td><%=parameter.get("SEND FINISH TIME") %></td>
                                            </tr>
                                        <tr>
                                            <td>Mail</td>
                                            <td></td>

                                        </tr>
                                        <tr>
                                            <td>Product</td>
                                           <td><input type="text" name="" id="" value="<%=parameter.get("wa.product") %>"></td>
                                            <td>Type</td>
                                           <td><input type="text" name="" id="" value="<%=parameter.get("wa.type") %>"></td>
                                        </tr>
                                        <tr>
                                            <td>Phone Number ID</td>
                                            <td><input type="text" name="" id="" value="<%=parameter.get("wa.id") %>"></td>
                                            <td>URL</td>
                                            <td><input type="text" name="" id="" value="<%=parameter.get("wa.url") %>"></td>
                                        </tr>
                                        <tr>
                                            <td>Version</td>
                                            <td><input type="text" name="" id="" value="<%=parameter.get("wa.version") %>"></td>
                                            <td>Token</td>
                                            <td><input type="password" name="" id="" value="<%=parameter.get("wa.token") %>" ></td>
                                        </tr>
                                        
                                    </table>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- <footer class="py-4 bg-light mt-auto"> -->
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-center small">
                    <div class="text-muted">
                        Copyright &copy; Global Innovation Technology 2022
                    </div>
                </div>
            </div>
            <!-- </footer> -->
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
    <!-- <script src="assets/demo/chart-area-demo.js"></script> -->
    <!-- <script src="assets/demo/chart-bar-demo.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script> -->
    <!-- <script src="js/datatables-simple-demo.js"></script> -->

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
    <!-- <script src="js/datatables.js"></script> -->
    <script src="../js/datatables.js"></script> <!-- MDB -->
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
	//System.out.println(e.getMessage());
}

%>