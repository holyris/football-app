<resultats>
<div>

    <table>
            <thead>
                <tr>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody >
                
                <tr each={match in resultats.dataResultats}>
                    <td>{match.group}</td>
                    <td></td>
                </tr>
                    
    
            </tbody>
        </table>


</div>



<script>
this.resultats = [];
    
this.getResultats = (()=>{
    this.resultats = opts;
});
this.getResultats();

</script>
</resultats>