// Written by Marton Marko
// marko@szfki.hu
// 
// AtomPosCalc function calculates the neighbours in a crystal until 
// distance<=r. 
// unitcell is made by function MkUnitCell, 
// r is the maximum distance from the origin
// varargin(1) gives the # of element what is the origin
// output:
// ats.name is 'atompos';
// ats.history is the history of used functions
// ats.ats is an nX7 matrix containing the positions in AA, scattering lengths
//  in fm,the numbers of the element, the distance from the origin (r), and
// the b/r value (amplitude of the hologram)

function ats=AtomPosCalc(unitcell,r,varargin)

  ats.name='atompos';

  
  if length(varargin)==1 then
// writing history;
    ats.history=AddHistory('','AtomPosCalc',unitcell,r,varargin(1));
    orig=varargin(1);
  else
// writing history;
    ats.history=AddHistory('','AtomPosCalc',unitcell,r);
    orig=1;
  end;

// checking whether there is special atom wich can be in more than
// one position in the unit cell
  s=max(size(unitcell.atn));
  specel.is=0;
  specel.isorig=0;
  elnums(1)=unitcell.atn(1).num;
  if orig==unitcell.atn(1).num then
    s_orig=max(size(unitcell.atn(1).nums));
  end;
  if orig==-1*unitcell.atn(1).num then
    s_orig2=max(size(unitcell.atn(1).nums));
  end;
  for n=2:s
    elnums(n)=unitcell.atn(n).num;
    if elnums(n)==-1*elnums(n-1) then
      specel.is=1;
      specel.elnums=[n-1,elnums(n-1);n,elnums(n)];
      if abs(specel.elnums(1,2))==orig then
        specel.isorig=1;
      end;
      
    end;
    if orig==unitcell.atn(n).num then
      s_orig=max(size(unitcell.atn(n).nums));
    end;
    if orig==-1*unitcell.atn(n).num then
      s_orig2=max(size(unitcell.atn(n).nums));
    end;
  end;
  if specel.is==1 & specel.isorig==0 then
    s_orig2=s_orig;
  end;
  
// if there is special atom, then there is two
// base unit cell
  if specel.is==1 then
    satn=size(unitcell.ats);
    nbaseatom=[0,0];
    for n=1:satn(1)
      select unitcell.ats(n,5)
        case specel.elnums(1,2) then

          
          nbaseatom(1)=nbaseatom(1)+1;
          base(nbaseatom(1),1:5)=unitcell.ats(n,:);
        case specel.elnums(2,2) then
          nbaseatom(2)=nbaseatom(2)+1;
          base2(nbaseatom(2),1:5)=unitcell.ats(n,:);
        else
          nbaseatom=nbaseatom+[1,1];
          base(nbaseatom(1),1:5)=unitcell.ats(n,:);
          base2(nbaseatom(2),1:5)=unitcell.ats(n,:);
      end;
    end;
  else
    base=unitcell.ats;
  end;
  Mx=ceil(r/norm(unitcell.vec(1,:)));
  My=ceil(r/norm(unitcell.vec(2,:)));
  Mz=ceil(r/norm(unitcell.vec(3,:)));
  ss=size(unitcell.ats);
  Mat=ss(1);
  ss=size(base);
  Mbase=ss(1);
  if specel.is==1
    Mbase2=ss(1);
  end;
  norig=0;
  norig2=0;
  for n=1:Mat
    if unitcell.ats(n,5)==orig
      norig=norig+1;
      origv(norig,1:3)=unitcell.ats(n,1:3);
      if specel.isorig==0 then
        norig2=norig;
        origv2(norig2,1:3)=unitcell.ats(n,1:3);
      end;
    end;
    if specel.isorig==1
      if unitcell.ats(n,5)==orig*-1
        norig2=norig2+1;
        origv2(norig2,1:3)=unitcell.ats(n,1:3);
      end;
    end;
  end;
  if norig==0
    disp('Bad element number for origin');
  end;
  if norig<>s_orig
    disp('Something is wrong in the unitcell data');
    s_orig=norig;
  end;
  if specel.is==0 then
    unitcell.ats(:,4)=unitcell.ats(:,4)/norig;
    base(:,4)=base(:,4)/norig;
  else
    unitcell.ats(:,4)=unitcell.ats(:,4)/norig/2;
    base(:,4)=base(:,4)/norig/2;
    base2(:,4)=base2(:,4)/norig2/2;
  end;

// writing the atomic positions
  atnum=0;
  for x=-Mx:Mx
    for y=-My:My
      for z=-Mz:Mz
        vd=[x,y,z]*unitcell.vec';
        if sum(abs([x,y,z]))>0 then
          for atn=1:Mat
            tmpv=vd+unitcell.ats(atn,1:3);
            for norig=1:s_orig
              v=tmpv-origv(norig,1:3);
              if norm(v)<r+1e-8
                if norm(v)>0.1
                  atnum=atnum+1;
                  tmpats(atnum,1:5)=[v,unitcell.ats(atn,4:5)];
                end;
              end;
            end;
          end;
        else
          for atn=1:Mbase
            tmpv=vd+base(atn,1:3);
            for norig=1:s_orig
              v=tmpv-origv(norig,1:3);
               if norm(v)<r+1e-8
                if norm(v)>0.1
                  atnum=atnum+1;
                  tmpats(atnum,1:5)=[v,base(atn,4:5)];
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
// writing the atomic positions if there are special atoms in the unit cell
//  which can sit in more than one positions.
  if specel.is==1
    unitcell.ats(:,4)=unitcell.ats(:,4)*norig/norig2;
    for x=-Mx:Mx
      for y=-My:My
        for z=-Mz:Mz
          vd=[x,y,z]*unitcell.vec;
          if sum(abs([x,y,z]))>0
            for atn=1:Mat
              tmpv=vd+unitcell.ats(atn,1:3);
              for norig2=1:s_orig2
                v=tmpv-origv2(norig2,1:3);
                 if norm(v)<r+1e-8
                  if norm(v)>0.1
                    atnum=atnum+1;
                    tmpats(atnum,1:5)=[v,unitcell.ats(atn,4:5)];
                  end;
                end;
              end;
            end;
          else
            for atn=1:Mbase
              tmpv=vd+base2(atn,1:3);
              for norig2=1:s_orig2
                v=tmpv-origv2(norig2,1:3);
                 if norm(v)<r+1e-8
                  if norm(v)>0.1
                    atnum=atnum+1;
                    tmpats(atnum,1:5)=[v,base2(atn,4:5)];
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;  
  tmpats2(1:atnum,2:6)=tmpats;
  tmpats2(:,1)=round(sum(tmpats(:,1:3).^2,'c').^0.5*1e8);
  tmpats2=sortrowsf(tmpats2,[1,6,2,3,4],6,'i');
  tmpats=tmpats2(:,2:6);
  atn=1;
  tmp(1,1:5)=tmpats(1,1:5);
  for n=2:atnum
    if iseq(tmpats(n,1:3),tmpats(n-1,1:3),6) & iseq(abs(tmpats(n,5)),abs(tmpats(n,5)),6) then
      tmp(atn,4)=tmp(atn,4)+tmpats(n,4);
    else
      atn=atn+1;
      tmp(atn,:)=tmpats(n,:);
    end;
  end;  
  tmp(:,6)=sum(tmp(:,1:3).^2,'c').^0.5;
  tmp(:,7)=tmp(:,4)./tmp(:,6);
  ats.ats=sortrowsf(tmp,[6,5,1,2,3],6,'i');
endfunction
            
            
  
