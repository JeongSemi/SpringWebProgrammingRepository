<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
<html>
<head>
    <title>15 Puzzle Game</title>
    <meta name="generator" content="Microsoft FrontPage 4.0">

    <script language="JavaScript">

var completed=true; // ??? ??????? ?? ??

// ???(str)? ???(sep)? ?? ???? ???? ??
// sep: ???(seprator)
function tokenize(sep,str)
{
  tokens = new Array(); // ?? ???
  
  i=0;
  while(1)
  {
     idx=str.indexOf(sep);
     if(idx == -1)
     {
          if(str.length>0)
          {
              tokens[i]=str;
          } 
          break;
     }
     tokens[i++]=str.substring(0,idx); // ??? ?? ??
     str=str.substr(idx+1); // ?? ??? ?? ???
  }
  return tokens;
}

// ?????? x ??
function getX(idx)
{
  var rest=idx-Math.floor(idx/4)*4; 
  return (rest==0)?4:rest;
}

// ?????? y ??
function getY(idx)
 {
    return Math.floor((idx-1)/4)+1;
 }

// ?????? ??(x,y)? ? ?? ???? ??
function getIndex(x,y)
 {
   return x+(y-1)*4;
 }

// x(?? y) ??? ???? ??? ? ?? ??? ??? ??
function newDirection(pos)
{
  var dir;

  if ((pos==2)||(pos==3)) dir=(Math.floor(Math.random()+0.5)==0)?-1:1;
  else dir=(pos==1)?1:-1;
  return (pos+dir);
}

// ?? ??? ?? ??? ? ?? ?? ??
function newIndex(idx)
{
  var x,y;

  x=getX(idx);
  y=getY(idx);
  if (Math.floor(Math.random()+0.5)==0) x=newDirection(x);
  else y=newDirection(y);
  return getIndex(x,y);
}

// ??? ??????? ?? ??
function isComplete()
{
  // ?? document.images[]? ???(? ??? ??? ?? ?? ???)? ?????? ???? ???? ??
  // completed? false??,
   puzzles = new Array();
    for ( ii = 0 ; ii < 16 ; ii++ ) {
        t = new Array();
        t = tokenize('/',document.images[ii].src);
//        alert(ii);
        nu =0;
        ten =1;
        for ( j = 0 ; j < 10 ; j++ ) {
            now = t[j].indexOf(".gif");
            if ( now == -1 ) continue;
            for ( k = now-1; k >= 0 ; k-- ) {
                if ( t[j][k] >= 0 && t[j][k] <= 9 ) {
                    nu = nu+ (t[j][k])*ten;
                    ten = ten*10;
                }
            }
            break;
        }
        puzzles[ii] = nu;
    }
    var ok = true;
    for ( var i = 1 ; i < 16 ; i++ ) {
        if ( puzzles[i] < puzzles[i-1] ) ok = false;
    }
    if ( ok && (!completed) ) {
        completed = true;
        alert("Congratulation!");
        return true;
    }
    else return false;
  // ??? ??? ???.
}

// ??? ??
function shuffle()
 {
  var puzzles=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
  // iter: ?? ??? ?? ??
  iter=Math.floor(Math.random()*200+0.5)+100;
  // puzzles ??? ???? ???.
  for(i=0;i<iter;i++){
	var som=Math.floor(Math.random()*15+0.5)+1;
	var where=newIndex(som);
	var trash=puzzles[som-1];
	puzzles[som-1]=puzzles[where-1];
	puzzles[where-1]=trash;
	}
  // puzzles[] ??? ??? ??? ??????? ??? ? ????? ?? ???.
  
	// ?? ?? ???? ?? document.images[]? ?? ??
  for (var i=0;i<16;i++)
  {
  document.images[i].src=puzzles[i]+ '.gif';
  }
  
  // ??? ??? ??? ?? ????? completed ??? false? ???
  completed=false;
}

// ?? ??? ??
function movePiece(idx)
{
  // ????? idx ?? ?? ?? ????? ?? ?? ?? ??? ????.
  // ?? ? ??? 16?? blank? ????? ? ??? ??? ????.

   var x = getX(idx); // x: ??? ?? ??? ??????? x ??
   var y = getY(idx);// y: ??? ?? ??? ??????? y ??
  flag = 0;
  // flag: ??? ???? 1, ??? 0
  // midx: ????? ?? ??
	var moveleft=getIndex(x-1, y);
		var movedown=getIndex(x, y+1);
		var moveright=getIndex(x+1, y);
		 var moveup=getIndex(x, y-1);
  if(0 <= moveleft && moveleft<16 && flag!=1)
  {
    targetArray = tokenize("/", document.images[moveleft].src);
	if(targetArray[targetArray.length-1] == "16.gif")
	{
	flag++;
	var midx = moveleft;}
	
	}
	
	
  if(0 <= movedown && movedown<16 && flag!=1)
  {
    targetArray = tokenize("/", document.images[movedown].src);
	if(targetArray[targetArray.length-1] == "16.gif")
	{
	flag++;
	var midx = movedown;
	}
	
	}
	if(flag==1){
	var temp = puzzles[idx];
	puzzles[idx] = puzzles[midx];
	puzzles[midx] = temp;
	}
  if(0 <= moveright && moveright<16 && flag!=1)
  {
    targetArray = tokenize("/", document.images[moveright].src);
	if(targetArray[targetArray.length-1] == "16.gif")
	{
	flag++;
	var midx = moveright;

	}
	
	}

  if(0 <= moveup && moveup<16 && flag!=1)
  {
    target = tokenize("/", document.images[moveup].src);
	if(target[target.length-1] == "16.gif")
	{
	flag++;
	var midx = moveup;
	}
	
	}

  // ??? ?? ??? ???? ???? ?? ??? ?? ???
  // ???? ?? ???(?? ?? ???? ??? 16?? ???? ?).
 
  // ???? ?? ????
  // ??? ?? ?? ??? ? ??? ?????.
   
  // ??? ?????? ????
  // ??? ??? ???,
  // "Congratulation!" ???? ???(alert box)?? ???? completed ??? true? ????.
}
    </script>

</head>

<body bgcolor="silver" text="black" link="#0000EE" vlink="#551A8B" alink="red">
    <h2 align="center">
        15 Puzzle</h2>
    <div align="center">
        <table border>
            <tr>
                <td width="50%" align="center">

                    <script language="JavaScript">
with(window.document)
  {
    open();
    writeln('<table border=1 cellpadding=0 cellspacing=1>');
    for(var i=1;i<17;i++)
       {
         if(i==1 || i==5 || i==9 || i==13 )
           {
             writeln('<tr>');
           }
         writeln('  <td width=49 height=49>');
         writeln('      <a href=JavaScript:void(0);>');
         writeln('       <img src=',i,'.gif border=0 width=49 height=49 name=i',i,'></a>');
         writeln('  </td>');
         if(i==4 || i==8 || i==12 || i==16 )
           {
              writeln('</tr>');
           }
        }
      writeln('</table>');
      close();
    }
                    </script>

                </td>
            </tr>
        </table>
    </div>
    <p align="center">
        <br>
    </p>
    <form method="get">
    <p align="center">
        <input type="button" value="??" onclick="shuffle()"></p> 
    </form>
</body>
</html>