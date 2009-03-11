function a=probalatb()

U=MkUnitCell('PdH');
ats=AtomPosCalc(U,4);
ats.ats=[2 0 0 -1];

h=ConstHolo(ats,1,2);

atsarray=MkRecArray(3,0.1,[4,2,2]);

H=ReconstHoloArb(atsarray,h);
tmp=1+H.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,1)=atsarray.rec;
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,h);

h2=ConstHoloCompl(atsarray,1,2);
H2=ReconstHoloArb(atsarray,h2);
H2.Hmod=H2.Hmod/max(abs(H2.Hmod))*max(abs(H.Hmod));
tmp=1+H2.Hmod;
for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,2)=atsarray.rec;
h3=ConstHoloCompl(atsarray,1,2);
H3=ReconstHoloArb(atsarray,h3);
H3.Hmod=H3.Hmod/max(abs(H3.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,h,h2,h3);

tmp=1+H3.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,3)=atsarray.rec;

h4=ConstHoloCompl(atsarray,1,2);
H4=ReconstHoloArb(atsarray,h4);
H4.Hmod=H4.Hmod/max(abs(H4.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,h,h2,h3,h4);


tmp=1+H4.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,4)=atsarray.rec;
h5=ConstHoloCompl(atsarray,1,2);
H5=ReconstHoloArb(atsarray,h5);
H5.Hmod=H5.Hmod/max(abs(H5.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,h,h2,h3,h4,h5);

tmp=1+H5.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,5)=atsarray.rec;
h6=ConstHoloCompl(atsarray,1,2);
H6=ReconstHoloArb(atsarray,h6);
H6.Hmod=H6.Hmod/max(abs(H6.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,H6,h,h2,h3,h4,h5,h6);
tmp=1+H6.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,6)=atsarray.rec;
h7=ConstHoloCompl(atsarray,1,2);
H7=ReconstHoloArb(atsarray,h7);
H7.Hmod=H7.Hmod/max(abs(H7.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,H6,H7,h,h2,h3,h4,h5,h6,h7);

tmp=1+H7.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,7)=atsarray.rec;
h8=ConstHoloCompl(atsarray,1,2);
H8=ReconstHoloArb(atsarray,h8);
H8.Hmod=H8.Hmod/max(abs(H8.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,H6,H7,H8,h,h2,h3,h4,h5,h6,h7,h8);


tmp=1+H8.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,7)=atsarray.rec;
h9=ConstHoloCompl(atsarray,1,2);
H9=ReconstHoloArb(atsarray,h9);
H9.Hmod=H9.Hmod/max(abs(H9.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,H6,H7,H8,H9,h,h2,h3,h4,h5,h6,h7,h8,h9);

tmp=1+H9.Hmod;

for nn=1:21 
  tmpfi(1:51,1:21,nn)=atan(imag(tmp(:,:,nn)),real(tmp(:,:,nn))); 
end;
tmp2=real(tmp.*exp(%i*tmpfi*-1));
a=1-tmp2;

for nn=1:21 
  tmpa=a(1:51,1:21,nn);
  stmpa=(sign(tmpa)-1)/2;
  a2(1:51,1:21,nn)=tmpa+stmpa.*tmpa; 
end;

atsarray.rec=(1-a2).*exp(%i*tmpfi)-1;
rec(1:51,1:21,1:21,7)=atsarray.rec;
h10=ConstHoloCompl(atsarray,1,2);
H10=ReconstHoloArb(atsarray,h10);
H10.Hmod=H10.Hmod/max(abs(H9.Hmod))*max(abs(H.Hmod));
save('c:\users\murci\iratok\cikkeim\commenttwin\probalatscib.dat',rec,H,H2,H3,H4,H5,H6,H7,H8,H9,H10,h,h2,h3,h4,h5,h6,h7,h8,h9,h10);
a=1;
endfunction
