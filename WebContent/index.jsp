<%@page import="id.git.message.model.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>StarParts</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/spm.jpg" type="image/x-icon" />
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
    <link rel="stylesheet" href="css/mdb.min.css" />
  </head>

  <body>
    <!-- Start your project here-->
    <section class="vh-100" style="background-color: #C0C0C0">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col col-xl-10">
            <div class="card" style="border-radius: 1rem">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img
                    src="img/spm4.jpg"
                    alt="login form"
                    class="img-fluid"
                    style="border-radius: 1rem 0 0 1rem"
                  />
                </div>
                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                  <div class="card-body p-4 p-lg-5 text-black">
                    <form action="Login" class="login__form" method="POST">
                      <div class="d-flex align-items-center mb-3 pb-1">
                        <!-- <i
                          class="fas fa-cubes fa-2x me-3"
                          style="color: #93090b"
                        ></i> -->
                        <!-- <span class="h1 fw-bold mb-0">Logo</span> -->
                        <img src="img/spm.jpg" alt="logo" class="img-fluid" />
                      </div>
                      <br />
                      <h5
                        class="fw-normal mb-3 pb-3"
                        style="letter-spacing: 2px"
                      >
                        Sign into your account
                      </h5>
						<% Message m1=(Message) session.getAttribute("msgLogin");
					  			if(m1!=null){
					  				%><div class="alert alert-<%=m1.getCssClass()%>" role="alert">
					  					<%=m1.getContent() %>
					  				</div>
					  				<%
					  			}
					  		%>
					  		<%session.removeAttribute("msgLogin"); %>
                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form2Example17"
                          name="username"
                          class="form-control form-control-lg"
                        />
                        <label class="form-label" for="form2Example17"
                          >Username</label
                        >
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="password"
                          name = "password"
                          id="form2Example27"
                          class="form-control form-control-lg"
                        />
                        <label class="form-label" for="form2Example27"
                          >Password</label
                        >
                      </div>

                      <div class="pt-1 mb-4">
                        <button
                          class="btn btn-dark btn-lg btn-block"
                          type="submit" name ="sign"
                        >
                          Login
                        </button>
                      </div>
						
                      <!-- <a class="small text-muted" href="#!">Forgot password?</a> -->
                      <!-- <p class="mb-5 pb-lg-2" style="color: #393f81"> -->
                      <!-- Don't have an account? -->
                      <!-- <a href="#!" style="color: #393f81">Register here</a>
                      </p>
                      <a href="#!" class="small text-muted">Terms of use.</a>
                      <a href="#!" class="small text-muted">Privacy policy</a> -->
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End your project here-->

    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>

    <!-- Custom scripts -->
    <script type="text/javascript"></script>
    
  </body>
</html>
