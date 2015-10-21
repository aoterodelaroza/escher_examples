#! /usr/bin/octave -q

cr = cr_read_espresso("li.scf.out",0);
mol = cr_crystalbox(cr,[-0.05 -0.25 -0.05],[1.05 1.25 1.05]);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);
rep = rep_setdefaultscene_tessel(rep,:,:,0.6);
#rep_write_obj(rep,"li.obj");
rep_write_pov(rep,"li.pov");
run_povray("li");

cr = cr_read_espresso("al.scf.out",0);
mol = cr_crystalbox(cr,[-0.05 -0.25 -0.05],[1.05 1.25 1.05]);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);
rep = rep_setdefaultscene_tessel(rep,:,:,0.6);
#rep_write_obj(rep,"al.obj");
rep_write_pov(rep,"al.pov");
run_povray("al");
