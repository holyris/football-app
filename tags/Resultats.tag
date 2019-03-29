<resultats>
<div class="match">

    <button onclick={previousPage}><<</button>&nbsp;Journée : {matchday}&nbsp;<button onclick={nextPage}>>></button>
    <br><br>

    <div>

            <table>
                    <thead>
                        <tr>
                            <th colspan="2"></th>
                        </tr>
                    </thead>
                    <tbody >
                        
                        <tr each={match in resultats.dataResultats[matchday-1]}>
                            <td>{match.group}</td>
                            <td>.</td>
                            <td>.</td>
                            <td>.</td>
                            <td>.</td>
                            <td>.</td>

                            <td class="home_team">{match.homeTeam.name}</td>
                            <td>{match.score.fullTime.homeTeam}-{match.score.fullTime.awayTeam}</td>
                            <td class="away_team">{match.awayTeam.name}</td>
                        </tr>
                            
            
                    </tbody>
            </table>
        
        
    </div>

</div>


<script>
this.resultats = [];
this.matchday = 1
    
this.getResultats = (()=>{
    this.resultats = opts;
});
this.getResultats();

this.previousPage = (()=>{
    if(this.matchday > 0){
        this.matchday--;
        this.update();
    }    
});

this.nextPage = (()=>{
    if(this.matchday < opts.dataLength){
        this.matchday++;
        this.update();
    }
    
})

</script>
</resultats>