<app>

<div if={loading} class="spinner"></div>
<div grid="top">
	<div>
		<h1>Championnats</h1>
		<button class="button" each={competition in competitions} onclick={onclickCompetition} name={competition.name} id={competition.id} data-area={competition.area.name}>{competition.name}</button>
	</div>
</div>

<div if={display_menu}>
	<h3>{compet_name} {compet_area}</h3>
	<button id="classement" onclick={onclickClassement}>Classement</button>
	<button id="resultats" onclick={onclickResultats}>Résultats</button>
	<button	id="buteurs" onclick={onclickButeurs}>Buteurs</button>
	<br><br>

	<Classement if={display_classement} data-classement={classement}></Classement>

	<Resultats if={display_resultats} data-resultats={resultats} data-length={length_resultats}></Resultats>

	<Buteurs if={display_buteurs} data-buteurs={buteurs}></Buteurs>


</div>


<script>
this.mixin('serviceAjax');
this.loading = false; // variable qui permet d'activer le spinner

this.competitions = [];
this.classement = [];
this.buteurs = [];
this.resultats = [];
this.length_resultats;

this.display_menu = false;
this.display_classement=false;
this.display_buteurs = false;
this.display_resultats = false;

this.compet_id =0;
this.compet_name = "";
this.compet_area ="";


this.getCompetitions = (()=>{
	this.loading = true;
	this.requeteCompetitions().then((data) => {
		this.competitions=data.competitions;
		this.update();
	});
	this.loading = false;

});

this.getCompetitions();

this.getClassement = ((id)=>{
	this.loading = true;
	this.requeteClassement(id).then((data) =>{

		//cela permet de ne pas stocker les classements pour home et away
		data.standings.forEach((classement)=>{
			if(classement.type == "TOTAL")
				this.classement.push(classement);			
		});
		this.update();

	});
	this.loading = false;

});

this.getResultats = ((id)=>{
	this.loading = true;
	this.requeteResultats(id).then((data)=>{
		
		data.matches.forEach((resultat)=>{
			j = resultat.matchday - 1;
			if(this.resultats[j] == undefined)
				this.resultats[j] = [];
			this.resultats[j].push(resultat);
			j++;
		});
		this.length_resultats = this.resultats.length;
		this.update();
	});
	this.loading = false;
});

this.getButeurs = ((id)=>{
	this.loading = true;
	this.requeteButeurs(id).then((data)=>{
		this.buteurs = data.scorers;
		this.update();
	})
	this.loading = false;
});


this.onclickCompetition = ((event)=>{
	// si la competition cliquee est differente de celle deja selectionnee alors remettre a zero
	if(this.compet_id != event.target.id){
		this.classement = [];
		this.buteurs = [];
		this.resultats = [];
		this.resetDataDisplay();
	}
	this.compet_id=event.target.id;
	this.compet_name=event.target.name;
	this.compet_area=event.target.dataset.area;
	this.display_menu = true;

});


this.onclickClassement = ((event)=>{
	// permet de ne pas refaire la requete pour rien
	if(this.classement.length == 0)
		this.getClassement(this.compet_id);

	this.resetDataDisplay();
	this.display_classement = true;

});

this.onclickResultats = ((event)=>{
	// permet de ne pas refaire la requete pour rien
	if(this.resultats.length == 0)
		this.getResultats(this.compet_id);

	this.resetDataDisplay();
	this.display_resultats = true;
})

this.onclickButeurs = ((event)=>{
	// permet de ne pas refaire la requete pour rien
	if(this.buteurs.length == 0)
		this.getButeurs(this.compet_id);

	this.resetDataDisplay();
	this.display_buteurs = true;
})

// permet d'avoir une fonction utilisable pour n'importe onglet
this.resetDataDisplay = (()=>{
	this.display_classement = false;
	this.display_resultats = false;
	this.display_buteurs = false;
});
</script>
</app>

