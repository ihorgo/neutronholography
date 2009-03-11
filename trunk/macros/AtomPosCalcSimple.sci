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

function ats=AtomPosCalcSimple(poss)

  ats.name='atompos';
  ats.history='AtomPosCalcSimple';
  ats.ats=poss;
  s=size(poss);
  select s(2)
    case 3
      ats.ats(:,4:5)=1;
      ats.ats(:,6)=sum(ats.ats(:,1:3).^2,'c').^0.5;
      ats.ats(:,7)=ats.ats(:,4)./ats.ats(:,6);
    case 4
      ats.ats(:,5)=1;
      ats.ats(:,6)=sum(ats.ats(:,1:3).^2,'c').^0.5;
      ats.ats(:,7)=ats.ats(:,4)./ats.ats(:,6);
    case 5
      ats.ats(:,6)=sum(ats.ats(:,1:3).^2,'c').^0.5;
      ats.ats(:,7)=ats.ats(:,4)./ats.ats(:,6);
  end;
endfunction
            
            
  
