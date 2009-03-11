//  written by Marton Marko
//  Research Institute for Solid State Physics and Optics
//  marko@szfki.hu
//
// constholo function generates hologram from the atomic data ats
// with wavelentths wl. Ats is a matrix, it has 4 coumn: x, y and z
// coordinates of the atoms in AA, and the bounded scattering length (b)
// in fm multiplied by the weigth of an atom 
//
// The default grid is a grid with equidistant steps on the theta-phi plane
// with 1 degree resolution. Othervise the third input is the G grid what has 
// X, Y, Z and q hypermatrices signing the x,y,z coordinates of the measurement
// points in the k-space in 1/AA, and the weights of them. In this case wl is 
// indifferent

function h=ConstHoloCompl(ats,wl,varargin)
  
  h.name='ConstHolo';
  
  if ats.name=='atompos'
    atoms=ats.ats;
    r=sum(atoms(:,1:3).^2,2).^0.5;
    atoms(:,4)=atoms(:,4)*1e-5./r;
  end;
  if ats.name=='atsarr'
    ss=allsize(ats.X);
    atoms(:,1)=ats.X(1:ss);
    atoms(:,2)=ats.Y(1:ss);
    atoms(:,3)=ats.Z(1:ss);
    atoms(:,4)=ats.rec(1:ss);
    r=sum(atoms(:,1:3).^2,2).^0.5;
  end;
  if length(varargin)==0
// writing history;
    h.history=AddHistory('','ConstHolo',ats,wl);

    G=MakeGrid(wl,5,5,90);
//    h.history=AddHistory(h.history,'MakeGrid',wl,5,5);
  else
    if type(varargin(1))==1
// writing history;
      h.history=AddHistory('','ConstHolo',ats,wl,varargin(1));
      G=MakeGrid(wl,varargin(1),varargin(1));
// writing history;
//      h.history=AddHistory('h.history','MakeGrid',wl,varargin(1),varargin(1));
    else
      G=varargin(1);
    end;
  end;
  sss=size(G.X);
  s=size(G.k);
  for n=1:max(s)
    k(1:sss(1),1:sss(2),n)=G.k(n);
  end;

  tmph=G.X*0;
  bpr=atoms(:,4);
  s=size(atoms);
  for n=1:s(1)
    tmph=tmph+bpr(n)*exp(%i*(k*r(n)-G.X*atoms(n,1)-G.Y*atoms(n,2)-G.Z*atoms(n,3)));
  end;
  h.k=G.k;
  h.q=G.q;
  h.X=G.X;
  h.Y=G.Y;
  h.Z=G.Z;
  h.hmod=tmph+1;
  h.filt=h.X*0+1;
  h.mon=h.filt;
  h.status='modelled';
  h.operations='model calculation';
endfunction

