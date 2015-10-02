#! /usr/bin/octave -q

mol = mol_readxyz("cube.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = rep_setdefaultscene_view3dscene(rep,[16.01 11.88 26.53],[-0.48 -0.34 -0.81],[-0.15 0.94 -0.31]);
rep = rep_addcube(rep,mol.atxyz(:,165)',mol.atxyz(:,67)',...
                 [100 208 100 135 135],[0 0 0],:,:,0.05);
rep_write_pov(rep,"cube.pov");
rep_write_obj(rep,"cube.obj");
run_povray("cube");

mol = mol_readxyz("sphere.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = rep_addsphere(rep,[0 0 0],5.1,0,[100 208 100 135 135]);
rep = rep_addsphere(rep,[0 0 0],5.1,1,[0 0 0]);
rep = rep_setdefaultscene_view3dscene(rep,[-18.12 -16.53 13.76],[0.64 0.59 -0.49],[-0.72 0.69 -0.12]);
rep_write_obj(rep,"sphere.obj");
rep_write_pov(rep,"sphere.pov");
run_povray("sphere");

