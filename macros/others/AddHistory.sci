// Written by Marton Marko
// marko@szfki.hu
// 
// AddHistroy function gets the old history, add to them the history of 
// the argunents of the function, and at the end write the function name,
// and the arguments of it

function hist=AddHistory(histold,funname,varargin)
  
  s=length(varargin);
  svar=s;
  newhistn=0;

// counting the previous histories
  for nn=1:svar
    if type(varargin(nn))==15 | type(varargin(nn))==16 | type(varargin(nn))==17 then
      newhistn=newhistn+1;
      newhists(newhistn)=nn;
    end;
  end;

// writing the old histories
  if newhistn>0 then
    tmphist=varargin(newhists(1)).history;
    stmphist=size(tmphist);
    for nn=2:newhistn
      soldhist=size(varargin(newhists(nn)).history);
      tmphist($+1:$+soldhist(1))=varargin(newhists(nn)).history;
    end;
    tmphist($+1)=funname+'(';
  else
    tmphist(1)=funname+'(';
  end;
// writing the new function into the history
  s=size(tmphist);
  hnum=s(1);
  if svar(1)>0
    nn=1;

    select type(varargin(nn))
      case 15 then tmphist(hnum)=tmphist(hnum)+varargin(nn).name;
      case 16 then tmphist(hnum)=tmphist(hnum)+varargin(nn).name;
      case 17 then tmphist(hnum)=tmphist(hnum)+varargin(nn).name;
      else tmphist(hnum)=tmphist(hnum)+string(varargin(nn));
    end;
  end;
  for nn=2:svar(1)
    select type(varargin(nn))
      case 15 then tmphist(hnum)=tmphist(hnum)+','+varargin(nn).name;
      case 16 then tmphist(hnum)=tmphist(hnum)+','+varargin(nn).name;
      case 17 then tmphist(hnum)=tmphist(hnum)+','+varargin(nn).name;
    else 
      tmphist(hnum)=tmphist(hnum)+',';
      ss=allsize(varargin(nn));
      for ns=1:ss
        tmpvar=varargin(nn);
        tmphist(hnum)=tmphist(hnum)+string(tmpvar(ns))+' ';
      end;
    end;
  end;
  tmphist(hnum)=tmphist(hnum)+')';
  if length(histold)>0 then
    hist=[histold;tmphist];
  else
    hist=tmphist;
  end;
endfunction

        
