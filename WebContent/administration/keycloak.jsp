<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
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
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css" />
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/keycloak-js@21.1.2/dist/keycloak.js"></script>
  	<script src="../js/keycloak.js"></script>
</head>
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
          <!-- <img src="${pageContext.request.contextPath}/img/spm.jpg" class="img-fluid" alt="" /> -->
          <h5>Hi Admin!</h5>
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
              <%-- <%
              	}
             	%> --%>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <!-- <div class="small">Logged in as:</div> -->
            <img
              src="${pageContext.request.contextPath}/img/spm.jpg"
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
            <h1 class="mt-4">Manage Users</h1>
            <div class="row">
              <div class="card mb-2">
                  <div class="card-body">
                    <div class="table-responsive">
                        <table
                          class="display nowrap"
                          id="keycloakTable"
                          style="width: 100%"
                        >
                          <thead>
                            <tr>
                              <th>Username</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                          <!-- <tbody> -->
                          <tbody class="tes"></tbody>
                          <%-- <%
                          	for(int i = 0; i< all.size(); i++){
                          		String[] trx = all.get(i);
                          		
                          		Date date = sdf1.parse(trx[1]);
                          		out.print("<tr data-status=\"" + trx[5] + "\">");
                           		out.print("<td>"+trx[0]+"</td>");
                           		out.print("<td>"+sdf2.format(date)+"</td>");
                           		out.print("<td>"+trx[2]+"</td>");
                           		out.print("<td>"+trx[3]+"</td>");
                           		out.print("<td>"+format.format(Double.valueOf(trx[4]))+"</td>");
                           		out.print("<td>"+trx[5]+"</td>");
                           		
                           		out.print("<td><button type='button' class='btn btn-secondary' onclick=\"detailDiscounts('"+trx[0]+"')\">Transactions Details</button></td>");			
                           		
                           		out.print("</tr>");
                          	}
                          %> --%>
                          <!-- </tbody> -->
                        </table>
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
	<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <!-- <script src="js/datatables.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/datatables.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

    <!-- Custom scripts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/search.js"></script>
	<script>
		let token = ""
		async function initializeKeycloak() {
		    try {
		    	console.log("masuk")
		      let authenticated = await keycloak.init({
		        onLoad: "login-required",
		      });
		      
		      //console.log(keycloak.token);
		      token = "Bearer " + keycloak.token
		      
		      return token;
		    } catch (error) {
		      console.error("Failed to initialize adapter:", error);
		    }
		    
		}
		
		async function getUsers() {
			try {
		      const token = await initializeKeycloak();
		      
		      const response = await fetch('http://192.168.3.170:8080/admin/realms/Development/users', {
		          headers: {
		              accept: 'application/json',
		              authorization: token
		          }
		      });
		      const result = await response.json();
		      console.log(result)
		      return result;
		    } catch (error) {
		      console.error("Failed to initialize adapter:", error);
		    }
		}
		
		async function handleEnable(id) {
		      //const token = await initializeKeycloak();
		      
			const response = await fetch('http://192.168.3.170:8080/admin/realms/Development/users/'+id, {
				method: "PUT",
		          headers: {
		              accept: 'application/json',
		              'Content-Type': 'application/json',
		              authorization: token
		          },
		          body: JSON.stringify({enabled: true})
		      });
			window.location.reload();
		}
		
		async function handleDisable(id) {
			// const token = await initializeKeycloak();
		      
			const response = await fetch('http://192.168.3.170:8080/admin/realms/Development/users/'+id, {
				method: "PUT",
		          headers: {
		              accept: 'application/json',
		              'Content-Type': 'application/json',
		              authorization: token
		          },
		          body: JSON.stringify({enabled: false})
		      });
			window.location.reload();
		}
		
		async function displayUsers() {
			const users = await getUsers();
			userHTML = ""
			users.forEach((user) => {
				userHTML += "<tr><td><a href='keycloak1.jsp?id="+user.id+"'>"+user.username+"</a></td>"
				if (!user.enabled) {
					userHTML += "<td class='btn btn-info' onclick=\"handleEnable('"+user.id+"')\"'>Enable</td></tr>"
				} else {
					userHTML += "<td class='btn btn-danger' onclick=\"handleDisable('"+user.id+"')\"'>Disable</td></tr>"
				}				
			})
			const tes = document.querySelector(".tes");
			const oke = document.querySelector(".oke");
			tes.innerHTML = "<div>" + userHTML + "</div>"
			$("#keycloakTable").DataTable();
			// Show loading screen
	        // $("#loadingScreen").show();
			
	        // Use AJAX to send the value to the server
	         $.ajax({
	            type: "POST", // or "GET" depending on your needs
	            url: "keycloak.jsp", // The URL of the current JSP page
	            data: { value: users },
	            success: function(response) {
	                // Handle the response from the server if needed
	                // console.log(response);
	                //tes.innerHTML = "<div>response"
	            },
	            error: function(error) {
	                console.error("Error sending value to server: " + error);
	            }
	        });
		} 
		displayUsers();
    </script>
    
    <% 
        // Retrieve the value from the request parameter
        String yourValue = request.getParameter("value");

        // Process the value as needed
        // For example, you can print it or use it in your JSP code
        // out.println("Received value from JavaScript: " + yourValue);
    %>
</body>
</html>