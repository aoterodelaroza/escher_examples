#! /usr/bin/octave -q

cr = cr_read_espresso("adipic_acid.scf.out",0);
mol = cr_molmotif(cr);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);
rep_write_obj(rep,"adipic_acid.obj");

rep = rep_setdefaultscene_view3dscene(rep,[0.46 -7.45 -10.14],[0.07 0.56 0.83],[0.03 -0.83 0.56]);
rep_write_pov(rep,"adipic_acid.pov");
run_povray("adipic_acid");

