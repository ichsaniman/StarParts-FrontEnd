<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.Instant"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	try{
		List<String[]> getChat = SQLData.getChatList();
		
	
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
    <!-- <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css"
    /> -->
    <!-- <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"
    /> -->
    <!-- Select 2 -->
    <!-- <link
      href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
      rel="stylesheet"
    /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/live.css" />
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css"> -->
    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.foundation.min.css"> -->

    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"> -->
    <!-- <link rel="stylesheet" href="css/mdb.dark.min.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css" />
    <script type="text/javascript">
     
    </script>
  </head>

  <body
    class="sb-nav-fixed"
    style="
      /* padding-left: 10px; */
      background-color: #eff4f3;
      background-image: url(${pageContext.request.contextPath}/img/img4.png);
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
              <a class="nav-link mt-3" href="index.html" style="color: #ffffff">
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
                data-bs-target="#admin"
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
                id="admin"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Generate PDF</a
                  >
                  <a class="nav-link" href="content.html" style="color: #ffffff"
                    >Content Configuration</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Preview Sampling</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >User Management</a
                  >
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#estatement"
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
                id="estatement"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Customers PDF Data</a
                  >
                  <a
                    class="nav-link"
                    href="layout-sidenav-light.html"
                    style="color: #ffffff"
                    >Send Email</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Email Report</a
                  >
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#salesOrder"
                aria-expanded="false"
                aria-controls="collapseLayouts"
                style="color: #ffffff"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-cart-plus"></i>
                </div>
                Sales Orders
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="salesOrder"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Black List Customer</a
                  >
                  <a
                    class="nav-link"
                    href="layout-sidenav-light.html"
                    style="color: #ffffff"
                    >Discountss Management</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Approval Request</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Transactions Menu</a
                  >
                </nav>
              </div>
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
          <!-- <div class="container-fluid px-2">
            <h1 class="mt-4">live Chat</h1> -->
          <!-- <section style="background-color: #cdc4f9"> -->
          <div class="container py-5">
            <div class="row">
              <div class="col-md-15">
                <div class="card" id="chat3" style="border-radius: 15px">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-6 col-lg-5 col-xl-4 mb-4 mb-md-0">
                        <div class="p-3">
                          <div class="input-group rounded mb-3">
                            <input
                              type="search"
                              class="form-control rounded"
                              placeholder="Search"
                              aria-label="Search"
                              aria-describedby="search-addon"
                            />
                            <span
                              class="input-group-text border-0"
                              id="search-addon"
                            >
                              <i class="fas fa-search"></i>
                            </span>
                          </div>

                          <div
                            class="overflow-auto"
                            style="position: relative; height: 400px"
                          >
                            <!-- onclick="chatMessage(this)" -->
                            <ul class="list-unstyled mb-0">
                            <%
                            	for(int i = 0; i < getChat.size(); i++){
                            		
                            		List<String[]> lates = SQLData.getLatestChat(getChat.get(i)[0]);
                            		String[] late = lates.get(0);
                            		int no = SQLData.getCountChatNotRead(getChat.get(i)[0]);
                            		List<String[]> dateChat = SQLData.getDateChat(getChat.get(i)[0]);
                            		long unix = Long.parseLong(dateChat.get(0)[3]);
                            		System.out.println(unix);
                            		Instant instant = Instant.ofEpochSecond(unix);
                            		Date date1 = Date.from(instant);
                            		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                            		System.out.println("Test format "+ sdf1.format(date1));
                            		
                            		
                            		%>
                            		<li class="p-2 border-bottom contact-item">
                                <a
                                  href="javascript:void(0)"
                                  class="contact-link d-flex justify-content-between"
                                >
                                  <div class="d-flex flex-row">
                                    <div>
                                      <img
                                        src="${pageContext.request.contextPath}/img/user-circle.svg"
                                        alt="avatar"
                                        class="d-flex align-self-center me-3"
                                        width="60"
                                      />
                                      
                                    </div>
                                    <div class="pt-1">
                                      <p class="fw-bold mb-0" id="nameContact">
                                        <%=getChat.get(i)[0] %>
                                      </p>
                                      <p
                                        class="small text-muted"
                                        style="
                                          max-width: 25.5ch;
                                          overflow: hidden;
                                          white-space: nowrap;
                                          text-overflow: ellipsis;
                                        "
                                      >
                                      <%
                                      if(late[0].equals("Admin")){
                                    	  int mC = Integer.valueOf(late[4]);
                                    	  if(mC >= 0){
                                    		  
                                    	  
                              			%>
                              			<i class="fas fa-check-double"></i>
											<%=late[4] %>
                              			<%
                                    	  }
	                              		}else{
	                              			String message = "";
	                              			
	                              			System.out.println("masuk else");
	                              			System.out.println(late[2]);
	                              			List<String[]> latestMessages = SQLData.getLatestMessage(late[2]);
	                              			String[]mess = latestMessages.get(0);
	                              			System.out.println(Arrays.asList(mess));
	                              			if(mess[3].equalsIgnoreCase("text")){
	                              				System.out.println("masuk if");
	                              				out.print(latestMessages.get(0)[4]);
	                              			}else if(mess[3].equalsIgnoreCase("document")){
	                              				out.print("<i class='fas fa-file'></i>");
	                              				out.print(" "+mess[7]);
	                              			}else if(mess[3].equalsIgnoreCase("image")){
	                              				out.print("<i class='far fa-image'></i>");
	                              				out.print(" Image");
	                              			}
	                              		%>
	                              		
	                              		<%	
	                              		}
                                      %>
                                        
                                      </p>
                                    </div>
                                  </div>
                                  <div class="pt-1">
                                    <p class="small text-muted mb-1">
                                      <%=sdf1.format(date1) %>
                                    </p>
                                    <%
                                    	if(no >=0){
                                    		%>
                                    <span
                                      class="badge bg-danger rounded-pill float-end"
                                      ><%=no %></span
                                    >
                                    		
                                    		<%
                                    	}
                                    %>
                                  </div>
                                </a>
                              </li>
                            		<% 
                            	}
                            %>
                              
                            </ul>
                          </div>
                        </div>
                      </div>

                      <div class="chat col-md-6 col-lg-7 col-xl-8">
                        <!-- class="pt-3 pe-3" -->

                        <div
                          class="d-flex align-items-center justify-content-center"
                          style="height: 100%"
                        >
                          <div class="p-2 m-2">chat</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- </div> -->
            <!-- </section> -->
          </div>
          <div
            class="modal fade"
            id="exampleModalToggle"
            aria-hidden="true"
            aria-labelledby="exampleModalToggleLabel"
            tabindex="-1"
          >
            <div class="modal-dialog modal-xl">
              <div class="modal-content">
                <div class="modal-body">
                 <div class="row justify-content-end">
                    <div class="col-auto">
                      <button
                        type="button"
                        class="btn-close"
                        data-mdb-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                  </div>
                  <img id="modalImage" class="img-fluid" style="width: 100%" />
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
      </div>
      <!-- </footer> -->
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/js/testingchat.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
    <!-- <script src="assets/demo/chart-area-demo.js"></script> -->
    <!-- <script src="assets/demo/chart-bar-demo.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script> -->
    <!-- <script src="js/datatables-simple-demo.js"></script> -->
    <!-- select 2 -->

    <!-- <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="js/datatables.js"></script> -->

    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

    <!-- Custom scripts -->
  </body>
</html>


<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>