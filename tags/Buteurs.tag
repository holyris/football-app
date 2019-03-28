<buteurs>


<h3>Buteurs</h3>
<table>
    <thead>
        <tr>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody >
        <tr class="header_table_classement">
            <td>Buts</td>
            <td>Nom</td>
            <td>Equipe</td>            
        </tr>
        
        <tr each={buteur in buteurs.dataButeurs}>
            <td>{buteur.numberOfGoals}</td>
            <td>{buteur.player.name}</td>
            <td>{buteur.team.name}</td>
        </tr>
            

    </tbody>
</table>


<script>
this.buteurs = [];

this.getButeurs = (()=>{
    this.buteurs = opts;
});

this.getButeurs();
</script>

</buteurs>