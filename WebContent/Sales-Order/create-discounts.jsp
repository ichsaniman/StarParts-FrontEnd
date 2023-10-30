<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	try{
		
	List<String[]> getCode = SQLData.getOutletCode();

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
      function change(sel) {
        var outlet = document.getElementById("OutletDiv");
        var item = document.getElementById("Item");
        if (sel.value === "Outlet") {
          outlet.style.display = "";
          item.style.display = "none";
        } else if (sel.value === "Item") {
          item.style.display = "";
          outlet.style.display = "none";
        } else {
          outlet.style.display = "none";
          item.style.display = "none";
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
                    >Discounts Management</a
                  >
                  <a
                    class="nav-link"
                    href="layout-static.html"
                    style="color: #ffffff"
                    >Approval Request</a
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
            <h1 class="mt-4">Create Discounts</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">Sales Order</li>
              <li class="breadcrumb-item">Discounts</li>
              <li class="breadcrumb-item">Create Discounts</li>
            </ol>
            <div class="row">
              <div class="card d-flex">
                <form class="card-body" action="${pageContext.request.contextPath}/CreateDiscounts "method="post">
                  <!-- Text input -->

                  <div class="form-outline mb-4">
                    <input type="text" id="discountName" class="form-control" name="discountName" />
                    <label class="form-label" for="discountName"
                      >Discounts Name</label
                    >
                  </div>
                   <div class="form-outline mb-4">
                    <input type="text" id="discountDesc" name="discountDesc" class="form-control" />
                    <label class="form-label" for="discountDesc"
                      >Discounts description</label
                    >
                  </div>
                  <div class="form-outline mb-4">
                    <input
                      type="number"
                      id="discountAmounth"
                      class="form-control"
                      name="discountAmounth"
                    />
                    <label class="form-label" for="discountAmounth"
                      >Discounts Amount</label
                    >
                  </div>
                  <div class="row">
                    <div class="col">
                      <div class="form-outline mb-4">
                        <input
                          type="date"
                          id="discountsStartDate"
                          class="form-control"
                          data-mdb-toggle="datepicker"
                          name="discountsStartDate"
                        />
                        <label class="form-label" for="discountsStartDate"
                          >Discounts Start Date</label
                        >
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-outline mb-4">
                        <input
                          type="date"
                          id="discountsEndDate"
                          class="form-control"
                          data-mdb-toggle="datepicker"
                          name="discountsEndDate"
                        />
                        <label class="form-label" for="discountsEndDate"
                          >Discounts End Date</label
                        >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <div class="form-outline mb-4">
                        <input
                          type="time"
                          id="discountsStartTime"
                          class="form-control"
                          step="2"
                          data-mdb-toggle="timepicker"
                          name="discountsStartTime"
                        />
                        <label class="form-label" for="discountsStartDate"
                          >Discounts Start Time</label
                        >
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-outline mb-4">
                        <input
                          type="time"
                          id="discountsEndTime"
                          class="form-control"
                          step="2"
                          data-mdb-toggle="timepicker"
                          name="discountsEndTime"
                        />
                        <label class="form-label" for="discountsEndDate"
                          >Discounts End Time</label
                        >
                      </div>
                    </div>
                  </div>

                  <label class="form-label" for="discountsType"
                    >Discounts Type</label
                  >
                  <div class="form-outline mb-4">
                    <select
                      class="js-example-basic-single form-control"
                      name="discountsType"
                      id="discountsType"
                      onchange="change(this)"
                    >
                      <option value="Select">Select</option>
                      <option value="Outlet">Outlet</option>
                      <option value="Item">Item</option>
                    </select>
                    <!-- <div> -->
                  </div>
                  <div id="OutletDiv" style="display: none;">
                    <div class="form-outline mb-4">
					    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="all" />
					    All
					</div>
					<div class="form-outline mb-4">
					    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="area"/>
					    Area
					    <select class="js-example-basic-single form-control" name="outletSpesific" id="outletSpesific" style="width: 20%">
					        <option value="Select">Select</option>    
					        <%
					        	for(int i=0; i< getCode.size(); i++){
					        		String[] code = getCode.get(i);
					        		out.print("<option value='"+code[0]+"'>"+code[1]+"</option>");
					        	}
					        	
					        
					        %>
					        
					    </select>
					</div>
					<div class="form-outline mb-4">
					    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="spesifik" />
					    Spesfic ID Outlet
					    <input type="text" name="	" id="spesificID" />
					</div>
                  </div>

                  <div id="Item" style="display: none;">
                    <!-- </div> -->
                    <div class="form-outline mb-4">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="flexRadioDefault"
                        id="flexRadioDefault1"
                        value="FDR"
                      />
                      <label class="form-check-label" for="FDR"> FDR </label>
                    </div>
                    <div class="form-outline mb-4">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="flexRadioDefault"
                        value="O2W"
                        id="flexRadioDefault1"
                      />
                      <label class="form-check-label" for="O2W"> Osram 2W </label>
                    </div>
                    <div class="form-outline mb-4">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="flexRadioDefault"
                        value="O4W"
                        id="flexRadioDefault1"
                      />
                      <label class="form-check-label" for="O4W"> Osram 4W </label>
                    </div>
                  </div>

                  <!-- <div class="form-outline mb-4">
                      <input type="text" id="template" class="form-control" />
                      <label class="form-label" for="template">Template</label>
                    </div> -->
                  <!-- Message input -->

                  <!-- <div class="form mb-4">
                      <label class="form-label" for="customFile"></label>
                      <input type="file" class="form-control" id="customFile" />
                    </div> -->
                  <!-- Submit button -->
                  <button
                    type="submit"
                    class="btn btn-danger btn mb-4 ms-2 float-end"
                    style="background-color: #8f0409; color: #ffffff"
                  >
                    <i class="far fa-save"></i> Save
                  </button>
                  <a
                    type="submit"
                    class="btn btn-dark btn mb-4 ms-2 float-end"
                    href="${pageContext.request.contextPath}/Discounts"
                  >
                    <i class="fa fa-ban"></i> Cancel
                  </a>
                </form>
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

    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <!-- <script src="js/datatables.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/datatables.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

    <!-- Custom scripts -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/search.js"></script>
  </body>
</html>



<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>