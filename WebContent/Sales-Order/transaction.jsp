<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	try{
		List<String[]> all = SQLData.transactionAll();
		Locale indo = new Locale("in","ID");
		NumberFormat format = NumberFormat.getCurrencyInstance(indo);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		String currentFilter = "Semua";
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
    <title>Sales Order</title>
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
      href="https://cdn.datatables.net/datetime/1.2.0/css/dataTables.dateTime.min.css"
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
    <!-- Select 2 -->
    <link
      href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
      rel="stylesheet"
    />

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css"> -->
    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.foundation.min.css"> -->

    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"> -->
    <!-- <link rel="stylesheet" href="css/mdb.dark.min.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css" />
    <script type="text/javascript">
    function detailDiscounts(id) {
		window.location = "${pageContext.request.contextPath}/DetailTransaction?id="+id;
	}
      function change(btn) {
        let button = "btn btn-danger mt-2";
        let buttonOutline = "btn btn-outline-danger mt-2";
        var semua = document.getElementById("Semua");
        var pending = document.getElementById("Pending");
        var OnProgress = document.getElementById("OnProgress");
        var success = document.getElementById("Success");
        currentFilter = btn.value
        
        var tableRows = document.querySelectorAll('#TransactionsTable tbody tr');
        
        tableRows.forEach(function(row) {
            let status = row.getAttribute('data-status');

	        if (currentFilter === "Semua" || currentFilter === status) {
	            row.style.display = 'table-row';
	        } else {
	            row.style.display = 'none';
	        }
        });

        // console.log(semua.className);
        console.log(btn.value);
        switch (btn.value) {
          case "Semua":
            semua.className = button;
            pending.className = buttonOutline;
            OnProgress.className = buttonOutline;
            success.className = buttonOutline;
            break;

          case "Pending":
            pending.className = button;
            OnProgress.className = buttonOutline;
            success.className = buttonOutline;
            semua.className = buttonOutline;

            break;

          case "On Progress":
            OnProgress.className = button;
            pending.className = buttonOutline;
            success.className = buttonOutline;
            semua.className = buttonOutline;
            break;

          case "Success":
            success.className = button;
            OnProgress.className = buttonOutline;
            pending.className = buttonOutline;
            semua.className = buttonOutline;
            break;
        }
      }
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
          <div class="container-fluid px-2">
            <h1 class="mt-4">Transactions</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">Sales Order</li>
              <li class="breadcrumb-item">Discounts</li>
              <li class="breadcrumb-item">Transactions Menu</li>
              <li class="breadcrumb-item">Transactions</li>
            </ol>
            <div class="row">
              <div class="row">
                <div class="card mb-2">
                  <div class="card-body">
                    <table class="table table-borderless">
                      <tr>
                        <td>
                          <input
                            type="text"
                            id="min"
                            name="min"
                            class="form-control mt-2"
                            placeholder="From"
                          />
                        </td>
                        <td>
                          <input
                            type="text"
                            id="max"
                            name="max"
                            class="form-control mt-2"
                            placeholder="To"
                          />
                        </td>
                        <td>
                          <div class="mx-auto">
                            <input
                              class="btn btn-outline-danger mt-2"
                              type="button"
                              name="filter"
                              value="clear"
                              onclick="clearInput()"
                            />
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="card mb-2">
                  <div class="card-body">
                    <div class="col">
                      <input
                        type="button"
                        class="btn btn-danger mt-2"
                        id="Semua"
                        value="Semua"
                        onclick="change(this)"
                      />

                      <input
                        type="button"
                        class="btn btn-outline-danger mt-2"
                        id="Pending"
                        value="Pending"
                        onclick="change(this)"
                      />

                      <input
                        type="button"
                        class="btn btn-outline-danger mt-2"
                        id="OnProgress"
                        value="On Progress"
                        onclick="change(this)"
                      />
                      <input
                        type="button"
                        class="btn btn-outline-danger mt-2"
                        id="Success"
                        value="Success"
                        onclick="change(this)"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="card mb-2">
                  <div class="card-body">
                    <div class="table-responsive">
                      <form action="">
                        <table
                          class="table table-striped"
                          id="TransactionsTable"
                        >
                          <thead>
                            <tr>
                              <th>Order ID</th>
                              <th>Order Date</th>
                              <th>Order Time</th>
                              <th>Oultet Name</th>
                              <th>Order Price</th>
                              <th>Status</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
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
                          %>
                          </tbody>
                        </table>
                      </form>
                    </div>
                  </div>
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
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
    <!-- <script src="assets/demo/chart-area-demo.js"></script> -->
    <!-- <script src="assets/demo/chart-bar-demo.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script> -->
    <!-- <script src="js/datatables-simple-demo.js"></script> -->
    <!-- select 2 -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/datetime/1.2.0/js/dataTables.dateTime.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <!-- <script src="js/datatables.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/datatables.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

    <!-- Custom scripts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/search.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/transactions.js"></script>
  </body>
</html>
	

<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>