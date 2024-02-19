<%@page import="id.git.message.model.Message"%>
<%@page import="id.git.db.SQLData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%
	try{
		if(session.getAttribute("currentUser") !=null){
			String current = session.getAttribute("currentUser").toString();
			//System.out.println("cek user: "+current);
			String contentID= request.getParameter("contentID").toString();
			List<String[]> getContent = SQLData.getContentById(contentID);
    	
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
    <link href="../css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <link rel="icon" href="../img/spm.jpg" type="image/x-icon" />
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
    <link rel="stylesheet" href="../css/mdb.min.css" />
    <!-- html editor -->
    <script type="text/javascript"
      src="../tinymce_6.3.1/tinymce/js/tinymce/tinymce.min.js"
      
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
  </head>
  <script type="text/javascript">
  function myFunction() {
		var contentArea = tinyMCE.get('pdfedit').getContent();
		var id = document.getElementById('idcontent').value;
		
		  console.log(id);
	
		  console.log(contentArea);
	
		 $.ajax({
				method: "POST",
				url: "${pageContext.request.contextPath}/EditPDF",
				
		        data: { id: id , contentArea: contentArea},
		 success: function(data){
			 
				 console.log(data);
				 console.log(data.redirect);
				 
		            // data.redirect contains the string URL to redirect to
				 window.location.href  = data.redirect;
			      
		        
  		
  },
 
});
		        
		        
		

		}
  tinymce.init({
	    selector: "textarea#pdfedit",
	    toolbar_mode: "floating",
	    plugins:
	      "lists advlist anchor link autolink autoresize autosave charmap code codesample directionality emoticons fullscreen help image insertdatetime link lists media nonbreaking pagebreak preview searchreplace table visualblocks wordcount",
	    toolbar1:
	      "undo redo styles bold italic alignleft aligncenter alignright alignjustify lineheight bullist  numlist bullist |table visualblocks visualchars wordcount ",
	    toolbar2:
	      " anchor link charmap code codesample ltr rtl emoticons fullscreen  image insertdatetime link nonbreaking pagebreak preview searchreplace visualchars help",
	    table_toolbar:
	      "tableprops tabledelete | tableinsertrowbefore tableinsertrowafter tabledeleterow | tableinsertcolbefore tableinsertcolafter tabledeletecol ",
	    toolbar_mode: "floating",
	    visualchars_default_state: true,
	    tinycomments_mode: "embedded",
	    tinycomments_author: "Author name",
	    autosave_ask_before_unload: false,
	    allow_html_in_named_anchor: true,
	    automatic_uploads: true,
	    file_picker_types: "image",
	    image_title: true,
	    link_default_target: "_blank",
	    fullscreen_native: true,
	    file_picker_types: 'image',
	    file_picker_callback: (cb, value, meta) => {
	        const input = document.createElement('input');
	        input.setAttribute('type', 'file');
	        input.setAttribute('accept', 'image/*');
	    
	        input.addEventListener('change', (e) => {
	          const file = e.target.files[0];
	    
	          const reader = new FileReader();
	          reader.addEventListener('load', () => {
	            /*
	              Note: Now we need to register the blob in TinyMCEs image blob
	              registry. In the next release this part hopefully won't be
	              necessary, as we are looking to handle it internally.
	            */
	            const id = 'blobid' + (new Date()).getTime();
	            const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
	            const base64 = reader.result.split(',')[1];
	            const blobInfo = blobCache.create(id, file, base64);
	            blobCache.add(blobInfo);
	    
	            /* call the callback and populate the Title field with the file name */
	            cb(blobInfo.blobUri(), { title: file.name });
	          });
	          reader.readAsDataURL(file);
	        });
	    
	        input.click();
	      },
	    //   a11y_advanced_options: true,
	  });
  </script>
  <body
    class="sb-nav-fixed"
    style="
      /* padding-left: 10px; */
      background-color: #eff4f3;
      background-image: url(../img/img4.png);
      background-repeat: no-repeat;
      background-attachment: fixed;
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
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="#!">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
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
                    href="../E-Statement\Send-WA.jsp"
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
      <!-- end navbar -->

      <!-- start content -->
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-2">
            <h1 class="mt-4">Edit Content</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">Administration</li>
              <li class="breadcrumb-item">Content Configuration</li>
              <li class="breadcrumb-item">PDF Configuration</li>
              <li class="breadcrumb-item">Edit Content</li>
            </ol>
            <div class="row">
              <div class="card d-flex">
               <form class="card-body"  action="${pageContext.request.contextPath}/EditPDF" method="post" >
                  <% Message m1=(Message) session.getAttribute("msgEditPDF");
					  			if(m1!=null){
					  				%><div class="alert alert-<%=m1.getCssClass()%>" role="alert">
					  					<%=m1.getContent() %>
					  				</div>
					  				<%
					  			}
					  		%>
					  		<%session.removeAttribute("msgEditPDF"); %>
                  <div class="form-outline mb-4">
                    <input type="text" id="Title" class="form-control"value="<%=getContent.get(0)[1]%>" disabled />
                    <label class="form-label" for="Title">Title</label>
                    <input type="hidden" id="idcontent"name="idcontent" value="<%=contentID%>">
                  </div>
                  <!-- Message input -->
                  <div class="form-outline mb-4">
                    <textarea
                      class="form-control"
                      id="Description"
                      rows="4"
                    ><%=getContent.get(0)[2]%></textarea>
                    <label class="form-label" for="Description"
                      >PDF content for E-Statement
                    </label>
                  </div>
                  <div class="form-outline mb-4">
                    <textarea
                      class="form-control"
                      id="pdfedit"
                      rows="4"
                      name="pdfedit"
                    ><%=getContent.get(0)[8]%></textarea>
                    <label class="form-label" for="pdfedit"
                      >Editor for PDF content
                    </label>
                  </div>
                  <!-- <div class="form mb-4">
                    <label class="form-label" for="customFile"></label>
                    <input type="file" class="form-control" id="customFile" />
                  </div> -->
                  <!-- Submit button -->
                  <button
                    type="button"
                    class="btn btn-danger btn mb-4 ms-2 float-end"
                    style="background-color: #8f0409; color: #ffffff"
                  	onclick="myFunction()"
                  >
                    <i class="far fa-save"></i> Save
                  </button>
                  <button
                    type="submit"
                    class="btn btn-dark btn mb-4 ms-2 float-end"
                    
                    onclick="window.location.href=pdf-configuration.jsp"
                  >
                    <i class="fa fa-ban"></i> Cancel
                  </button>
                </form>
              </div>
            </div>
          </div>
        </main>
        <!-- end content -->
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
    <script type="text/javascript" src="../js/scripts.js"></script>
    
    
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="../js/mdb.min.js"></script>

    <!-- Custom scripts -->
    <script type="text/javascript"></script>
   
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

