#! /usr/bin/octave -q

cr = cr_read_vasp("POSCAR","POTCAR");
cr_write_tessel(cr,"doped_si.tess");
cr_write_critic2(cr,"doped_si.incritic");

## crystalbox but remove the isolated atoms
mol = cr_crystalbox(cr,:,:,2); 

## Re-center molecule
cm = mol_cmass(mol,:,0);
for i = 1:length(mol.atname)
  mol.atxyz(:,i) -= cm;
endfor

## make the plot
rep = mol_ball(mol);
rep = mol_stick(mol,rep);

rep = rep_setdefaultscene_view3dscene(rep,[3 36 4.5],[0 -1 0],[0 0 1]);
rep_write_obj(rep,"siph_a.obj");
rep_write_pov(rep,"siph_a.pov");
run_povray("siph_a");


