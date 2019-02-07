<h1> :bamboo: ATOMIA, a Facebook like app :bamboo: </h1>

<p> Statut : en production https://first-attempt-due-to-thp.herokuapp.com/ </p>
<h2> Versions </h2>
<p>ruby : 2.5.1<br />
rails : 5.2.2<br />
bundle : 2.0.1<br />
heroku : 7.20.1<br /></p>
<h2> Descriptif </h2>
<p>Ce projet définit un site dynamique en production, avec gestion de sessions<br />
Il propose les fontionnalités suivantes :<br/>
<ul><li>Création, utilisation et suppression de session</li>
<li>Ajout, consultation et suppression de contenu</li>
<li>Programme de messagerie instantanée (à venir)</li></ul></p>
<h2> Structure de la BDD </h2>
<p><em>City</em>(***city_id***, name:string, zip_code:string)<br />
<em>User</em>(***user_id***, first_name:string, last_name:string, user_name:string, email:string, age:integer, description:text, #city_id)<br />
<em>Gossip</em>(***gossip_id***, title:string, text:text, #author_id)<br />
<em>Commentary</em>(***commentary_id***, text:text, #author_id, #gossip_id)<br />
<em>SubCommentary</em>(***sub_commentary_id***, text:text, #author_id, #commentary_id)<br />
<em>Like</em>(***like_id***, #author_id, #gossip_id)</p>
<h2> Bugs </h2>
<h2> Devs </h2>
<p> Remy_le_sang :seedling: <br />
 :seedling: tmiquel <br />
 Amine_S :seedling: <br />
 :seedling: Nico_B <br />
 Auguste_ng :seedling: </p>

