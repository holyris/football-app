function makeServiceAjax(){
    var apikey="b284f4d52944410690feabef0833d825";
    var urlBase = "https://api.football-data.org/v2";
    
    var service = {
        requeteCompetitions:requeteCompetitions,
        requeteClassement:requeteClassement,
        requeteButeurs:requeteButeurs,
        requeteResultats:requeteResultats,
    };

    function requeteCompetitions(){
        var plan = 'TIER_ONE';
        var url=urlBase
                +'/competitions?plan='
                +plan;

        return new Promise(function(resolve,reject){
            http = new XMLHttpRequest();
            http.open("GET",url);
            http.setRequestHeader("X-Auth-Token", apikey);
            http.responseType="json";
            http.send();
            http.onload=function(){
                resolve(this.response);
                
            };
            http.onerror=function(){
                reject("Erreur");
            };            
        });
    }



    function requeteClassement(id){
        var url=urlBase
                + "/competitions/"
                + id
                + "/standings";  
    

        return new Promise(function(resolve,reject){
            http = new XMLHttpRequest();
            http.open("GET",url);
            http.setRequestHeader("X-Auth-Token", apikey);
            http.responseType="json";
            http.send();
            http.onload=function(){
                resolve(this.response);
                
            };
            http.onerror=function(){
                reject("Erreur");
            };            
        });
    }

    function requeteResultats(id){
        var url=urlBase
                +'/competitions/'
                +id
                +'/matches';

        return new Promise(function(resolve,reject){
            http = new XMLHttpRequest();
            http.open("GET",url);
            http.setRequestHeader("X-Auth-Token", apikey);
            http.responseType="json";
            http.send();
            http.onload=function(){
                resolve(this.response);
                
            };
            http.onerror=function(){
                reject("Erreur");
            };            
        });
    }


    function requeteButeurs(id){
        var url=urlBase
                + "/competitions/"
                + id
                + "/scorers";  
    

        return new Promise(function(resolve,reject){
            http = new XMLHttpRequest();
            http.open("GET",url);
            http.setRequestHeader("X-Auth-Token", apikey);
            http.responseType="json";
            http.send();
            http.onload=function(){
                resolve(this.response);
                
            };
            http.onerror=function(){
                reject("Erreur");
            };            
        });
    }
    
    return service;
}
    