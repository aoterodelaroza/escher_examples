#! /usr/bin/octave -q

cr = cr_read_espresso("urea.scf.out");
mol = mol_readxyz("urea.xyz");

function rgb = colorscale(q,m)
  rgb = [255 255 255 0 0];
  if (q > 0)
    rgb(1:2) -= floor((q / m) * 255);
  else
    rgb(2:3) -= floor(-(q / m) * 255);
  endif
endfunction

qs = [0.48309326 1.35048571 -1.17798673 -0.88775211];

m = max(abs(qs));
rep = representation_();
rep = mol_ball(mol,rep,"H",:,:,colorscale(qs(1),m));
rep = mol_ball(mol,rep,"C",:,:,colorscale(qs(2),m));
rep = mol_ball(mol,rep,"N",:,:,colorscale(qs(3),m));
rep = mol_ball(mol,rep,"O",:,:,colorscale(qs(4),m));
rep = mol_stick(mol,rep,:,:,:,:,0.07,[0 0 0]);
rep = cr_unitcell(cr,rep,:,:,:,[0 0 0]);

rep_write_obj(rep,"urea.obj");

rep = rep_setdefaultscene_view3dscene(rep,[1.68 -14.30 4.83],[0.07 0.99 -0.14],[0.01 0.14 0.99]);
rep_write_pov(rep,"urea.pov");
run_povray("urea");


