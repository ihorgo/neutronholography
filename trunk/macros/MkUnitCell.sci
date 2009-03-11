// Written by Marton Marko
// marko@szfki.hu
// 
// function MkUnitCell gets the name of the crystal, and generates
// the primitive cell of it. output:
// unitcell.name is 'unitcell'
// unitcell.specel (1 or 0) shows whether there are special atoms that can sit
//  in different places in the cell but not in all the possible spaces.
//  NH4Cl is such a crystal, where the ammonium ion can have two different 
//  orientation
// unitcell.ats is an nX5 matrix each column have the x,y,z coordinates in AA
//  the scattering lengths in fm, and the number of the elements
// unitcell.atn(n).name is the name of the n-th element,
// unitcell.atn(n).nums show that in which positions are the atoms of n-th element
// unitcell.vec is the base vectors of the crystal in AA 

function unitcell=MkUnitCell(name,varargin)

  unitcell.name='unitcell';
  unitcell.specel=0;
  
  select name
    case 'FCC'
// writing history;
      unitcell.history=AddHistory('','MkUnitCell',name);

      unitcell.ats=[0 0 0 1 1;0.5 0.5 0 1 1;0 0.5 0.5 1 1;0.5 0 0.5 1 1];
      unitcell.atn.nums=[1 2 3 4];
      unitcell.atn.name='element';
      unitcell.vec=[1 0 0;0 1 0;0 0 1];
    case 'Pb'
// writing history;
      unitcell.history=AddHistory('','MkUnitCell',name);

      unitcell=MkUnitCell('FCC');
      unitcell.ats(:,1:3)=unitcell.ats(:,1:3)*4.9508;
      unitcell.ats(:,4)=9.401;
      unitcell.atn.name='Pb';
      unitcell.vec=[1 0 0;0 1 0;0 0 1]*4.9508;
    case 'NH4Cl'
// writing history;
      unitcell.history=AddHistory('','MkUnitCell',name);

      a=3.83;
      // N
      unitcell.ats=[0 0 0 9.36 1];
      // H1
      atc=[1 1 1;-1 -1 1;1 -1 -1;-1 1 -1];
      atc=atc*1.03/3^0.5;
      unitcell.ats(2:5,1:3)=atc;
      unitcell.ats(2:5,4)=-3.7409/2;
      unitcell.ats(2:5,5)=2;
      // H2
      unitcell.ats(6:9,1:3)=-1*atc;
      unitcell.ats(6:9,4)=-3.7409/2;
      unitcell.ats(6:9,5)=-2;
      // Cl
      unitcell.ats(10,1:5)=[a/2,a/2,a/2,9.5792,3];
      unitcell.atn(1).nums=1;
      unitcell.atn(1).num=1;
      unitcell.atn(1).name='N';
      unitcell.atn(2).nums=[2:5];
      unitcell.atn(2).num=2;
      unitcell.atn(2).name='H1';
      unitcell.atn(3).nums=[6:9];
      unitcell.atn(3).num=-2;
      unitcell.atn(3).name='H2';
      unitcell.atn(4).nums=10;
      unitcell.atn(4).num=3;
      unitcell.atn(4).name='Cl';
      unitcell.vec=[a 0 0;0 a 0;0 0 a];
      
    case 'PdH'
      // writing history;
      unitcell.history=AddHistory('','MkUnitCell',name);
      
      a=3.8907;
      //Pd
      unitcell.ats(1:4,1:5)=[0, 0, 0, 9.401, 1;0.5*a, 0.5*a, 0, 9.401, 1;0, 0.5*a, 0.5*a, 9.401, 1;0.5*a, 0, 0.5*a, 9.401, 1];
      //H
      unitcell.ats(5,1:5)=[0.5*a, 0.5*a, 0.5*a, -3.7409, 2];
      
      unitcell.atn(1).nums=[1:4];
      unitcell.atn(1).num=1;
      unitcell.atn(1).name='Pd';
      
      unitcell.atn(2).nums=5;
      unitcell.atn(2).num=2;
      unitcell.atn(2).name='H';
      
      unitcell.vec=[a 0 0;0 a 0; 0 0 a];
  end;
endfunction
    
        
      
