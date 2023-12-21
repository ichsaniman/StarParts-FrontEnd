<%@page import="java.util.Arrays"%>
<%@page import="id.git.api.model.ResponseItemProductInfo"%>
<%@page import="id.git.api.model.ResponseItemData"%>
<%@page import="id.git.api.service.GetApiDataSpring"%>
<%@page import="id.git.api.model.ResponseItem"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	try{
		String id = request.getParameter("id");
		System.out.println("Dari detail "+id);
		List<String[]> lGetOrder = SQLData.getOrder(id);
		String[] getOrder = lGetOrder.get(0);
		String outletId = getOrder[4];
		List<String[]> lGetOutletDetail = SQLData.getOuletDetail(outletId);
		String[] getOutletDetail= lGetOutletDetail.get(0);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		Date date = sdf1.parse(getOrder[1]);
		List<String[]> getDiscounts = SQLData.getDetailDiscount(id);
		
		List<String[]> getItems = SQLData.getDetailItemTRX(id);
		
		Locale indo = new Locale("in","ID");
		NumberFormat format = NumberFormat.getCurrencyInstance(indo);
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
                    href="${pageContext.request.contextPath}/Discounts"
                    style="color: #ffffff"
                    >Discounts Management</a
                  >
                  
                  <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/Transaction"
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
          <div class="container-fluid px-2">
            <h1 class="mt-4">Transactions Details</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">Sales Order</li>
              <li class="breadcrumb-item">Discounts</li>
              <li class="breadcrumb-item">Transactions Menu</li>
              <li class="breadcrumb-item">Transactions</li>
              <li class="breadcrumb-item">Transactions Details</li>
            </ol>
            <div class="row">
              <!-- <div class="card mb-2"> -->
              <!-- <div class="card-body"> -->
              <div class="row">
                <div class="col">
                  <div class="card mb-1">
                    <div class="card-body">
                      <h2 class="mt-4">Transactions</h2>
                      <div class="row" style="width: auto">
                        <!-- <h6>Order ID</h6> -->
                        <!-- <span>Order ID</span>
                        <span>Order ID123</span> -->
                        <table class="table table-borderless">
                          <tr>
                            <td>Order ID</td>
                            <td><%=getOrder[0] %></td>
                          </tr>
                          <tr>
                            <td>Order Date</td>
                            <td><%=sdf2.format(date) %></td>
                          </tr>
                          <tr>
                            <td>Order Time</td>
                            <td><%=getOrder[2] %></td>
                          </tr>
                          <tr>
                            <td>Status</td>
                            <td><%=getOrder[3] %></td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 ms-md-auto">
                  <div class="card mb-1">
                    <div class="card-body">
                    <form action="${pageContext.request.contextPath}/DetailTransaction "method="post">
                    <input type="text" name="orderId"  value=<%=id%> hidden>
                      <%
                      	if(getOrder[3].equals("Pending") || getOrder[3].equals("On Progress")){
                      		out.print("<div class='row'>");
                      		out.print("<button type='submit' name='prosses'>Prosses</button>");
                      		out.print("</div>");
                      		out.print("<br />");
                      	}
                      %>
                      <div class="row">
                        <button type="submit" name="download">Download</button>
                      </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <br />
              </div>
              <div class="row">
                <div class="col">
                  <div class="card mb-1">
                    <div class="card-body">
                      <h2 class="mt-4">Outlet</h2>
                      <div class="row" style="width: auto">
                        <!-- <h6>Order ID</h6> -->
                        <!-- <span>Order ID</span>
                        <span>Order ID123</span> -->
                        <table class="table">
                          <tr>
                            <td>Outlet Name</td>
                            <td><%=getOutletDetail[1] %></td>
                          </tr>
                          <tr>
                            <td>Outlet Phone</td>
                            <td><%=getOutletDetail[2] %></td>
                          </tr>
                          <tr>
                            <td>Outlet Address</td>
                            <td>
                              <address><%=getOutletDetail[3] %></address>
                            </td>
                          </tr>
                          <tr>
                              <td>Type</td>
                              <td><%=getOutletDetail[4] %> </td>
                            </tr>
                            <tr>
                              <td>Discount</td>
                              <td><%=getOutletDetail[5] %></td>
                            </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <br />
                <div class="col">
                  <div class="card mb-1">
                    <div class="card-body">
                      <h2 class="mt-4">Discounts Use</h2>
                      <!-- <div class="row"> -->
                      <table class="table table-striped" id="discountsTables">
                        <thead>
                          <tr>
                            <th>Discount ID</th>
                            <th>Discount Name</th>
                            <th>Discount Ammounth</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                        	for(int i =0; i < getDiscounts.size(); i++){
                        		String[] discounts = getDiscounts.get(i);
                        		out.print("<tr>");
                        		out.print("<td>"+discounts[0]+"</td>");
                        		out.print("<td>"+discounts[1]+"</td>");
                        		out.print("<td>"+discounts[2]+"</td>");
                        		out.print("</tr>");
                        	}
                        %>
                         
                        </tbody>
                      </table>
                      <!-- </div> -->
                    </div>
                  </div>
                </div>
              </div>
              <div class="row"><br /></div>
              <div class="row">
                <div class="card mb-1">
                  <div class="card-body">
                    <h2 class="mt-4">Orders</h2>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>No</th>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Item Quantity</th>
                            <th>Item Price normal/pcs</th>
                            <th>Item Price discount /pcs</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<%
                        		for (int it = 0; it < getItems.size(); it++){
                        			System.out.println("masuk get item");
                        			String[]items = getItems.get(it);
                        			System.out.println(Arrays.asList(items));
                        			ResponseItem ri = GetApiDataSpring.getItem(items[0]);
                        			Double itemPcs = Double.valueOf(items[2]);
                        			List<ResponseItemData> rid = ri.getData();
                        			List<ResponseItemProductInfo> lripi = rid.get(0).getProductInfo();
                        			ResponseItemProductInfo ripi = lripi.get(0);

                        			Double itemNormalPrice = Double.valueOf(ripi.getPrice());
                        			int qty = Integer.valueOf(items[1]);
                        			Double total = itemPcs * qty;
                        			int no = it+1;
                        			out.print("<tr>");
                        			out.print("<td>"+no+"</td>");
                        			out.print("<td>"+items[0]+"</td>");
                        			out.print("<td>"+items[1]+"</td>");
                        			out.print("<td>"+qty+"</td>");
                        			out.print("<td>"+format.format(itemNormalPrice)+"</td>");
                        			out.print("<td>"+format.format(itemPcs)+"</td>");
                        			out.print("</tr>");
                        		}
                        	%>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <!-- </div> -->
              <!-- </div> -->
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