function out=convdata(A,cy,cx)

  filt=A*0;
  tmpA=filt;
  s=size(tmpA);
  for nx=-cx:cx
    for ny=-cy:cy
      tmpA(max(1+ny,1):min(ny+s(1),s(1)),1:s(2))=tmpA(max(1+ny,1):min(ny+s(1),s(1)),:)+A(max(1-ny,1):min(-ny+s(1),s(1)),pmodulo([1:s(2)]-1+nx,s(2))+1);
      filt(max(1+ny,1):min(ny+s(1),s(1)),1:s(2))=filt(max(1+ny,1):min(ny+s(1),s(1)),:)+1;
    end;
  end;
  out=tmpA./filt;
endfunction



  
