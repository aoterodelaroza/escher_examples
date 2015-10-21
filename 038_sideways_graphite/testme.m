#! /usr/bin/octave -q

## Use gen_critic2.sh to create the graphite.m file
source("graphite.m");
cr = cr_moveorigin(cr,[0 0.1 0]);
cr = cr_insertvacuum(cr,2,40,:,1);

## cr_write_espresso(cr,"bleh.scf.in");

## fid = fopen("notcapped.xyz","w");
## fprintf(fid,"%d\n\n",cr.nat);
## for i = 1:cr.nat
##   fprintf(fid,"C %.10f %.10f %.10f\n",cr_x2c(cr,cr.x(i,:))*0.52917720859);
## endfor
## fclose(fid);

mol = mol_readxyz("capped.xyz");
for i = 1:mol.nat
  if (mol.atnumber(i) == 1)
    cr = cr_addatom(cr,cr_c2x(cr,mol.atxyz(:,i)/0.52917720859),1);
  endif
endfor
cr = cr_newcell(cr,[1/3 0 0],[0 1 0],[0 0 1]);

## cr_write_espresso(cr,"bleh.scf.in");

mol = cr_crystalbox(cr,:,[5.05 1.0 2.05]);

rep = cr_unitcell(cr);
rep = mol_ball(mol,rep,"C",:,-0.8);
rep = mol_ball(mol,rep,"H",:,-0.6);
rep = mol_stick(mol,rep,"C","C");
rep = mol_stick(mol,rep,"C","H");

rep_write_obj(rep,"bleh.obj");

rep = rep_setdefaultscene_view3dscene(rep,[0,17,-43],[0,0,1],[0,1,0]);
rep_write_pov(rep,"bleh.pov");
run_povray("bleh");
