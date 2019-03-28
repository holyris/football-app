<classement>

<div each={classement1 in classement.dataClassement}>
    <h3>{classement1.group}</h3>
    <table>
        <thead>
            <tr>
                <th colspan="2"></th>
            </tr>
        </thead>
        <tbody >
            <tr class="header_table_classement">
                <td>Rang</td>
                <td>Equipe</td>
                <td>Pts</td>
                <td>J</td>
                <td>M</td>
                <td>E</td>
                <td>Diff</td>
            </tr>
            
            <tr each={classement2 in classement1.table}>
                    <td>{classement2.position}</td>
                    
                    <td> <img class="img_team_mini" src={classement2.team.crestUrl}/> {classement2.team.name}</td>
                    <td>{classement2.points}</td>
                    <td>{classement2.playedGames}</td>
                    <td>{classement2.goalsFor}</td>
                    <td>{classement2.goalsAgainst}</td>
                    <td>{classement2.goalDifference}</td>
            </tr>
                

        </tbody>
    </table>
</div>






<script>
this.classement = [];

this.getClassement = (()=>{
    this.classement = opts;
});
    this.getClassement();



</script>

</classement>