<%@page import="id.git.service.ChatJson"%>
<%@page import="id.git.util.Function"%>
<%@page import="id.git.service.CheckService"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintStream"%>
<%@ page import="java.util.Optional" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
 	try{

 		if(session.getAttribute("currentUser") !=null){
 			Cookie[] cookies = request.getCookies();
 			// Find the cookie with the name "token"
 		    Optional<Cookie> usernameCookie = null;
 		    for (Cookie cookie : cookies) {
 		        if ("token".equals(cookie.getName())) {
 		            usernameCookie = Optional.of(cookie);
 		            break;
 		        }
 		    }
 		    
 			// Retrieve and display the cookie value
 		    String token = "Token not found";
 		    if (usernameCookie != null && usernameCookie.isPresent()) {
 		        token = usernameCookie.get().getValue();
 		    }
 		    
 		    // System.out.println("cek token: " + token);
 	        
 			int countCustomer = SQLData.customerCount();
 			String current = session.getAttribute("currentUser").toString();
 			int role = SQLData.getUserRole(current); 
 			// System.out.println("cek user: "+current);
 			HashMap<String, Double> set = SQLData.selectChart();
 			if(set.size() == 0) set.put(Function.getPeriod(), 0.0);
 			Double obs = Collections.max(set.values());
 			//System.out.println(obs);
 			String json = ChatJson.get();
 			DecimalFormat df1 = new DecimalFormat("#.##");
 			HashMap<String, Double> fix = new HashMap<String, Double>();
 			Double total3;
 			Double obtained ;
 			Map<String, Double> reverseSortedMap = new TreeMap<String, Double>(set);
 			for (Entry<String, Double> pair : reverseSortedMap.entrySet()) {
 				obtained = pair.getValue();
 				total3 = obtained * 100 / obs;
 				//System.out.println(obtained);
 			    fix.put(pair.getKey(), obtained) ;   
 			}
 			Map<String, Double> reverseSortedMap1 = new TreeMap<String, Double>(fix);
 			Double max = Collections.max(reverseSortedMap1.values());
 			boolean WhatsApp = CheckService.CheckSend();
 			boolean Gen = CheckService.CheckGen();
 			String wa = "", pdf = "";
 			
 			if(WhatsApp == true){
 				wa = "ON";
 			}else if (WhatsApp == false){
 				wa ="OFF";
 			}if(Gen == true){
 				pdf = "ON";
 			}else if(Gen == false){
 				pdf ="OFF";
 			}
 %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>E-Statement</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <link rel="icon" href="${pageContext.request.contextPath}/img/spm.jpg" type="image/x-icon" />
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <!-- Google Fonts Roboto -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <!-- MDB -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/keycloak-js@21.1.2/dist/keycloak.js"></script>
    <script src="js/keycloak.js"></script>
  </head>
  <script type="text/javascript">
  
 
  </script>
  <body
    class="sb-nav-fixed"
    style="
      /* padding-left: 10px; */
      background-color: #eff4f3;
      background-image: url(${pageContext.request.contextPath}/img/img4.png);
      background-repeat: no-repeat;
      background-attachment: fixed;
      white-space: nowrap;
      overflow-x: auto;
      /* display: initial; */
      /* margin: 10px; */
      /* padding: 10px; */
      /* background-size: 20%; */
      height: 100vh;
      /* background: ; */
      background-position: right bottom; /*Positioning*/
    "
  >
    <!-- navbar -->
    <nav
      class="sb-topnav navbar navbar-expand navbar bg-light"
      style="border-radius: 1rem"
    >
      <!-- <nav class="sb-topnav navbar navbar-expand navbar bg-light" style="background-color: #640405"></nav> -->
      <!-- Navbar Brand-->
      <!-- <a class="navbar-brand ps-3" href="index.html">E-Statement</a> -->
      <img src="${pageContext.request.contextPath}/img/spm.jpg" class="navbar-brand img-fluid ps-2" alt="" />
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
              <a class="nav-link mt-3" href="${pageContext.request.contextPath}/Home" style="color: #ffffff">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Dashboard
              </a>
              <a class="nav-link" href="${pageContext.request.contextPath}/LiveChat" style="color: #ffffff">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-comments"></i>
                </div>
                Live Chat
              </a>
              <!-- <div class="sb-sidenav-menu-heading" style="color: #ffffff">
                Interface
              </div> -->
              <%
              	if(role == 1){
              		
              	
              %>
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
                  <a class="nav-link" href="${pageContext.request.contextPath}/GeneratePDF" style="color: #ffffff"
                    >Generate PDF</a
                  >
                  <a
                    class="nav-link"
                    href="${pageContext.request.contextPath}/Content"
                    style="color: #ffffff"
                    >Content Configuration</a
                  >
                  
                  <a class="nav-link" href="administration\user-management.jsp" style="color: #ffffff"
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
                    href="E-Statement\cutomer-pdf-data.jsp"
                    style="color: #ffffff"
                    >Customers PDF Data</a
                  >
                  <a
                    class="nav-link"
                    href="E-Statement\Send-WA.jsp"
                    style="color: #ffffff"
                    >Send WhatsApp</a
                  >
                  <a
                    class="nav-link"
                    href="E-Statement\history-report.jsp"
                    style="color: #ffffff"
                    >WhatsApp Report</a
                  >
                  <a
                    class="nav-link"
                    href="E-Statement\Live-Chat.jsp"
                    style="color: #ffffff"
                    >Live Chat</a
                  >
                </nav>
              </div>
              <a class="nav-link" href="${pageContext.request.contextPath}/administration/keycloak.jsp" style="color: #ffffff">
                Keycloak
              </a>
              <%
              	}
             	%>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <!-- <div class="small">Logged in as:</div> -->
            <img
              src="img/spm.jpg"
              class="img-fluid"
              alt=""
              style="border-radius: 1rem"
            />
          </div>
        </nav>
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            <div class="row">
              <div class="col-xl-6">
                <div class="card mb-2">
                  <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    Total Customers
                  </div>
                  <div class="card-body">
                    <h1 class="justify-content-center align-items-center">
                      <%=countCustomer %> Person<i class="fas fa-user me-1 float-end"></i>
                    </h1>
                    <!-- <canvas id="myAreaChart" width="100%" height=""></canvas> -->
                  </div>
                </div>
                <div class="card mb-2">
                  <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    PDF Schaduler
                  </div>
                  <div class="card-body">
                    <div class="row row-cols-2">
                      <h3 class="">STATUS</h3>
                      <h3 class=""><%=pdf %></h3>
                    </div>
                  </div>
                </div>
                <div class="card mb-2">
                  <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    WhatsApp Schaduler
                  </div>
                  <div class="card-body">
                    <div class="row row-cols-2">
                      <h3 class="">STATUS</h3>
                      <h3 class=""><%=wa %></h3>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-6">
                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Send Status Chart
                  </div>
                  <div class="card-body">
                    <input type="month" onchange="filter1(this)">  
                    <canvas id="myBarChart1" width="100%" height="80"></canvas>
                    
                  </div>
                </div>
              </div>
              <div class="col-xl-6"></div>
              
            </div>
          </div>
        </main>
        <!-- <footer class="py-4 bg-light mt-auto"> -->
        <div class="container-fluid px-4">
          <div class="d-flex align-items-center justify-content-center small">
            <div class="text-muted">
              Copyright &copy; Global Innovation Technology  <script>document.write(new Date().getFullYear())</script>
            </div>
          </div>
        </div>
        <!-- </footer> -->
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
     <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <!-- <script src="js/scripts.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
    <!-- <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
    crossorigin="anonymous"
  ></script> -->
    <!-- <script src="assets/demo/chart-area-demo.js"></script> -->
    <!-- <script src="assets/demo/chart-bar-demo.js"></script> -->
   
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script >
	 let titleG = [];
	 let Gdataf = [];
     let Gdata = [];
     let Sdata = [];
     let Sdataf = [];
     let mins = [];
     var ctx1 = document.getElementById("myBarChart1");
     let test = <%=json%>;
     console.log(test);
     save(test);
     
	function save(response){
		const {min, dataMain} = response;
    	mins.push(min);
   	 	for (let i = 0; i < dataMain.length; i++) {
   		    titleG.push(dataMain[i].Date);
   		    	for(let dl = 0; dl< dataMain[i].data.length; dl++){
   		        	let status = dataMain[i].data[dl].Status;
   		        	let total = dataMain[i].data[dl].Total;
   		        	if(status == "R"){
   		        		Sdataf.push(total);
   		        	}else{
   		        		Sdata.push(total);
   		        	}
   		    	}
   		    // console.log(tmp)
   		  }
	}
     console.log(mins[0]);
     for(let a = 0 ; a< titleG.length; a ++){
    	 console.log(titleG[a]);
     }
     
	
      const myChart1 = new Chart(ctx1, {
              type: "bar",
              data: {
                labels: titleG,
                datasets: [
            {
              label: "Succes PDF Send",
              // backgroundColor: "rgba(2,117,216,1)",
              backgroundColor: "#229410",
              borderColor: "rgba(2,117,216,1)",
              data: Sdata,
            },
            {
              label: "Failed PDF Send ",
              // backgroundColor: "rgba(2,117,216,1)",
              backgroundColor: "#940000",
              borderColor: "rgba(2,117,216,1)",
              data: Sdataf,
            },
          ],
          },
          options: {
              scales: {
                y: {
                  beginAtZero: true,
                  gridLines:{
                    display:true
                  }
                },
                x:{
                  type:'time',
                  time:{
                    unit:'month'
                  }, 
                  min:mins[0],
                  gridLines:{
                    display: false,
                  }
                }
              }
          }     
      })
      
        
	
	
	function filter1(date){
        console.log(date.value);
        const year = date.value.substring(0,4);
        const month = date.value.substring(5,7);
        console.log(month +" samlekum "+year);
        const startDate = date.value;
        console.log(startDate)
        myChart1.options.scales.x.min = startDate;
        myChart1.options.scales.x.max= startDate;
        myChart1.update();
      }
        </script>
	<script>
	  async function initializeKeycloak() {
	    try {
	      let authenticated = await keycloak.init({
	        onLoad: "login-required",
	      });
	        console.log(
	          `User is ${authenticated ? "authenticated" : "not authenticated"}`
	        );
	    } catch (error) {
	      console.error("Failed to initialize adapter:", error);
	    }
		}
	
		initializeKeycloak();
	</script>
  </body>
</html>
<%
 		}else{
 			session.invalidate();
 			response.sendRedirect("/StarParts/");
 		}
 	}catch(Exception e ){
 		e.printStackTrace();
 		//System.out.println(e.getMessage());
 	}
%>