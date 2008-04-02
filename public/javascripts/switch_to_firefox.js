/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

  Esse script gera um banner movel para a campanha "Troque o seu Navegador"

   * Set SKIN = text

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


if ( window.debugCampanhaFF ) { alert('Modo Debug Ativado'); }
if ( window.debugCampanhaFF ) { if ( window.testarCampanhaFF ) { alert('Modo Teste Ativado\n(Rodar em toadas as plataformas)'); } }
//if ( navigator.appName.indexOf("Microsoft") > -1 || window.testarCampanhaFF ) { ///////////////////  INI só para o IE
if ( window.debugCampanhaFF ) { alert('validado.'); }

function echo(str){ document.write(str); }
var imgsFireFox = new Array(
  "<%= image_path('firefox_banners/FireFox_CoraRonai.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_RenatoRusso.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_KibeLoko.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_RobertaClose.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_Lula.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_Ronaldinho.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_MeninaDoAbsorvente.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_RubinhoBarrichello.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_MichaelJackson.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_WinonaRyder.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_Pipoca.jpg') %>",
  "<%= image_path('firefox_banners/FireFox_ZecaPagodinho.jpg') %>");
var imgFFNum = Math.round( Math.random() * (imgsFireFox.length - 1) );
if ( window.debugCampanhaFF ) { alert('Total de imagens a escolher: '+imgsFireFox.length); }

echo('<div id="troqueSeuNavegador">');
echo('<a href="http://getfirefox.com" target="_blank">');
echo('<img id="baixeOMozilla" src="<%= image_path('firefox_banners/Campanha.jpg') %>" alt="Troque seu Navegador!" title="Experimente o Mozilla-FireFox!" border="0" />');
echo('<img id="celebridade" src="'+imgsFireFox[imgFFNum]+'" alt="Celebridades que usam Mozilla-FireFox" title="Celebridades que usam Mozilla-FireFox" border="0" /></a>');
echo('<a id="pqMudarDeNavegador" href="http://twiki.im.ufba.br/bin/view/PSL/TroqueOSeuNavegador" target="_blank" title="Saiba mais sobre o Mozilla-FireFox">Por quê mudar de Navegador?</a>');
echo('</div>');
if ( window.debugCampanhaFF ) { alert('Banner Criado!'); }

var divFF = document.getElementById("troqueSeuNavegador").style;
var linkPqFF = document.getElementById("pqMudarDeNavegador").style;
var celebri = document.getElementById("celebridade").style;

divFF.border = "2px solid #4070A0";
divFF.backgroundColor = "#FFFFFF";
divFF.position = "absolute";
divFF.top = "10px";
divFF.right = "10px";
divFF.fontFamily = "helvetica, verdana, arial, tahoma, sans-serif";
divFF.fontSize = "10px";
divFF.lineHeight = "10px";
divFF.textAlign = "right";

celebri.position = "absolute";
celebri.top = "26px";
celebri.left = "12px"

linkPqFF.fontFamily = "helvetica, verdana, arial, tahoma, sans-serif";
linkPqFF.fontSize = "10px";
linkPqFF.lineHeight = "10px";
linkPqFF.fontWeight = "500";
linkPqFF.color = "#B03030";
linkPqFF.backgroundColor = "transparent";
linkPqFF.textDecoration = "none";
linkPqFF.position = "absolute";
linkPqFF.top = "287px";
linkPqFF.left = "8px"
if ( window.debugCampanhaFF ) { alert('Banner Formatado!'); }

var incPulsarFF = {};
function pulsarFF(id, limiteInf, limiteSup, prop){
  var incCor = parseInt("010101", 16);
  if ( !incPulsarFF[id] ) { incPulsarFF[id] = +1; }
  var FF = document.getElementById(id).style;
  var corAtual;
  if ( /rgb\(.*\)/.test(FF[prop]) ){
    corAtual  = parseInt( FF[prop].replace(/rgb\(\s*([0-9]+)\s*,\s*[0-9]+\s*,\s*[0-9]+\s*\)/i,'$1') ) * parseInt("10000", 16);
    corAtual += parseInt( FF[prop].replace(/rgb\(\s*[0-9]+\s*,\s*([0-9]+)\s*,\s*[0-9]+\s*\)/i,'$1') ) * parseInt("100", 16);
    corAtual += parseInt( FF[prop].replace(/rgb\(\s*[0-9]+\s*,\s*[0-9]+\s*,\s*([0-9]+)\s*\)/i,'$1') );
  } else {
    corAtual  = parseInt( FF[prop].substr(1,6), 16 );
  }
  corBli = corAtual;
  corAtual += incCor * incPulsarFF[id];
  if ( corAtual <= parseInt(limiteInf, 16) ) { incPulsarFF[id] = +1; }
  if ( corAtual >= parseInt(limiteSup, 16) ) { incPulsarFF[id] = -1; }
  FF[prop] = '#' + corAtual.toString(16);
}
self.setInterval("pulsarFF('pqMudarDeNavegador','800000','E06060','color');", 10);

function moveFF(pos, inc){
  var divFF = document.getElementById("troqueSeuNavegador").style;
  pos += inc;
  divFF.top = pos + "px";
  divFF.backgroundImage = divFF.backgroundImage;
  if ( pos < -500 ) {
    inc = 1;
    trocaCelebridade();
  }
  if ( pos < 10 ) {
    setTimeout( "moveFF("+ pos +", "+ inc +")", 12);
  } else {
    inc = -1;
    setTimeout( "moveFF("+ pos +", "+ inc +")", 10000);
  }
}
moveFF(-305, 1);

function trocaCelebridade(){
  var imgFFNum = Math.round( Math.random() * (imgsFireFox.length - 1) );
  document.getElementById("celebridade").src = imgsFireFox[imgFFNum];
  if ( window.debugCampanhaFF ) { alert('Nova celebridade: '+ imgsFireFox[imgFFNum]); }
}

if ( window.debugCampanhaFF ) { alert('Funções de animação chamadas.\nScript baixado por completo.'); }

//} //////////////////////////////////////////////////////////////////////////////////////////  FIM só para o IE

