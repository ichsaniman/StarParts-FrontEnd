let contactLinkClicked = false;
var currentURL = window.location.href;
var protocol = window.location.protocol;
// Get the hostname (domain) of the current URL
var hostname = window.location.hostname;

// Get the port number of the current URL
var port = window.location.port;

// Combine the hostname and port to get the full domain with port
var domainWithPort = hostname + (port ? ':' + port : '');

var fullUrl = protocol+"//"+domainWithPort+"/StarParts/Image/"
// Function to fetch and update chat messages
var listChatHtml = "";
var socket = new WebSocket("ws://" + location.host + "/StarParts/listChat");

        socket.onopen = function(event) {
          
            console.log(event);
        };

        socket.onmessage = function(event) {
          const listChat = document.querySelector(".listChat");
            const parsedData = JSON.parse(event.data);
            const {data} = parsedData;
			if(listChatHtml != null || listChatHtml != ''){
				listChatHtml = "";
				
			}
			for(let i = 0; i < data.length; i++){
				console.log(data[i])
				let countHtml = "";
					console.log(data[i].count);
				if(data[i].count != null){
					countHtml = data[i].count;
				}
			
			listChatHtml +='<li class="p-2 border-bottom contact-item">'
+'  <a'
+'    href="javascript:void(0)"'
+'    class="contact-link d-flex justify-content-between"'
+'  >'
+'    <div class="d-flex flex-row">'
+'      <div>'
+'        <img'
+'          src="/StarParts/img/user-circle.svg"'
+'          alt="avatar"'
+'          class="d-flex align-self-center me-3"'
+'          width="60"'
+'        />'
+'      </div>'
+'      <div class="pt-1">'
+'        <p class="fw-bold mb-0" id="nameContact">'+data[i].phone+'</p>'
+'        <p'
+'          class="small text-muted"'
+'          style="'
+'            max-width: 25.5ch;'
+'            overflow: hidden;'
+'            white-space: nowrap;'
+'            text-overflow: ellipsis;'
+'          "'
+'        >'
		+data[i].messages
+'        </p>'
+'      </div>'
+'    </div>'
+'    <div class="pt-1">'
			+data[i].date
+'      <p class="small text-muted mb-1"></p>'
+       countHtml
+'    </div>'
+'  </a>'
+'</li>';
}
//console.log(listChatHtml);
		listChat.innerHTML = listChatHtml;
            //console.log(data);
        };

        socket.onclose = function(event) {
            console.log("console close")
        };

$(".listChat").on("click", ".contact-link", function() {
    // Retrieve the data associated with the clicked contact-link
    const nameContact = $(this).find("#nameContact").text();
    // You can add more data retrieval based on your HTML structure
 const chat = document.querySelector(".chat");
  //console.log(chat);
	let chatHtml = "";
	
	$.ajax({
		method:"GET",
		url:"/StarParts/Chat",
		data:{phone:nameContact},
		success: function(res){
			const{data} = res;
			console.log(data);
			
			for(let i = 0; i < data.length; i++){
				let from = data[i].from;
				if(from =='Admin'){
					console.log("Masuk admin");
					chatHtml+="<div class='d-flex flex-row justify-content-end'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";
				}else{
					if(data[i].type === 'text'){
						console.log("masuk text");
					chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";	
					}else if(data[i].type ==='image'){
						console.log("masuk images");
						let path = "'"+fullUrl+data[i].path+"'";
						console.log(path);
						if(data[i].caption === 'null'){
							console.log("null");
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div  class='bg-image hover-overlay ripple ms-auto' style='max-width: 300px; max-height: 225px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%;'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<br />"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}else{
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div  class='bg-image hover-overlay ripple ms-auto' style='max-width: 400px; max-height: 300px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<p class='small p-2 ms-3 mb-1 rounded-3'"
						+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
						+data[i].caption
						+"</p>"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}
						
					}else if(data[i].type ==='document'){
						if(data[i].caption ==='null'){
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+data[i].filename
					+"</p>"
					+"<div class='row'>"
					+"<div class='col-sm-5 mx-auto'>"
					+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
					+"<button type='submit' class='btn btn-info'> Download </button>"
					+"</form>"
					+"</div>"
					+"</div>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";	
						}else{
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+" "+ data[i].filename
					+"</p>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+data[i].caption
					+"</p>"
					+"<div class='row'>"
					+"<div class='col-sm-5 mx-auto'>"
					+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
					+"<button type='submit' class='btn btn-info'> Download </button>"
					+"</form>"
					+"</div>"
					+"</div>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
	
					+"</div>";	
						}
					}
					
					
				}
				
				
			}
			
			chat.innerHTML ="<div class='contact-profile-header p-3'>" +
			nameContact +
    		"</div>" +
			"<div id='isiChat' class='overflow-auto' style='position: relative; height: 400px'>  " +
			chatHtml+
			"</div> " +
		    "<footer>" +
		    "<div class='text-muted d-flex justify-content-start align-items-center pe-3 pt-3 mt-2'>" +
			"<input type='hidden' name='phone' id='phone' value='"+nameContact+"' />"+
			"<input type='text' class='sendMessage form-control form-control-lg' id='exampleFormControlInput2' name='messages' placeholder='Type message' />" +
		    "<a type='submit' class='ms-3' href='#!' name='sbmt' ><i class='fas fa-paper-plane'></i></a> " +
			"</div>" +
		    "</footer>";
			console.log(chat);
			var scrollbot = document.getElementById("isiChat");
			scrollbot.scrollTop =scrollbot.scrollHeight;
			
		}
	})
    // Now you can use the retrieved data to display or perform any other action
    console.log("Clicked contact-link for:", nameContact);
    // Display or manipulate data as needed
});
function updateChat(phone) {
  const container = document.querySelector(".contact-item");
  const nameContactValue = container.querySelector("#nameContact").textContent;
  const chat = document.querySelector(".chat");
 
  let chatHtml = "";
console.log("masuk update chat");
console.log(container.querySelector(".contact-profile-header"));

  $.ajax({
    method: "GET",
    url: "/StarParts/Chat",
    data: { phone: phone },
    success: function (res) {
      const { data } = res;
      console.log(data);

      for(let i = 0; i < data.length; i++){
				let from = data[i].from;
				if(from =='Admin'){
					console.log("Masuk admin");
					chatHtml+="<div class='d-flex flex-row justify-content-end'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";
				}else{
					if(data[i].type === 'text'){
						console.log("masuk text");
					chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";	
					}else if(data[i].type ==='image'){
						console.log("masuk images");
						let path = "'"+fullUrl+data[i].path+"'";
						console.log(path);
						if(data[i].caption === 'null'){
							console.log("null");
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div  class='bg-image hover-overlay ripple ms-auto' style='max-width: 300px; max-height: 225px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%;'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<br />"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}else{
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div class='bg-image hover-overlay ripple ms-auto' style='max-width: 400px; max-height: 300px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<p class='small p-2 ms-3 mb-1 rounded-3'"
						+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
						+data[i].caption
						+"</p>"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}
						
					}
					
					
				}
			}

      chat.innerHTML =
        "<div class='contact-profile-header p-3'>" +
        phone +
        "</div>" +
        "<div id='isiChat' class='overflow-auto' style='position: relative; height: 400px'>  " +
        chatHtml +
        "</div> " +
        "<footer>" +
        "<div class='text-muted d-flex justify-content-start align-items-center pe-3 pt-3 mt-2'>" +
        "<input type='hidden' name='phone' id='phone' value='" +
        phone +
        "' />" +
        "<input type='text' class='sendMessage form-control form-control-lg' id='exampleFormControlInput2' name='messages' placeholder='Type message' />" +
        "<a type='submit' class='ms-3' href='#!' name='sbmt' ><i class='fas fa-paper-plane'></i></a> " +
        "</div>" +
        "</footer>";

      var scrollbot = document.getElementById("isiChat");
      scrollbot.scrollTop = scrollbot.scrollHeight;
    },
  });
}


function displayImageInModal(imageSrc) {
        // Set the image source dynamically
		console.log(imageSrc);
        $("#modalImage").attr("src", imageSrc);

        // Show the modal
        $("#exampleModalToggle").modal("show");
      }
$(document).ready(function () {
	
	$(".contact-link").on("click", function (e) {
  const container = e.currentTarget.closest(".contact-item");

// Log the results
console.log('Current URL: ' + currentURL);
console.log('Domain with Port: ' + protocol+ domainWithPort);
  //console.log(container);
	//console.log(${pageContext.request.contextPath});
  const nameContactValue = container.querySelector("#nameContact").textContent;
  console.log(nameContactValue);
	let phone = nameContactValue.trim();
  const chat = document.querySelector(".chat");
  //console.log(chat);
	let chatHtml = "";
	
	$.ajax({
		method:"GET",
		url:"/StarParts/Chat",
		data:{phone:phone},
		success: function(res){
			const{data} = res;
			console.log(data);
			
			for(let i = 0; i < data.length; i++){
				let from = data[i].from;
				if(from =='Admin'){
					console.log("Masuk admin");
					chatHtml+="<div class='d-flex flex-row justify-content-end'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";
				}else{
					if(data[i].type === 'text'){
						console.log("masuk text");
					chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+data[i].messages
					+"</p>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";	
					}else if(data[i].type ==='image'){
						console.log("masuk images");
						let path = "'"+fullUrl+data[i].path+"'";
						console.log(path);
						if(data[i].caption === 'null'){
							console.log("null");
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div  class='bg-image hover-overlay ripple ms-auto' style='max-width: 300px; max-height: 225px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%;'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<br />"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}else{
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
						+"<div>"
						+"<div  class='bg-image hover-overlay ripple ms-auto' style='max-width: 400px; max-height: 300px' onclick=\"displayImageInModal('"+fullUrl+data[i].path+"')\">"
						+"<img src='"+fullUrl+data[i].path+"' class='img-fluid' style='width: 100%'/>"
						+"<a class='btn btn-primary' data-mdb-toggle='modal' data-mdb-target='#exampleModalToggle'>"
						+"<div class='mask' style='background-color: rgba(57, 192, 237, 0.2); ' ></div>"
						+"</a>"
						+"</div>"
						+"<p class='small p-2 ms-3 mb-1 rounded-3'"
						+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
						+data[i].caption
						+"</p>"
						+"<div class='row'>"
						+"<div class='col-sm-5 mx-auto'>"
						+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
						+"<button type='submit' class='btn btn-info'> Download </button>"
						+"</form>"
						+"</div>"
						+"</div>"
						+"<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>"
						+data[i].date
						+"</p>"
						+"</div>"
						+"</div>";
						}
						
					}else if(data[i].type ==='document'){
						if(data[i].caption ==='null'){
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+data[i].filename
					+"</p>"
					+"<div class='row'>"
					+"<div class='col-sm-5 mx-auto'>"
					+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
					+"<button type='submit' class='btn btn-info'> Download </button>"
					+"</form>"
					+"</div>"
					+"</div>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
					+"</div>";	
						}else{
							chatHtml+="<div class='d-flex flex-row justify-content-start'>"
					+"<div>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+" "+ data[i].filename
					+"</p>"
					+"<p class='small p-2 ms-3 mb-1 rounded-3'"
					+"style='background-color: #f5f6f7;max-width: 400px;overflow-wrap: break-word;white-space: wrap;hyphens: auto;'>"
					+"<i class='fas fa-file fa-lg'></i>"
					+data[i].caption
					+"</p>"
					+"<div class='row'>"
					+"<div class='col-sm-5 mx-auto'>"
					+"<form action='/StarParts/DownloadImage/"+data[i].path+"' method='post'>"
					+"<button type='submit' class='btn btn-info'> Download </button>"
					+"</form>"
					+"</div>"
					+"</div>"
					+"<p class='small ms-3 mb-3 rounded-3 text-muted float-start'>"
					+data[i].date
					+"</p>"
					+"</div>"
	
					+"</div>";	
						}
					}
					
					
				}
				
				
			}
			
			chat.innerHTML ="<div class='contact-profile-header p-3'>" +
			phone +
    		"</div>" +
			"<div id='isiChat' class='overflow-auto' style='position: relative; height: 400px'>  " +
			chatHtml+
			"</div> " +
		    "<footer>" +
		    "<div class='text-muted d-flex justify-content-start align-items-center pe-3 pt-3 mt-2'>" +
			"<input type='hidden' name='phone' id='phone' value='"+phone+"' />"+
			"<input type='text' class='sendMessage form-control form-control-lg' id='exampleFormControlInput2' name='messages' placeholder='Type message' />" +
		    "<a type='submit' class='ms-3' href='#!' name='sbmt' ><i class='fas fa-paper-plane'></i></a> " +
			"</div>" +
		    "</footer>";
			console.log(chat);
			var scrollbot = document.getElementById("isiChat");
			scrollbot.scrollTop =scrollbot.scrollHeight;
			
		}
	})
 
});
  $(".chat").on("keydown", ".sendMessage", function (e) {
    if (e.which == 13) {
      var inputValue = $(this).val().trim();
$(".sendMessage").val("");
	var phone = document.getElementById("phone").value;
	console.log(phone);
      if (inputValue) {
        $.ajax({
		method:"POST",
		url:"/StarParts/SendMessages",
		data:{phone:phone,messages:inputValue},
		success:function(res){
			/*var newMessage = $("<div class='d-flex flex-row justify-content-end'>" +
        "<div>" +
        "<p class='small p-2 ms-3 mb-1 rounded-3'>" + inputValue + "</p>" +
        "<p class='small ms-3 mb-3 rounded-3 text-muted float-end'>Now</p>" +
        "</div>" +
        "</div>");
		 $(".overflow-auto").append(newMessage);
		var chatContainer = $(".overflow-auto");
      chatContainer.scrollTop(chatContainer.prop("scrollHeight"));*/
			 $(".sendMessage").val("");
			updateChat(phone);
			
			
			
		}
})
      }
    }
  });


// Call the function initially
//updateChat();

// Set interval to call the function every 5 seconds (adjust as needed)
//setInterval(updateChat, 5000); // 5000 milliseconds = 5 seconds
});







