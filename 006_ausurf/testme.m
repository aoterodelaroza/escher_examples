#! /usr/bin/octave -q

cr = cr_read_vasp("POSCAR",{"H","C","N","Au"});
mol1 = cr_crystalbox(cr,[-0.26 -0.26 -0.05],[1.10 1.20 0.30]);
mol2 = cr_crystalbox(cr,[0.10 0.10 0.30],[0.90 0.90 0.9]);
mol = mol_merge(mol1,mol2);
rep = representation_();
rep = mol_ball(mol,rep,"Au",0,1.5,:,"metal1");
rep = mol_ball(mol,rep,"C",:,0.5);
rep = mol_ball(mol,rep,"N",:,0.5);
rep = mol_ball(mol,rep,"H",:,0.3);
rep = mol_stick(mol,rep,"C","N");
rep = mol_stick(mol,rep,"C","C");
rep = mol_stick(mol,rep,"C","H");
rep = mol_stick(mol,rep,"N","H");
rep_write_obj(rep,"pyr.obj");
rep = rep_setdefaultscene_view3dscene(rep,[35.26 20.11 34.20],[-0.70 -0.33 -0.64],[-0.62 -0.17 0.77],:,0.5);
rep_write_pov(rep,"pyr.pov");
run_povray("pyr");
