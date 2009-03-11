function H=ReconstHoloArb(recarr,h)

// Image processing procedures
  h=BgElHolo(h);
  execstr('H.hh=h.h','errcatch');
  execstr('H.hhmod=h.hmod','errcatch');

  H.name='ReconstHoloarb';

  H.history=AddHistory('','ReconstHoloArb',recarr,h);

  
  H.hx=h.X;
  H.hy=h.Y;
  H.hz=h.Z;
  H.hq=h.q;
  
  H.X=recarr.X;
  H.Y=recarr.Y;
  H.Z=recarr.Z;
  H.H=recarr.X*0;
  
  s=size(H.X);
  if max(size(s))<3
    mr=1;
  else
    mr=s(3);
  end;
  // background substraction and using the weight matrix (h.q)  
  sop=size(h.operations);
  
  for nr=1:mr;
    for th=1:s(1);
      for ph=1:s(2);
        tmp=ReconstHoloPt(h,[H.X(th,ph,nr),H.Y(th,ph,nr),H.Z(th,ph,nr)]);
        if max(size(tmp))==2
          tmpH(th,ph,nr)=tmp(1,1);
          tmpHmod(th,ph,nr)=tmp(1,2);
        else
          for n=1:max(size(tmp))-1
            tmpHm(th,ph,nr,n)=tmp(n,1);
            tmpHmmod(th,ph,nr,n)=tmp(n,2);
          end;
          tmpH(th,ph,nr)=tmp($,1);
          tmpHmod(th,ph,nr)=tmp($,2);
        end;
      end;
    end;
  end;
  if execstr('tmph=h.h','errcatch')==0
    if max(size(tmp))==2
      H.H=tmpH;
    else
      H.Hm=tmpHm;
      H.H=tmpH;
    end;
  end;
  if execstr('tmph=h.hmod','errcatch')==0
    if max(size(tmp))==2
      H.Hmod=tmpHmod;
    else
      H.Hmmod=tmpHmmod;
      H.Hmod=tmpHmod;
    end;
  end;
  

endfunction

        

