function H=ReconstHoloSphere(r,thres,phres,h)

// Image processing procedures
  h=BgElHolo(h);
  H.hh=h.h;

  H.name='ReconstHoloSphere';

  H.history=AddHistory('','ReconstHoloSphere',r,thres,phres,h);

  G=MakeGrid(2*%pi/r,thres,phres,90);
//  H.history=AddHistory(H.history,'MakeGrid',2*%pi/r,thres,phres);
  
  H.hx=h.X;
  H.hy=h.Y;
  H.hz=h.Z;
  H.hq=h.q;
  H.hh=h.h;
  
  H.X=G.X;
  H.Y=G.Y;
  H.Z=G.Z;
  H.H=G.X*0;
  clear G;
  
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

        

