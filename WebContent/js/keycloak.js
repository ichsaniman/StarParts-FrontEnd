let keycloak = new Keycloak({
  realm: "Development",
  url: "http://192.168.3.170:8080",
  clientId: "spm",
	credentials: {
		secret: "5Eu96TIDQXA91XsJSXUQmgHCfAcQwPel"
	}
});
